# author: T.Imanishi
function __osflavor --description 'Write out OS-flavored symbols'
    # last command exit status
    set -q __osflavor_last_status; or set -l __osflavor_last_status 0

    set -l status_style (set_color normal)
    if test $__osflavor_last_status -ne 0
        set status_style (set_color -d -u)
    end

    # pre-defined color
    set -l black (set_color black)
    set -l red (set_color red)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l normal (set_color normal)

    # pre-defined osflavor for major distributions
    if not set -q __osflavor_dist_microsoft
        # Four Windows
        set -l ms_o (set_color f25022 red)
        set -l ms_g (set_color 74ba00 green)
        set -l ms_b (set_color 00a4ef blue)
        set -l ms_y (set_color ffb900 yellow)

        set __osflavor_dist_microsoft "$ms_o■$ms_g■$ms_b■$ms_y■"
    end

    if not set -q __osflavor_dist_darwin
        # Classic Macintosh Rainbow
        set -l mac_g (set_color 61bb46 green)
        set -l mac_y (set_color fdb827 yellow)
        set -l mac_o (set_color f5821f yellow)
        set -l mac_r (set_color e03a3e red)
        set -l mac_p (set_color 9a3d97 magenta)
        set -l mac_b (set_color 009ddc blue)

        set __osflavor_dist_darwin "$mac_g|$mac_y|$mac_o|$mac_r|$mac_p|$mac_b|"
    end

    if not set -q __osflavor_dist_ubuntu
        # Ubuntu - https://design.ubuntu.com/brand/colour-palette/
        set -l ubuntu_o (set_color e95420 yellow)   # Orange
        set -l ubuntu_a (set_color 5e2750 magenta)  # Mid Aubergine
        set -l ubuntu_g (set_color aea79f white)    # Warm Grey

        set __osflavor_dist_ubuntu "$ubuntu_g❯$ubuntu_a❯$ubuntu_o❯"
    end

    if not set -q __osflavor_dist_fedora
        # Fedora - https://fedoraproject.org/wiki/Logo/UsageGuidelines
        # terminal needs 24bit color suppert
        set -l fedora_b (set_color 3c6eb4 blue)  # Fedora Blue
        set -l fedora_d (set_color 294172 blue)  # Fedora Dark Blue
        set -l fedora_g (set_color white)        # White

        set __osflavor_dist_fedora "$fedora_g❯$fedora_d❯$fedora_b❯"
    end

    if not set -q __osflavor_dist_raspberrypi
        # Raspberry Pi - https://static.raspberrypi.org/files/Raspberry_Pi_Visual_Guidelines.pdf
        set -l pi_r (set_color c51a4a red)
        set -l pi_g (set_color 6cc04a green)

        set __osflavor_dist_raspberrypi "$pi_g❯$pi_r❆"
    end


    # default prompt
    set -l arrow "$cyan❯❮❯"

    # OS-flavored prompt
    # search defined $__osflavor_dist_{distname} within uname description
    if not set -q __osflavor_uname
        set __osflavor_uname (uname -a|string lower)
    end
    for x in (set -n | grep '__osflavor_dist_')
        set -l distname (string sub -s 17 $x)
        if string match -q "*$distname*" $__osflavor_uname
            set arrow (eval echo '$__osflavor_dist_'$distname)
            break
        end
    end

    if test "$USER" = 'root'
        set arrow "$red#"
    end

    echo -n -s $status_style $arrow $normal
end
