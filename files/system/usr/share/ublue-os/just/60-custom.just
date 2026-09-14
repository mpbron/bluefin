# vim: set ft=make :

# Quarantine per-user desktop config after rebasing between desktops (pass --apply to act)
[group('System')]
reset-desktop-config *ARGS:
    @bash /usr/libexec/reset-desktop-config {{ ARGS }}
