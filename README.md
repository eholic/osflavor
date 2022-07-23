# osflavor  [![build](https://github.com/eholic/osflavor/actions/workflows/build.yml/badge.svg)](https://github.com/eholic/osflavor/actions/workflows/build.yml) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

> A [Fish](https://fishshell.com/) prompt that automatically adds OS-flavored symbols to your prompt.

![](osflavor.png)

## Installation

Install with [Fisher](https://github.com/jorgebucaran/fisher).

```console
$ fisher install eholic/osflavor
```

## Usage

Use `(__osflavor)` to customize your `~/config/fish/functions/fish_prompt.fish`.

Then `osflavor` will **automatically** uses OS-flavored symbols. Here's an example.

```fish
function fish_prompt
    set -g __osflavor_last_status $status # must be first line of code

    # the rest of your prompt...
    echo -n -s (__osflavor) (__fish_git_prompt " %s") ' '
end
```

#### If you are using [Nerd Font](https://github.com/ryanoasis/nerd-fonts)
You can use a single character os icon by adding the following option in your `~/.config/fish/config.fish`.

```fish
set -g __osflavor_use_nerd_font_icon 1
# must be before using (__osflavor)
```
> :pray: I got all definitions from [IlanCosman/tide](https://github.com/IlanCosman/tide).

### For other prompt user
Add the following option in your `~/.config/fish/config.fish`.
#### [IlanCosman/tide](https://github.com/IlanCosman/tide)
```fish
set -g tide_character_icon (__osflavor)
```

#### [pure-fish/pure](https://github.com/pure-fish/pure)
```fish
set -g pure_symbol_prompt (__osflavor) 
```

#### [jorgebucaran/hydro](https://github.com/jorgebucaran/hydro)
```fish
set -g hydro_symbol_prompt (__osflavor)
```

## Pre-defined Distributions

Default symbols are defined in [conf.d/osflavor.fish](conf.d/osflavor.fish) and [conf.d/__osflavor_nerd.fish](conf.d/__osflavor_nerd.fish).

If you want to change the default symbols, see [Customization](https://github.com/eholic/osflavor#customization).

- `osflavor list` lists pre-defined symbols.
- `osflavor set` `<name>` sets prompt as the other distribution.
- `osflavor set` clears above `set <name>`.

## Customization

The prompt symbols for each distribution can be specified using `__osflavor_dist_<name>`(global variable).

`<name>` should be a lowercased substring contained within `uname -a`.

```fish
# ~/.config/fish/config.fish

set -g __osflavor_dist_xlinxmint (set_color red)">"

# Overwrite pre-defined symbols.
set -g __osflavor_dist_darwin ">"
set -g __osflavor_dist_centos (set_color 9ccd2a)"⬉"(set_color a14f8c)"⬈"(set_color efa724)"⬊"(set_color 262577)"⬋"
```
