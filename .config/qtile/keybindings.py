from libqtile.config import Key
from libqtile.lazy import lazy
from libqtile import layout

mod = 'mod4'

keybindings = [
# Switch between windows in current stack pane
	Key([mod], 'Right', lazy.layout.down()),
	Key([mod], 'Left', lazy.layout.up()),

	# Move windows up or down in current stack
	Key([mod, 'shift'], 'Left', lazy.layout.shuffle_down()),
	Key([mod, 'shift'], 'Right', lazy.layout.shuffle_up()),

	# Switch window focus to other pane(s) of stack
	Key([mod], 'Tab', lazy.layout.next()),

	# Increase / decrease master window size
	Key([mod], 'equal', lazy.layout.increase_ratio()),
	Key([mod], 'minus', lazy.layout.decrease_ratio()),

	# Swap panes of split stack
	Key([mod, 'shift'], 'space', lazy.layout.rotate()),

	# Toggle between screeens
	Key([mod], 'grave', lazy.next_screen()),

	# Media keys
	Key([], 'XF86AudioRaiseVolume', lazy.spawn('pactl set-sink-volume 1 +5%')),
	Key([], 'XF86AudioLowerVolume', lazy.spawn('pactl set-sink-volume 1 -5%')),
	Key([], 'XF86AudioMute', lazy.spawn('pactl set-sink-mute 1 toggle')),
	Key([], 'XF86AudioPlay', lazy.spawn('playerctl play-pause')),
	Key([], 'XF86AudioNext', lazy.spawn('playerctl next')),
	Key([], 'XF86AudioPrev', lazy.spawn('playerctl previous')),

	# Toggle between split and unsplit sides of stack.
	# Split = all windows displayed
	# Unsplit = 1 window displayed, like Max layout, but still with
	# multiple stack panes
	Key([mod, 'shift'], 'Return', lazy.spawncmd()),
	Key([mod], 'Return', lazy.spawn('alacritty')),
	Key([mod, 'shift'], 'f', lazy.spawn('firefox-nightly')),
	Key([mod, 'shift'], 'b', lazy.spawn('brave')),
	Key([mod], 'x', lazy.spawn('/home/giancarlo/.scripts/emoji.sh')),
	Key([mod], "space", lazy.spawn('rofi -show run')),

	# Toggle between different layouts as defined below
	Key([mod, 'shift'], 'Tab', lazy.next_layout()),
	Key([mod, 'mod1'], 'space', lazy.window.toggle_floating()),
	Key([mod], 'w', lazy.window.kill()),
	Key([mod], 'f', lazy.window.toggle_fullscreen()),

	Key([mod, 'control'], 'r', lazy.restart()),
	Key([mod, 'control'], 'q', lazy.shutdown()),
	Key([mod], 'r', lazy.spawncmd()),
]
