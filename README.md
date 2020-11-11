# osflavor
![](fish-terminal.png)

## Installation
```bash
$ fisher install eholic/osflavor
```

 Add `(__osflavor)` in your `.config/fish/functions/fish_prompt.fish`.

 ```fish
# example
function fish_prompt
    set -g __osflavor_last_status $status # must be first line

    echo -n -s (__osflavor) (__fish_git_prompt " %s") ' '
end
 ```

 ## Customization
 The prompt symbols for each distribution can specified using `__osflavor_dist_<name>`.
 `<name>` should be *lower-case* substring contained within `uname -a`.

 ```
# example
set -g __osflavor_dist_centos (set_color 9ccd2a green)"❖"(set_color efa724 yellow)"❖"(set_color a14f8c cyan)"❖"(set_color 262577 blue)"❖"
 ```
