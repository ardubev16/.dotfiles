#!/usr/bin/env lua

local HOME = os.getenv('HOME')
local ZDOTDIR = HOME .. '/.config/zsh'
local DOTFILES = HOME .. '/.dotfiles'

-- Define dependencies
-- local dep_font = 'Hack'
local dep_font = 'JetBrainsMono'
local dependencies = {
    -- pkg_name = {
    --    <distro_name> = {
    --        ignore = true | false, -- if true, the package will not be installed (default: false)
    --        command = "<command>", -- fallback command if pkg is not in pkg_manager or has different name
    --        name = "<name>"        -- name if it contains "-" or is different from other distros
    --    }
    -- }
    antibody = {
        ubuntu = {
            command = [[curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin]]
        },
        arch = {
            command = [[curl -sfL git.io/antibody | sudo sh -s - -b /usr/local/bin]]
        }
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
            command = [[sudo add-apt-repository ppa:neovim-ppa/unstable -y && sudo apt update && sudo apt install -y neovim]]
        },
    },
    ripgrep = {},
    stow = {},
    tmux = {},
    zsh = {},

    python2 = {
        darwin = {
            ignore = true
        }
    },
    python3 = {
        darwin = {
            ignore = true
        }
    },

    wget = {},
    xclip = {
        darwin = {
            ignore = true
        }
    },
    xsel = {
        darwin = {
            ignore = true
        }
    },
    -- lolcat,
    -- cowsay,
}

