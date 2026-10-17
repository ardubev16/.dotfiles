-- Hyprland config (Lua, Hyprland >= 0.55). Symlinked to ~/.config/hypr by desktops/hyprland/default.nix.
-- Hyprland and Noctalia are system packages (dnf). Mirrors desktops/sway/sway/config 1:1
-- (same keys, same workspace/monitor/app mapping); keep the two in sync.

local home     = os.getenv("HOME")
local terminal = "kitty"
local ipc      = "noctalia msg"
local mod      = "SUPER"

----------------------
---- ENVIRONMENT  ----
----------------------
-- The session starts with a minimal PATH (no ~/.nix-profile/bin), which breaks launcher
-- entries such as `Exec=Telegram`. Everything Hyprland spawns inherits this instead.
hl.env("PATH", home .. "/.nix-profile/bin:/nix/var/nix/profiles/default/bin:" .. home ..
    "/.local/bin:" .. home .. "/.cargo/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin")
hl.env("SSH_AUTH_SOCK", os.getenv("XDG_RUNTIME_DIR") .. "/gcr/ssh")
hl.env("TERMINAL", "kitty")
hl.env("LC_TIME", "en_US.UTF-8")

------------------
---- MONITORS ----
------------------
-- Desk: BenQ (left), Samsung Odyssey G5 (centre), laptop panel (right).
-- Connector names change with the dock port, so both variants are listed;
-- unknown outputs are ignored. Check with: hyprctl monitors all
hl.monitor({ output = "eDP-1", mode = "preferred",     position = "4480x360", scale = 1 })
hl.monitor({ output = "DP-2",  mode = "preferred",     position = "0x360",    scale = 1 })
hl.monitor({ output = "DP-4",  mode = "preferred",     position = "0x360",    scale = 1 })
hl.monitor({ output = "DP-3",  mode = "2560x1440@144", position = "1920x0",   scale = 1 })
hl.monitor({ output = "DP-5",  mode = "2560x1440@144", position = "1920x0",   scale = 1 })

-----------------------
---- WORKSPACES  ------
-----------------------
-- Default monitor per workspace: the first connected output in each list wins, the laptop
-- panel is the fallback so everything works with a single screen (same lists as sway).
local odyssey = { "DP-3", "DP-5", "eDP-1" }
local laptop  = { "eDP-1", "DP-3", "DP-5" }
local benq    = { "DP-2", "DP-4", "eDP-1" }
local pins = { odyssey, odyssey, odyssey, odyssey, odyssey, laptop, benq, benq, benq, benq }

