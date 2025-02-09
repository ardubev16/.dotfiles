#!/usr/bin/env lua

local HOME = os.getenv('HOME')
local ZDOTDIR = HOME .. '/.config/zsh'
local DOTFILES = HOME .. '/.dotfiles'

local config = require('installation.config')
local log = require('installation.logging')
local install = require('installation.install')
local assert_cmd = require('installation.utils').assert_cmd
local not_supported = require('installation.utils').not_supported

local function check_os()
    local distros_table = {
        endeavouros = 'arch',
        arch = 'arch',
        ubuntu = 'ubuntu',
        fedora = 'fedora',
    }

    local distro = io.popen('uname'):read()
    if distro == 'Darwin' then
        log.info('Mac OS detected!')
        return 'darwin'
    elseif distro == 'Linux' then
        log.info('Linux OS detected!')
        distro = io.popen([[grep "^ID=" /etc/os-release | cut -d "=" -f2 | sed -e 's/"//g']]):read()
        log.info(distro .. ' detected! ' .. distros_table[distro])
        return distros_table[distro]
    else
        not_supported()
    end
end

-- Supported distros and default package managers
local supported = {
    darwin = install.brew,
    arch = install.pacman,
    ubuntu = install.apt,
    fedora = install.dnf,
}

local function install_deps(distro, deps)
    for pkg, args in pairs(deps) do
        if args[distro] ~= nil then
            local current_pkg = args[distro]
            if current_pkg.ignore then
                log.info('Ignoring ' .. pkg)
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

local function pull_submodules()
    log.info('Pulling submodules')
    assert_cmd('git submodule update --init --recursive')
end

local function stow_dirs(dirs)
    for _, dir in ipairs(dirs) do
        log.info('Stowing ' .. dir)
        local cmd = 'cd ' .. DOTFILES .. ' && stow ' .. dir
        assert_cmd(cmd)
    end
end

local function set_zsh()
    log.info('Setting Zsh as default shell')
    assert_cmd('chsh -s $(which zsh)')
end

local function bundle_zsh_plugins()
    log.info('Bundling antibody plugins')
    local cmd = 'antibody bundle <' .. ZDOTDIR .. '/99-plugins.txt >' .. ZDOTDIR .. '/.plugins'
    assert_cmd(cmd)
end

local function nvim_setup()
    log.info('Setting up Neovim')
    assert_cmd('nvim --headless "+Lazy! sync" +qa')
end

local function install_i3xorg(distro)
    log.info('Do you want to install i3-xorg? [y/n] ')
    local answer = io.read() == 'y'
    if answer then
        log.info('Installing i3-xorg')
        install_deps(distro, config.i3xorg_deps)
        stow_dirs({ 'i3-xorg', 'alacritty' })
    else
        log.info('Not installing i3-xorg')
    end
end

-------------------------------------------------------------------------------

local current_os = check_os()
if supported[current_os] == nil then
    not_supported()
end
install_deps(current_os, config.dependencies)
install.font(current_os, config.font)

pull_submodules()
stow_dirs(config.stow_dirs)
set_zsh()
bundle_zsh_plugins()
nvim_setup()

-- install_i3xorg(current_os)

log.info('Run "exec zsh" to start Zsh')
