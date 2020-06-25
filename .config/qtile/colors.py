_colors = [
	'ae60ff', # panel bg
	'434758', # current screen tab bg
	'ffffff', # group name text
	'8d62a9', # focused window border line
	'000000', # unfocused windows border line
	'8be9fd', # even widgets
	'ff79c6', # window name + odd widgets
]

map_color = lambda c: [f'#{c}', f'#{c}']

colors = tuple(map(map_color, _colors))
