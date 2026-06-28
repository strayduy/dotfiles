/**
 * Custom footer that fully replaces pi's built-in footer.
 *
 * Layout:
 *
 *   (<repo>/<branch>) $cost · <tokens>/<window> (<pct>%)            <model>
 *
 * Call `/footer` to toggle it off (restores the default) and on again.
 */

import { execFileSync } from "node:child_process";
import { basename } from "node:path";
import type { AssistantMessage } from "@earendil-works/pi-ai";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { truncateToWidth, visibleWidth } from "@earendil-works/pi-tui";

const fmt = (n: number) => (n < 1000 ? `${n}` : `${(n / 1000).toFixed(1)}k`);

/** Name of the git repo root containing `cwd`, falling back to the cwd basename. */
function repoName(cwd: string): string {
	try {
		const root = execFileSync("git", ["rev-parse", "--show-toplevel"], {
			cwd,
			encoding: "utf8",
			stdio: ["ignore", "pipe", "ignore"],
		}).trim();
		if (root) return basename(root);
	} catch {
		// not a git repo (or git missing) — fall through
	}
	return basename(cwd) || "~";
}

export default function (pi: ExtensionAPI) {
	const install = (ctx: Parameters<Parameters<ExtensionAPI["on"]>[1]>[1]) => {
		// Repo root is stable for the session; resolve it once.
		const repo = repoName(ctx.cwd);
		ctx.ui.setFooter((tui, theme, footerData) => ({
			dispose: footerData.onBranchChange(() => tui.requestRender()),
			invalidate() {},
			render(width: number): string[] {
				// Session cost total.
				let cost = 0;
				for (const e of ctx.sessionManager.getBranch()) {
					if (e.type === "message" && e.message.role === "assistant") {
						cost += (e.message as AssistantMessage).usage.cost.total;
					}
				}
				// Context usage: absolute tokens + percentage.
				const usage = ctx.getContextUsage();
				const ctxStr =
					usage && usage.tokens != null && usage.percent != null
						? `${fmt(usage.tokens)}/${fmt(usage.contextWindow)} (${Math.round(usage.percent)}%)`
						: "—";

				// (<repo>/<branch>) $cost · <tokens>/<window> (<pct>%)
				const branch = footerData.getGitBranch();
				const loc = branch ? `${repo}/${branch}` : repo;
				const left = theme.fg("dim", `(${loc}) $${cost.toFixed(3)} · ${ctxStr}`);

				const right = theme.fg("dim", ctx.model?.id || "no-model");

				const pad = " ".repeat(Math.max(1, width - visibleWidth(left) - visibleWidth(right)));
				return [truncateToWidth(left + pad + right, width)];
			},
		}));
	};

	pi.on("session_start", async (_event, ctx) => install(ctx));

	// Optional manual toggle.
	let enabled = true;
	pi.registerCommand("footer", {
		description: "Toggle the custom footer",
		handler: async (_args, ctx) => {
			enabled = !enabled;
			if (enabled) {
				install(ctx);
				ctx.ui.notify("Custom footer enabled", "info");
			} else {
				ctx.ui.setFooter(undefined);
				ctx.ui.notify("Default footer restored", "info");
			}
		},
	});
}
