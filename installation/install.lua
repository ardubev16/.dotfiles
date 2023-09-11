local log = require('installation.logging')
local assert_cmd = require('installation.utils').assert_cmd
local HOME = os.getenv('HOME')

return {
    -- NOTE: Brew should already be installed by init.sh
    brew = function(pkg_name)
        assert_cmd('brew install ' .. pkg_name)
    end,

    apt = function(pkg_name)
        assert_cmd('sudo apt install -y ' .. pkg_name)
    end,

    pacman = function(pkg_name)
        assert_cmd('sudo pacman -S --noconfirm --needed ' .. pkg_name)
    end,

    dnf = function(pkg_name)
        assert_cmd('sudo dnf install -y ' .. pkg_name)
    end,

    manual = function(command)
        assert_cmd(command)
    end,

    font = function(distro, font)
        local VERSION = 'v2.3.3'

        log.info('Installing Nerd-Font: ' .. font)
        if distro == 'darwin' then
            font = font:lower()
            local cmd = 'brew tap homebrew/cask-fonts && brew install --cask font-'
                .. font
                .. '-nerd-font'
            assert_cmd(cmd)
        else
            local wget = 'wget https://github.com/ryanoasis/nerd-fonts/releases/download/'
                .. VERSION
                .. '/'
                .. font
                .. '.zip'
            local font_dir = HOME .. '/.local/share/fonts'
            local unzip = 'unzip ' .. font .. '.zip -d ' .. font_dir
            assert_cmd('mkdir -p ' .. font_dir)
            assert_cmd(wget)
            assert_cmd(unzip)
            assert_cmd('rm ' .. font .. '.zip')
            assert_cmd('fc-cache -fv')
        end
    end,
}
