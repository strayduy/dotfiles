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

config.keys = {
	-- Create tab pane
	{
		key = "c",
		mods = "LEADER",
		action = act.SpawnTab("CurrentPaneDomain"),
	},
	-- Navigate tab panes
	{
		key = "n",
		mods = "LEADER",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "p",
		mods = "LEADER",
		action = act.ActivateTabRelative(-1),
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