local function first_connected(list)
    for _, name in ipairs(list) do
        local ok, m = pcall(hl.get_monitor, name)
        if ok and m then return name end
    end
    return list[#list]
end

local function apply_pins()
    for i = 1, 10 do
        hl.workspace_rule({ workspace = tostring(i), monitor = first_connected(pins[i]), persistent = true })
    end
end
apply_pins()
hl.on("monitor.added", apply_pins)

-- Smart gaps: a lone window (or a fullscreen one) has no gaps, border or rounding (sway: smart_gaps/smart_borders).
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
hl.window_rule({ name = "smart-gaps-w", match = { float = false, workspace = "w[tv1]" }, border_size = 0, rounding = 0 })
hl.window_rule({ name = "smart-gaps-f", match = { float = false, workspace = "f[1]" },   border_size = 0, rounding = 0 })

-- Open apps on their workspace without switching to it (sway `assign`; replaces GNOME auto-move-windows).
-- Native Wayland class = app_id; XWayland class = WM_CLASS.
local assign = {
    { "kitty",                              "1"  },
    { "brave-browser",                      "2"  },
    { "(?i)zen.*",                          "2"  },
    { "VirtualBox.*",                       "3"  },
    { "(?i)spotify",                        "7"  },
    { "(?i)(org\\.mozilla\\.)?thunderbird", "8"  },
    { "(?i)(discord|vesktop)",              "9"  },
    { "org\\.telegram\\.desktop",           "10" },
}
for n, a in ipairs(assign) do
    hl.window_rule({ name = "assign-" .. n, match = { class = "^" .. a[1] .. "$" }, workspace = a[2] .. " silent" })
end

-- Noctalia settings window floats
hl.window_rule({ name = "noctalia-settings", match = { class = "^dev\\.noctalia\\.Noctalia$" }, float = true })

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
    general = {
        gaps_in     = 3,   -- 6px between windows (3 per side), like sway `gaps inner 6`
        gaps_out    = 0,   -- no outer gap
        border_size = 2,
        col = {
            active_border   = "rgba(d79921ff)", -- gruvbox yellow
            inactive_border = "rgba(504945aa)",
        },
        layout = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,
        dim_inactive   = true,
        dim_strength   = 0.08,
        shadow = {
            enabled      = true,
            range        = 20,
            render_power = 3,
            color        = 0x66000000,
        },
        blur = {
            enabled = true,
            size    = 4,
            passes  = 2,
        },
    },

    animations = { enabled = true },

    dwindle = { preserve_split = true },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true, -- Noctalia draws the wallpaper
    },

    input = {
        kb_layout          = "us",
        kb_options         = "lv3:menu_switch,compose:ralt",
        numlock_by_default = true,
        repeat_delay       = 250,
        repeat_rate        = 50,
        follow_mouse       = 0, -- sway: focus_follows_mouse no
        touchpad = {
            natural_scroll = true,
            tap_to_click   = true,
        },
    },
})

-- Noctalia animates its own surfaces
hl.layer_rule({ name = "noctalia-no-anim", match = { namespace = "^noctalia-" }, no_anim = true })

---------------------
---- KEYBINDINGS ----
---------------------
-- Launchers / Noctalia
hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + space",  hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mod .. " + S",      hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mod .. " + comma",  hl.dsp.exec_cmd(ipc .. " settings-toggle"))
hl.bind(mod .. " + L",      hl.dsp.exec_cmd(ipc .. " session lock"))
hl.bind("ALT + Tab",        hl.dsp.exec_cmd(ipc .. " window-switcher hold"))

local lr = { locked = true, repeating = true }
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. " volume-up"),       lr)
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. " volume-down"),     lr)
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. " volume-mute"),     { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. " brightness-up"),   lr)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"), lr)

-- Screenshots (GNOME-style): area / screen / all screens
hl.bind("Print",         hl.dsp.exec_cmd(ipc .. " screenshot-region"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(ipc .. " screenshot-fullscreen pick"))
hl.bind("CTRL + Print",  hl.dsp.exec_cmd(ipc .. " screenshot-fullscreen all"))

-- Session: reload config / session menu
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mod .. " + SHIFT + E", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))

-- Windows
hl.bind(mod .. " + Q",         hl.dsp.window.close())
hl.bind(mod .. " + F",         hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind(mod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + down",  hl.dsp.focus({ direction = "down" }))
hl.bind(mod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))

-- Layout. Dwindle has no manual splith/splitv: it splits along the longer side, and
-- togglesplit flips a pair. Tabs are Hyprland groups.
hl.bind(mod .. " + B", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + V", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + E", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + W", hl.dsp.group.toggle())

-- Workspaces: Super+N switches, Super+Shift+N sends the window AND follows it
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = true }))
end

-- Monitors: focus another monitor / move the current workspace to another monitor
hl.bind(mod .. " + CTRL + H",         hl.dsp.focus({ monitor = "l" }))
hl.bind(mod .. " + CTRL + L",         hl.dsp.focus({ monitor = "r" }))
hl.bind(mod .. " + CTRL + SHIFT + H", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mod .. " + CTRL + SHIFT + L", hl.dsp.workspace.move({ monitor = "r" }))

-- Mouse: Super+drag moves, Super+right-drag resizes (sway floating_modifier)
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("noctalia")
end)
