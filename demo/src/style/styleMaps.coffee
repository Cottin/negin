{__, contains, drop, map, match, max, min, none, repeat, split, tap, test, type} = R = require 'ramda' #auto_require: ramda
{$} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːfocus] = ['focus'] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

colors = require './colors'

warn = (msg) ->
	console.warn msg
	return {}

unit = (x, base = 0) ->
	if type(x) == 'Number'
		return (x + base) / 10 + 'rem'
	else if ! isNaN(x) # we allow numbers as strings to eg. '2' so we can be a bit lazy in parsing
		x_ = parseFloat(x)
		return (x_ + base) / 10 + 'rem'
	else
		RE = /^(-)?(\d+)\+(\d+)(vh|vw)?$/
		RE2 = /^(-?\d+)x$/
		if test RE, x
			[___, neg, num_, extra, vhvw] = match RE, x
			num = parseInt(num_) + base
			return "calc(#{neg && '-1 * ' || ''}(#{num/10}rem + #{extra * 5 / 10}#{vhvw || 'vw'}))"
		if test RE2, x # På test... känns inte som det är användbart
			[___, extra] = match RE2, x
			return parseInt(extra) * 5 / 10 + 'vh'
		else
			return x

f = (x) ->
	ret = {}
	if type(x) != 'String' then return warn "font expected type string, given: #{x}"
	
	RE = ///^
	([a-z_]) # family
	([\d]{1,2}(?:\+\d)?|_) # size
	((?:[a-z]{2,3})(?:-\d)?|__)? # color
	(\d|_)? # weight
	(\d|_)? # shadow
	$///

	if ! test RE, x then return warn "Invalid string given for font: #{x}"
	[___, family, size, clr, weight, shadow] = match RE, x

	switch weight
		when '_' then # noop
		when undefined then # noop
		else ret.fontWeight = parseInt(weight) * 100

	switch family
		# when 'a' then ret.fontFamily = "Avenir"
		# when 'a' then ret.fontFamily = "Open Sans"
		# when 'a' then ret.fontFamily = "Noto Sans"
		when 'a', 'l' then ret.fontFamily = "'Lato', sans-serif"
		# when '_' then # no-op
		else return warn "invalid family '#{family}' for t: #{x}"

	if size != '_' then ret.fontSize = unit size, 0

	if clr && clr != '__' then ret.color = colors(clr)

	switch shadow
		when '1' then ret.textShadow = '1px 1px 1px rgba(90,90,90,0.50)'
		when '2' then ret.textShadow = '1px 2px 0px #893D00'
		when '3' then ret.textShadow = '1px 2px 0px #000000'
		when undefined then # no-op
		when '_' then # noop
		else return warn "invalid text shadow '#{shadow}' for t: #{x}"

	return ret

bord = (x) -> border '', x
borb = (x) -> border '-bottom', x
bort = (x) -> border '-top', x
borl = (x) -> border '-left', x
borr = (x) -> border '-right', x


border = (side, x) ->
	if x == 0 then return "border#{side}": 'none'

	RE = new RegExp("^(#{colors.REstr})(_(\\d))?$")
	if ! test RE, x then return warn "Invalid string given for border: #{x}"
	[___, clr, ____, size] = match RE, x

	return "border#{side}": "#{unit(size || 1)} solid #{colors(clr)}"

place = (clr) ->
	color = colors(clr)

	#https://css-tricks.com/almanac/selectors/p/placeholder/
	'::-webkit-input-placeholder': {color} # Chrome/Opera/Safari
	'::-moz-placeholder': {color} # Firefox 19+
	':-ms-input-placeholder': {color} # IE 10+
	':-moz-placeholder': {color} # Firefox 18-

fs = (x) ->
	if x == 'i' then fontStyle: 'italic'
	else warn "invalid font style '#{x}'"

ls = (x) -> letterSpacing: unit x

colorHelp = (x) ->
	devColors = ['lime', 'white', 'teal', 'pink', 'red', 'green', 'blue', 'yellow', 'lightblue']
	if contains x, devColors then return x
	else return colors x


bg = (x) -> backgroundColor: colorHelp x

fill = (x) ->
	if x == 0 then fill: 'none'
	else fill: colorHelp x

