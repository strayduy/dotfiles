local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

config.color_scheme = "tokyonight"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16

config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

-- Define leader as CTRL+a
config.leader = {
	key = "a",
	mods = "CTRL",
	timeout_milliseconds = 1000,
}

-- When herdr is the foreground process, pass the prefix + key through
-- to herdr instead of letting wezterm handle it.
local function conditional_leader_action(wezterm_action, key)
	return wezterm.action_callback(function(window, pane)
		local proc = pane:get_foreground_process_name() or ""
		if proc:find("herdr") then
			window:perform_action(act.SendKey({ key = "a", mods = "CTRL" }), pane)
			window:perform_action(act.SendKey({ key = key }), pane)
		else
			window:perform_action(wezterm_action, pane)
		end
	end)
end

config.keys = {
	-- Create tab pane
	{
		key = "c",
		mods = "LEADER",
		action = conditional_leader_action(act.SpawnTab("CurrentPaneDomain"), "c"),
	},
	-- Navigate tab panes
	{
		key = "n",
		mods = "LEADER",
		action = conditional_leader_action(act.ActivateTabRelative(1), "n"),
	},
	{
		key = "p",
		mods = "LEADER",
		action = conditional_leader_action(act.ActivateTabRelative(-1), "p"),
	},
	-- Rename tab pane
	{
		key = ",",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

return config