local i3xorg_deps = {
    alacritty = {
        ubuntu = {
            ignore = true
        },
    },
    i3 = {
        arch = {
            name = "i3-gaps"
        }
    },
    polybar = {},
    rofi = {},
    dunst = {},
    polkit_gnome = {
        ubuntu = {
            ignore = true
        },
        arch = {
            name = "polkit-gnome"
        }
    },
    xss_lock = {
        ubuntu = {
            name = "xss-lock"
        },
        arch = {
            name = "xss-lock"
        },
    },
    i3lock_fancy = {
        ubuntu = {
            ignore = true
            -- name = "i3lock-fancy"
        },
        arch = {
            command = [[yay -S i3lock-fancy-git]]
        },
    },
    i3lock_color = {
        ubuntu = {
            ignore = true
        },
        arch = {
            command = [[yay -S i3lock-color-git]]
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
            command = [[sudo add-apt-repository ppa:papirus/papirus -y && sudo apt update && sudo apt install -y papirus-icon-theme]]
        },
        arch = {
            name = "papirus-icon-theme"
        },
    },
    gruvbox_dark_gtk = {
        ubuntu = {
            command = [[sudo git clone https://github.com/jmattheis/gruvbox-dark-gtk /usr/share/themes/gruvbox-dark-gtk]]
        },
        arch = {
            command = [[yay -S gruvbox-dark-gtk]]
        }
    }
}

-- Define to_stow
local to_stow = {
    'bin',
    'gdb',
    'git',
    'nvim',
    'tmux',
    'zsh',
}

-------------------------------------------------------------------------------

-- Log functions
local function reset_color()
    io.write("\27[0m" .. "\n")
end

local log = {
    info = function(msg)
        io.write("\27[36m[*] " .. msg)
        reset_color()
    end,
    command = function(msg)
        io.write("\27[32m[+] " .. msg)
        reset_color()
    end,
    error = function(msg)
        io.write("\27[31m[!] " .. msg)
        reset_color()
    end,
}

local function not_supported()
    log.error("This OS is not yet supported.")
    os.exit(1)
end

local function check_os()
    local distros_table = {
        endeavouros = "arch",
	arch = "arch",
        ubuntu = "ubuntu",
    }

    local distro = io.popen('uname'):read()
    if distro == 'Darwin' then
        log.info("Mac OS detected!")
        return 'darwin'
    elseif distro == 'Linux' then
        log.info("Linux OS detected!")
        distro = io.popen([[grep "^ID=" /etc/os-release | cut -d "=" -f2 | sed -e 's/"//g']]):read()
        log.info(distro .. " detected! " .. distros_table[distro])
        return distros_table[distro]
    else
        not_supported()
    end
end

local function install_generic(pkg_manager_cmd, pkg_name)
    local cmd = pkg_manager_cmd .. pkg_name
    log.command(cmd)
    local status = os.execute(cmd)
    if status == nil then
        log.error('Failed to install ' .. pkg_name)
        os.exit(1)
    end
end

local install = {
    -- Brew should already be installed by init.sh
    brew = function(pkg_name)
        install_generic('brew install ', pkg_name)
    end,

    apt = function(pkg_name)
        install_generic('sudo apt install -y ', pkg_name)
    end,

    pacman = function(pkg_name)
        install_generic('yes | sudo pacman -S ', pkg_name)
    end,

    manual = function(command)
        log.command(command)
        local status = os.execute(command)
        if status == nil then
            log.error('Failed to install: ' .. command)
            os.exit(1)
        end
    end,

    font = function(distro, font)
        log.info("Installing Nerd-Font: " .. font)
        local status = true
        if distro == 'darwin' then
            font = font:lower()
            local cmd = 'brew tap homebrew/cask-fonts && brew install --cask font-' .. font .. '-nerd-font'
            log.command(cmd)
            status = os.execute(cmd)
        else
            local wget = 'wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/' .. font .. '.zip'
            local unzip = 'unzip ' .. font .. '.zip -d ' .. HOME .. '/.local/share/fonts'
            log.command(wget)
            status = status and os.execute(wget)
            log.command(unzip)
            status = status and os.execute(unzip)
            status = status and os.execute('rm ' .. font .. '.zip')
            status = status and os.execute('fc-cache -fv')
        end
        if status == nil then
            log.error('Failed to install: ' .. font)
            os.exit(1)
        end
    end,
}

-- Supported distros and default package managers
local supported = {
    darwin = install.brew,
    arch = install.pacman,
    ubuntu = install.apt,
}

local function install_deps(distro, deps)
    for pkg, args in pairs(deps) do
        if args[distro] ~= nil then
            local current_pkg = args[distro]
            if current_pkg.ignore then
                log.info("Ignoring " .. pkg)
            elseif current_pkg.command then
                install.manual(current_pkg.command)
            elseif current_pkg.name then
                supported[distro](current_pkg.name)
            end
        else
            supported[distro](pkg)
        end
    end
end

-- Stow stow_dirs
local function stow_dirs(dirs)
    for _, dir in ipairs(dirs) do
        log.info("Stowing " .. dir)
        local cmd = 'cd ' .. DOTFILES .. ' && stow ' .. dir
        local status = os.execute(cmd)
        if status == nil then
            log.error("Error stowing " .. dir .. ": " .. cmd)
            os.exit(1)
        end
    end
end

-- Use Zsh as default shell
local function set_zsh()
    log.info("Setting Zsh as default shell")
    local status = os.execute([[sudo chsh -s $(which zsh) $USER]])
    if status == nil then
        log.error("Error setting Zsh as default shell")
        os.exit(1)
    end
end

-- Bundle Zsh plugins
local function bundle_zsh_plugins()
    log.info("Bundling antibody plugins")
    local cmd = 'antibody bundle <' .. ZDOTDIR .. '/99-plugins.txt >' .. ZDOTDIR .. '/.plugins'
    local status = os.execute(cmd)
    if status == nil then
        log.error("Error bundling antibody plugins")
        os.exit(1)
    end
end

-- Install Neovim plugins
local function nvim_setup()
    log.info("Setting up Neovim")
    local status = os.execute('nvim --headless +PackerSync +quitall')
    if status == nil then
        log.error("Error setting up Neovim")
        os.exit(1)
    end
end

-- Install i3-xorg
local function install_i3xorg(distro)
    log.info("Do you want to install i3-xorg? [y/n] ")
    local ans = io.read() == "y"
    if ans then
        log.info("Installing i3-xorg")
        install_deps(distro, i3xorg_deps)
        stow_dirs({"i3-xorg", "alacritty"})
    else
        log.info("Not installing i3-xorg")
    end
end
-------------------------------------------------------------------------------

local current_os = check_os()
if supported[current_os] == nil then
    not_supported()
end
install_deps(current_os, dependencies)
install.font(current_os, dep_font)

stow_dirs(to_stow)
set_zsh()
bundle_zsh_plugins()
-- nvim_setup()

install_i3xorg(current_os)

log.info("Run \"exec zsh\" to start Zsh")