stroke = (x) ->
	if x == 0 then stroke: 'none'
	else stroke: colorHelp x


op = (x) -> opacity: if x == 0 then 0 else x/10

ol = (x) -> outline: x

cur = (x) ->
	switch x
		when 'p' then cursor: 'pointer'
		when 'd' then cursor: 'default'
		else warn "invalid cur(sor) '#{x}'"

sh = (v) ->
	res = match /^(-?\d+)_(-?\d+)_(\d+)_(\d+)$/, v
	if ! res then return warn "Invalid string given for shadow: #{v}"
	[x, y, blur, spread] = $ res, drop(1), map (s) -> unit parseInt s

	boxShadow: "#{x} #{y} #{blur} #{spread} rgba(0,0,0,0.24)"


_sh1 = ->
	boxShadow: '0 -1px 3px 0 rgba(0,0,0,0.24)'

_sh2 = ->
	boxShadow: '0 1px 2px 0 rgba(0,0,0,0.28)'

_sh3 = ->
	boxShadow: '0 1px 13px 1px rgba(0,0,0,0.28)'

_sh4Old = ->
	boxShadow: '0 1px 3px 0 rgba(0,0,0,0.28)'

_sh4 = ->
	boxShadow: "0 1px 0 0 #{colors 'bk-2'}";

_sh5 = ->
	boxShadow: "0 1px 2px 1px #{colors 'bk-3'}";

_sh6 = ->
	boxShadow: '0 1px 3px 0 rgba(0,0,0,0.28)'

_sh7 = ->
	boxShadow: '0 1px 4px 0 rgba(0,0,0,0.48)'

_sh8 = ->
	boxShadow: '0 1px 1px 0 rgba(0,0,0,0.28)'

_sh9 = ->
	boxShadow: '2px 1px 2px 0 rgba(0,0,0,0.77)'

_sh10 = ->
	boxShadow: '0 1px 2px 1px rgba(0,0,0,0.12)'

_sha = (s) ->
	[h, v, blur, spread, clr] = split '_', s
	boxShadow: "#{h}px #{v}px #{blur}px #{spread}px #{colors clr}"

_ish1 = ->
	boxShadow: 'inset 0 1px 3px 0 rgba(0,0,0,0.50)'

_ish2 = ->
	boxShadow: 'inset 0 1px 2px 0 rgba(0,0,0,0.25)'

sha = (s) ->
	[h, v, blur, spread, alpha] = split '_', s
	boxShadow: "#{h}px #{v}px #{blur}px #{spread}px #{colors 'gy-'+alpha}"




_tsh1 = ->
	textShadow: '1px 1px 1px rgba(0, 0, 0, 0.4)'

_noTap = ->
	# https://stackoverflow.com/a/29961714/416797
	'-webkit-tap-highlight-color': 'rgba(0,0,0,0)'
	'-webkit-tap-highlight-color': 'transparent'


transi = '0.1s ease-out'
_day = ->
	# transition: transi
	# '& .dayLabels':
	# 	transition: transi

	':hover':
		'& .dayLabels':
			background: colors 'gya-1'

transi2 = '0.5s ease'
__week = ->
	'& .weekTotal':
		transition: transi2
		opacity: 0
	':hover':
		'& .weekTotal':
			opacity: 1

_hideAt = (x) ->
	"@media (max-width: #{x}px)":
		display: 'none'

_showAt = (x) ->
	"@media (min-width: #{x}px)":
		display: 'none'

_bgfade = ->
	transition: 'background-color 0.1s ease-out'

_opfade = (x) ->
	transition: "opacity #{x/10}s ease-out"

_small = ->
	transform: 'scale(0.1)'

_normal = ->
	transform: 'scale(1.0)'

_rec = ->
	# transition: transi
	# '& .white':
	# 	transition: transi
	# '& .blue':
	# 	transition: 'background ' + transi
	# '& .hh':
	# 	transition: transi
	# '& .mm':
	# 	transition: transi

	':hover':
		'& .blue':
			boxShadow: '0 1px 3px 0 rgba(0,0,0,0.38)'
			# background: colors 'bu-1'
			# borderLeft: "1px solid #{colors('wh-5')}"
			# paddingLeft: unit 11
		# '& .white':
		# 	color: colors 'wh-9'
		'& .hours':
			color: colors 'bub'
		'& .minutes':
			color: colors 'bub-5'


