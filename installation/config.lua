local M = {
    font = 'JetBrainsMono',
    stow_dirs = {
        'bin',
        'gdb',
        'git',
        'nvim',
        'tmux',
        'zsh',
    },
}

M.dependencies = {
    -- pkg_name = {
    --    <distro_name> = {
    --        ignore = true | false, -- if true, the package will not be installed (default: false)
    --        command = "<command>", -- fallback command if pkg is not in pkg_manager or has different name
    --        name = "<name>"        -- name if it contains "-" or is different from other distros
    --    }
    -- }
    antibody = {
        ubuntu = {
            command = [[curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin]],
        },
        arch = {
            command = [[curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin]],
        },
        fedora = {
            command = [[curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin]],
        },
    },
    bat = {},
    curl = {},
    fzf = {},
    gcc = {},
    gdb = {},
    git = {},
    jq = {},
    make = {},
    cmake = {},
    neovim = {
        ubuntu = {
            command = [[sudo add-apt-repository ppa:neovim-ppa/unstable -y && sudo apt update && sudo apt install -y neovim]],
        },
        fedora = {
            command = [[sudo dnf copr enable agriffis/neovim-nightly -y && sudo dnf install -y neovim]],
        },
    },
    ripgrep = {},
    stow = {},
    tmux = {},
    zsh = {},

    python3 = {
        darwin = {
            ignore = true,
        },
    },

    wget = {},
    unzip = {},
    xclip = {
        darwin = {
            ignore = true,
        },
    },
    xsel = {
        darwin = {
            ignore = true,
        },
    },
}

M.i3xorg_deps = {
    alacritty = {
        ubuntu = {
            ignore = true,
        },
    },
    i3 = {
        arch = {
            name = 'i3-gaps',
        },
    },
    polybar = {},
    rofi = {},
    dunst = {},
    polkit_gnome = {
        ubuntu = {
            ignore = true,
        },
        arch = {
            name = 'polkit-gnome',
        },
    },
    xss_lock = {
        ubuntu = {
            name = 'xss-lock',
        },
        arch = {
            name = 'xss-lock',
        },
    },
    i3lock_fancy = {
        ubuntu = {
            ignore = true,
            -- name = "i3lock-fancy"
        },
        arch = {
            command = [[yay -S i3lock-fancy-git]],
        },
    },
    i3lock_color = {
        ubuntu = {
            ignore = true,
        },
        arch = {
            command = [[yay -S i3lock-color-git]],
        },
    },
    lxappearance = {},
    scrot = {},
    slop = {},
    pcmanfm = {},
    blueman = {},
    feh = {},
    nitrogen = {},
    papirus = {
        ubuntu = {
            command = [[sudo add-apt-repository ppa:papirus/papirus -y && sudo apt update && sudo apt install -y papirus-icon-theme]],
        },
        arch = {
            name = 'papirus-icon-theme',
        },
    },
    gruvbox_dark_gtk = {
        ubuntu = {
            command = [[sudo git clone https://github.com/jmattheis/gruvbox-dark-gtk /usr/share/themes/gruvbox-dark-gtk]],
        },
        arch = {
            command = [[yay -S gruvbox-dark-gtk]],
        },
    },
}

return M
