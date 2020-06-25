import os
import socket
import subprocess

from libqtile.config import Screen
from libqtile.lazy import lazy
from libqtile.bar import Gap, Bar
from libqtile import widget

from colors import colors

widget_defaults = {
	'font': 'UbuntuMono Nerd Font Mono',
	'fontsize': 16,
	'padding': 0,
	'background': colors[0],
	'foreground': colors[2]
}

def covid(flag):
    result = subprocess.run(['/home/giancarlo/.scripts/covid.py', f'-{flag}'], stdout=subprocess.PIPE)
    return result.stdout.decode('utf-8').strip() + ' '

def icon_settings():
	return {
		'padding': 0,
		'fontsize': 28
	}

def left_arrow(color1, color2):
	return widget.TextBox(
		text = '\uE0B2',
		background = color1,
		foreground = color2,
		**icon_settings()
	)

def right_arrow(color1, color2):
	return widget.TextBox(
		text = '\uE0B0',
		background = color1,
		foreground = color2,
		**icon_settings()
	)

def init_widget_list(main: bool):
	time = lambda s, m, h: (h * 60 * 60) + (m * 60) + (s)
	left = [
		widget.Sep(
			linewidth = 0,
			padding = 20,
			background = colors[-2]
		),
		widget.GroupBox(
			background = colors[-2],
			this_current_screen_border = colors[-1],
			this_screen_border = colors[-1],
			hide_unused = True,
			rounded = True,
			highlight_method = 'block',
			fontsize = 20
		),
		widget.Prompt(
			background = colors[-2],
			prompt = f'{os.environ["LOGNAME"]}@{socket.gethostname()}: ',
			font = f'{widget_defaults["font"]} Bold'
		),
		right_arrow(colors[-1], colors[-2]),
		widget.CurrentLayout(
			fmt = ' {}',
			background = colors[-1],
			mouse_callback = {
				'Button1': lazy.next_layout,
				'Button2': lazy.prev_layout
			}
		),
		right_arrow(colors[0], colors[-1]),
		widget.TextBox(
			text = ' \uF2D2 ',
			**icon_settings()
		),
		widget.WindowName()
	]
	right = [
		left_arrow(colors[-1], colors[-2]) if main else left_arrow(colors[0], colors[-2]),
		widget.TextBox(
			text = '\uE214',
			background = colors[-2],
			**icon_settings()
		),
		widget.TextBox(
			text = covid('a'),
			background = colors[-2],
			update_interval = time(0, 0, 12) # seconds, minutes, hours
		),
		left_arrow(colors[-2], colors[-1]),
		widget.TextBox(
			text = '\uE214',
			background = colors[-1],
			**icon_settings()
		),
		widget.TextBox(
			text = covid('e'),
			background = colors[-1],
			update_interval = time(0, 0, 12) # seconds, minutes, hours
		),
		left_arrow(colors[-1], colors[-2]),
		widget.CapsNumLockIndicator(
			background = colors[-2]
		),
		widget.KeyboardLayout(
			background = colors[-2],
			configured_keyboards = ['us'],
			fmt = '⌨️ {}',
			padding = 4
		),
		left_arrow(colors[-2], colors[-1]),
		widget.TextBox(
			text = '',
			background = colors[-1],
			**icon_settings()
		),
		widget.CheckUpdates(
			distro = 'Arch_yay',
			execute = '$TERM -e sudo yay -Syu',
			display_format = '{updates}',
			background = colors[-1],
			padding = 4,
			update_interval = time(0, 0, 1) # seconds, minutes, hours
		),
		left_arrow(colors[-1], colors[-2]),
		widget.Volume(
			background = colors[-2],
			emoji = True
		),
		widget.Volume(
			background = colors[-2],
			padding = 4
		),
		left_arrow(colors[-2], colors[-1]),
		widget.Clock(
			format = '🕗 %H%M ',
			background = colors[-1]
		),
		widget.TextBox(
			text = '\uE0B3',
			background = colors[-1],
			**icon_settings()
		),
		widget.Clock(
			format = '%d/%m/%y',
			background = colors[-1]
		),
		widget.Sep(
			linewidth = 0,
			padding = 20,
			background = colors[-1]
		)
	]
	if main:
		right[:0] = [
			left_arrow(colors[0], colors[-1]),
			widget.Systray(
				background = colors[-1],
				icon_size = 20,
				padding = 0
			),
			widget.TextBox(
				text = ' ',
				background = colors[-1]
			)
		]
	return left + right

def init_screen(main: bool = False):
	gap = Gap(10)
	return Screen(
		bottom = gap,
		left = gap,
		right = gap,
		top = Bar(
			init_widget_list(main),
			26,
			background = colors[0][0],
			opacity = .75,
			margin = [0, 0, 10, 0]
		)
	)

screens = [
	init_screen(True),
	init_screen()
]