_blur = ->
	filter: "url('#blur1')"

_lingr = ->
	background: 'linear-gradient(-180deg, #33C663 0%, #36AE51 100%)'


_hovgy = ->
	':focus':
		outline:0
	':hover':
		background: '#F8F8F8'
		# color: colors 'rea'

_save = ->
	':focus':
		outline:0
		background: 'linear-gradient(-180deg, #33C663 0%, #36AE51 100%)'
		color: colors 'wh'
	':hover':
		background: 'linear-gradient(-180deg, #33C663 0%, #36AE51 100%)'
		color: colors 'wh'

_reportRow = ->
	':hover':
		'& .row':
			boxShadow: '0 1px 3px 0 rgba(0,0,0,0.38)'
		'& .hours':
			color: colors 'bub'
		'& .minutes':
			color: colors 'bub-5'


_lingn = ->
	background: 'linear-gradient(-180deg, #33C663 0%, #36AE51 100%)'

_extraRight = ->
	transform: 'translateX(100%)'

_extraLeft = ->
	transform: 'translateX(-100%)'

_top = ->
	'& .topHide':
		transition: '0.2s ease'
		opacity: 0.6
	':hover':
		'& .topHide':
			opacity: 0.6

_taskBar = ->
	'& .percent':
		transition: '0.2s ease'
		opacity: 0.0
	':hover':
		'& .percent':
			opacity: 1.0

_statsRow = ->
	':hover':
		'& .row':
			background: colors 'gyd'
		'& .arrow':
			fill: colors 'bk-5'


_ho = (bg) ->
	':hover':
		background: colors bg

_hofi = (fill) ->
	':hover':
		fill: colors fill

_fofi = (fill) ->
	':focus':
		outline: 'none'
		fill: colors fill

_rot = (deg) ->
	transform: "rotate(#{deg}deg)"

_spinner = ->
	animation: 'spin 2s linear infinite'

_noLink = -> {} # TODO ?

# Only use when input is part of bigger component which as outline or if you're creating a custom ːfocus style
# https://a11yproject.com/posts/never-remove-css-outlines/
_noOut = ->
	':focus':
		outline: 'none'
		boxShadow: 'none'

_fade1 =  ->
	transition: 'linear 2s'

out = (n) ->
	if n == 0 then {outline: 'none'}
	else {}

# Keep in mind: https://a11yproject.com/posts/never-remove-css-outlines/
_out = ->
	':focus':
		outline: 'none'
		boxShadow: "0 0 3px 2px #{colors 'bu-9'}"
		# transition: 'box-shadow linear 0.2s'

_2out = ->
	':focus':
		outline: 'none'
		boxShadow: "0 0 3px 2px #{colors 'bu'}"
		# transition: 'box-shadow linear 0.2s'

_out3 = ->
	':focus':
		outline: 'none'
		boxShadow: "0 0 4px 3px #{colors 'wh-9'}"
		# transition: 'box-shadow linear 0.2s'

_skySmall = ->
	background: 'url(/public/Images/skySmall.svg) no-repeat'
	# SVG-scaling in browser leaves space around the svg, so overflowing a bit (>100% as workaround)
	backgroundSize: 'cover'
	backgroundPosition: 'center'
	
_sun = ->
	background: 'url(/public/Images/sun.svg) no-repeat'


#auto_export: none__
module.exports = {qq, qqq, _, warn, unit, f, bord, borb, bort, borl, borr, border, place, fs, ls, colorHelp, bg, fill, stroke, op, ol, cur, sh, _sh1, _sh2, _sh3, _sh4Old, _sh4, _sh5, _sh6, _sh7, _sh8, _sh9, _sh10, _sha, _ish1, _ish2, sha, _tsh1, _noTap, transi, _day, transi2, __week, _hideAt, _showAt, _bgfade, _opfade, _small, _normal, _rec, _blur, _lingr, _hovgy, _save, _reportRow, _lingn, _extraRight, _extraLeft, _top, _taskBar, _statsRow, _ho, _hofi, _fofi, _rot, _spinner, _noLink, _noOut, _fade1, out, _out, _2out, _out3, _skySmall, _sun}