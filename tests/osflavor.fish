@mesg "osflavor test"

function _decolor -a text
    string replace --all --regex '\e(\[[\d;]*|\(B\e\[)m' '' "$text"
end

@test "default" (osflavor set DEFAULT; _decolor (__osflavor)) = "❯❮❯"
@test "overwrite default" (osflavor set DEFAULT; set -g __osflavor_dist_DEFAULT ">"; _decolor (__osflavor)) = ">"
@test "microsoft" (osflavor set microsoft; _decolor (__osflavor)) = "■■■■"
@test "darwin" (osflavor set darwin; _decolor (__osflavor)) = "||||||"
@test "ubuntu" (osflavor set ubuntu; _decolor (__osflavor)) = "❯❯❯"
@test "fedora" (osflavor set fedora; _decolor (__osflavor)) = "❯❯❯"
@test "pi" (osflavor set raspberrypi; _decolor (__osflavor)) = "⡱❆"
@test "centos" (osflavor set centos; _decolor (__osflavor)) = "❖❖❖❖"
