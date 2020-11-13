# osflavor
> A [fish shell](https://fishshell.com/) plugin that automatically adds OS-flavored symbols to your prompt.

![](osflavor.png)

## Installation
Install with [jorgebucaran/fisher](https://github.com/jorgebucaran/fisher).
```console
$ fisher install eholic/osflavor
```

or install with [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish).
```console
$ omf install https://github.com/eholic/osflavor
```

Add `(__osflavor)` in your `.config/fish/functions/fish_prompt.fish`.
Then `osflavor` **automatically** uses OS-flavored symbols in response to your OS.

```fish
# example
function fish_prompt
    set -g __osflavor_last_status $status # must be first line of code
    # your prompt settings here
    echo -n -s (__osflavor) (__fish_git_prompt " %s") ' '
end
```

## Pre-defined Distributions
Default symbols are defined at [conf.d/osflavor.fish](conf.d/osflavor.fish).
If you want to change the default symbols, see [Customization](https://github.com/eholic/osflavor#customization).

- `osflavor list` lists pre-defined symbols.
- `osflavor set` `<name>` sets prompt as the other distribution.
- `osflavor set` clears above `set <name>`.

## Customization
The prompt symbols for each distribution can be specified using `__osflavor_dist_<name>`(global variable).
`<name>` should be **lower-case** substring contained within `uname -a`.

```fish
# .config/fish/config.fish

# newly define
set -g __osflavor_dist_xlinxmint (set_color red)">"

# overwrite pre-defined
set -g __osflavor_dist_darwin ">"
set -g __osflavor_dist_centos (set_color 9ccd2a)"⬉"(set_color a14f8c)"⬈"(set_color efa724)"⬊"(set_color 262577)"⬋"
```
