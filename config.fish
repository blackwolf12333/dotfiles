set -gx ZELLIJ_AUTO_ATTACH true
set -gx ZELLIJ_AUTO_EXIT true

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

fish_add_path /home/peter/.local/bin/
fish_add_path /usr/local/sessionmanagerplugin/bin/

