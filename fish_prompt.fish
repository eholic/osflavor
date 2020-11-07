function fish_prompt
    set -l __last_status $status

    set -l black (set_color black)
    set -l red (set_color -o red)
    set -l green (set_color green)
    set -l yellow (set_color yellow)
    set -l blue (set_color blue)
    set -l magenta (set_color magenta)
    set -l cyan (set_color cyan)
    set -l white (set_color white)
    set -l normal (set_color normal)

    # default prompt
    set -l arrow "$cyan❯❮❯"
    # OS-flavored prompt
    switch (string lower (uname -a))
        case '*microsoft*'
            # Four Windows
            set -l ms_o (set_color f25022 red)
            set -l ms_g (set_color 74ba00 green)
            set -l ms_b (set_color 00a4ef blue)
            set -l ms_y (set_color ffb900 yellow)

            if test $__last_status = 0
                set arrow "$ms_o■$ms_g■$ms_b■$ms_y■"
            else
                set arrow "$red■■■■"
            end
        case '*darwin*'
            # Classic Macintosh Rainbow
            set -l mac_g (set_color 61bb46 green)
            set -l mac_y (set_color fdb827 yellow)
            set -l mac_o (set_color f5821f yellow)
            set -l mac_r (set_color e03a3e red)
            set -l mac_p (set_color 9a3d97 magenta)
            set -l mac_b (set_color 009ddc blue)

            if test $__last_status = 0
                set arrow "$mac_g|$mac_y|$mac_o|$mac_r|$mac_p|$mac_b|"
            else
                set arrow "$red||||||"
            end
        case '*ubuntu*'
            # Ubuntu - https://design.ubuntu.com/brand/colour-palette/
            set -l ubuntu_o (set_color e95420 yellow)   # Orange
            set -l ubuntu_a (set_color 5e2750 magenta)  # Mid Aubergine
            set -l ubuntu_g (set_color aea79f white)    # Warm Grey

            if test $__last_status = 0
                set arrow "$ubuntu_g❯$ubuntu_a❯$ubuntu_o❯"
            else
                set arrow "$red❯❯❯"
            end
        case '*raspberrypi*'
            # Raspberry Pi - https://static.raspberrypi.org/files/Raspberry_Pi_Visual_Guidelines.pdf
            set -l pi_r (set_color c51a4a red)
            set -l pi_g (set_color 6cc04a green)

            if test $__last_status = 0
                set arrow "$pi_g❯$pi_r❆"
            else
                set arrow "$red❯❆"
            end
        case '*'
            if test $__last_status = 0
                set arrow "$cyan❯❮❯"
            else
                set arrow "$red❯❮❯"
            end
    end

    if test "$USER" = 'root'
        set arrow "$red#"
    end

    echo -n -s $arrow ' '$normal
end
