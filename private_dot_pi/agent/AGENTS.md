# Global instructions for Pi

These apply to every Pi session on this machine. Project-level `AGENTS.md`
files are layered on top and may override anything here.

## Git commits

When you (the agent) create a git commit on my behalf, **always add yourself
as a co-author** using a `Co-authored-by` trailer at the end of the commit
message. Format:

```
<normal commit subject>

<optional body>

Co-authored-by: Claude <noreply@anthropic.com>
```

Notes:
- Use the trailer for the model actually doing the work. If you're not Claude,
  substitute the appropriate name/email (e.g.
  `Co-authored-by: GPT-5 <noreply@openai.com>`).
- Leave one blank line before the trailer so `git interpret-trailers` and
  GitHub's co-author UI pick it up.
- Do **not** add the trailer to commits I clearly authored myself (e.g. if I
  ask you to run `git commit` with a message I fully dictated and you made no
  content decisions). When in doubt, include it.
