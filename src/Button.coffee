contains = require('ramda/src/contains'); flip = require('ramda/src/flip'); match = require('ramda/src/match'); omit = require('ramda/src/omit'); prop = require('ramda/src/prop'); props = require('ramda/src/props'); test = require('ramda/src/test'); type = require('ramda/src/type'); #auto_require: srcramda
{func} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːgreen, ːtext, ːveryBad, ːred, ːsmall, ːgrey, ːveryGood, ːmedium, ːblue, ːpink, ːbrown, ːonClick, ːsubmit, ːwait, ːsquare, ːicon, ːraised, ːlight, ːlink, ːbad, ːML, ːcustom, ːkind, ːgood, ːneutral, ːindigo, ːlinkBlank, ːlarge, ːmodal, ːfree, ːsize, ːhue, ːbeveled, ːdark] = ['green', 'text', 'veryBad', 'red', 'small', 'grey', 'veryGood', 'medium', 'blue', 'pink', 'brown', 'onClick', 'submit', 'wait', 'square', 'icon', 'raised', 'light', 'link', 'bad', 'ML', 'custom', 'kind', 'good', 'neutral', 'indigo', 'linkBlank', 'large', 'modal', 'free', 'size', 'hue', 'beveled', 'dark'] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args

React = require 'react'
rfr = require 'react-functional-router'

BounceLoader = require 'react-spinners/BounceLoader'
useNegin = require './useNegin'
{keyCodes: {SPACE, ENTER}} = require './utils'
# colors = require '../../style/colors'
# icons = require './icons'
BounceLoader = require('react-spinners/BounceLoader').default;


_kind = [ːraised, ːfree, ːlink, ːmodal, ːicon, ːcustom, ːbeveled] # no default, must choose
_hue = [ːdark, ːlight, ːblue, ːgreen, ːpink, ːgrey, ːbrown, ːindigo, ːred] # default dark
_mood = [ːgood, ːbad, ːveryGood, ːveryBad] # default neutral
_size = [ːsmall, ːML, ːlarge] # default medium


WrapWait = ({_, wait, clr, children}) ->
	if wait
		_ {s: 'xrcc posr'},
			_ {s: 'op0'}, children
			_ {s: 'posa'},
				_ BounceLoader, {color: _.colors(clr), loading: true, size: 25}
	else children


Button = func.loose
	kind: new Set _kind
	hue〳: new Set _hue
	mood〳: new Set _mood
	size〳: new Set _size

	variation〳: String
	disabled〳: Boolean
	square〳: Boolean
	text〳: String
	icon〳: Function # ReactComponent
	link〳: [Object, Function]
	submit〳: Boolean
	linkBlank〳: Boolean
	wait〳: [Boolean, Number]
	href〳: String
	onClick〳: (e) -> # Will also be called onKeyDown == SPACE or ENTER
, 
(props) ->
	_ = useNegin()
	commonS = 'fo(out0) curp'
	commonProps = {tabIndex: 0}
	[touchStart, setTouchStart] = React.useState false
	onTouchStart = () ->
		if props.disabled || props.wait then return
		setTouchStart true
		flip(setTimeout) 500, -> setTouchStart false


	cleanProps = omit [ːkind, ːhue, ːsquare, ːtext, ːicon, ːonClick, ːsubmit, ːlinkBlank, ːlink, ːsize, ːwait], props

	if props.onClick && !props.wait && !props.disabled
		commonProps.onClick = props.onClick
		commonProps.onKeyDown = (e) ->
			if e.keyCode == SPACE || e.keyCode == ENTER then props.onClick()

	hue = props.hue || ːdark
	mood = props.mood || ːneutral
	size = props.size || ːmedium

	if props.link
		comp = rfr.Link
		cleanProps.link = props.link
	else if props.href
		comp = 'a'
		if props.disabled then cleanProps.href = 'javascript:void(0)' else cleanProps.href = props.href
	else if props.submit && !props.wait
		comp = 'button'
		cleanProps.type = 'submit'
	else
		comp = 'div'

	if props.linkBlank then cleanProps.target = '_blank'

	switch props.kind

		when ːraised
			fbase = 'fa13'
			switch mood
				when ːneutral
					if props.hue == 'dark'
						moodS = 'fa13bk-45 bggy-2 ho(bggy-3 f__bk-6)'
					if props.hue == 'grey'
						moodS = 'fa13bk-45 bggy-1 ho(bggy-2 f__bk-6)'
					else if props.hue == 'light'
						if props.variation == 'selected'
							moodS = 'fa13wh-94 bgbk-3 ho(bgbk-4 f__wh)'
						else
							moodS = "fa13wh-94 #{!props.wait && 'bgwh-1 ho(bgwh-2 f__wh)'}"
					else if props.hue == 'blue'
						moodS = 'fa13wh-94 bgbua ho(bgbud f__wh)'
					else if props.hue == 'brown'
						moodS = 'fa13bk-64 bgbw-1 ho(bgbw-2)'
				when ːveryGood
					moodS = 'fa13wh5 bggn-9 ho(bggn)'
				when ːveryBad
					moodS = 'fa13wh5 bgre-9 ho(bgre)'

			_ comp, {s: "#{commonS} xrcc ls0.2 #{props.square && 'p10 coa(p12)' || 'p10_20 coa(p15_20)'} #{moodS}
			#{touchStart && 'bgbuj'}",
			...commonProps, onTouchStart, ...cleanProps},
				if props.children
					props.children
				else if props.icon
					fill = if contains props.hue, ['dark', 'brown'] then _.colors('bk-6') else _.colors('wh-9')
					_ React.Fragment, {},
						_ props.icon, {fill, s: 'w16 h16 coa(w20 h20)'}
						if props.text then _ {s: 'ml6'}, props.text
				else
					_ WrapWait, {_, wait: props.wait, clr: 'wh'}, props.text


		when ːfree
			if props.hue == 'dark'
				designS = 'fa13bk-55 hofo(bggy-1)'
			else if props.hue == 'light'
				designS = "fa13wh-94 #{!props.wait && 'hofo(bgwh-1 f__wh)'}"
			else if props.hue == 'blue'
				designS = 'fa13bua-96 hofo(bggyb-3 f__bua)'

			_ comp, {s: "#{commonS} xr_c p7_15_7_12 coa(p10_15_10_15) #{designS} #{props.disabled && 'op6 hofo()'} 
			#{touchStart && 'bgbuj'}",
			...commonProps, onTouchStart, ...cleanProps},
				if props.icon
					_ React.Fragment, {},
						_ props.icon, {fill: _.colors('bk-6'), s: 'w19 h19 mr3'}
						_ {}, props.text
				else
					_ WrapWait, {_, wait: props.wait, clr: 'wh'}, props.text

		when ːlink
			clr = 'xx'
			if props.hue == 'dark'
				designS = 'disi tdu fa11bua-96 hofo(bggyb-1 f__ye)'
			else if props.hue == 'light'
				designS = 'disi tdu fa11ye-96 hofo(bggyb-1 f__ye)'
			else if props.hue == 'blue'
				designS = 'disi fa11bua-96 hofo(f__bub)'
			else if props.hue == 'indigo'
				designS = 'disi tdu fa11bui-96 hofo(f__bui) p0'
				clr = 'bui-9'
			else if props.hue == 'grey'
				designS = 'disi fa11gy-6	6 hofo(f__bk-7)'

			_ comp, {s: "#{commonS} xr_c p0_0 #{designS} #{cleanProps.s__}",
			...commonProps, ...cleanProps},
				if props.wait
					_ {s: 'xrcc posr'},
						_ {style: {opacity: 0}}, props.text
						_ {s: 'posa'},
							_ BounceLoader, {color: _.colors(clr), loading: true, size: 25}
				else
					props.text


		when ːmodal
			switch mood
				when ːveryBad then moodS = '_linre f__wh'
				when ːbad then moodS = 'bggyb-3 f__re'
				when ːneutral then moodS = 'bggyb-3 f__bk'
				when ːveryGood then moodS = '_lingn f__wh'

			if props.disabled
				designS = 'op6'

			_ comp, {s: "#{commonS} xg1 tac p17_0 ls1 f__bk-6 ttrau bortbk-1 borrbk-1
			ho(#{moodS}) #{touchStart && moodS} #{props.wait && moodS} #{designS}",
			...commonProps, onTouchStart, ...cleanProps},
				if props.wait
					_ {s: 'xrcc posr'},
						_ {style: {opacity: 0}}, props.text
						_ {s: 'posa'},
							_ BounceLoader, {color: 'white', loading: true, size: 25}
				else props.text

		when ːicon
			if !props.icon then throw new Error 'You must supply the icon prop'
			# if props.design == 'dark' then fill = _.colors 'bk' # design is a typo?
			if props.hue == 'dark' then bg = {fill: _.colors('bk-6'), ho: 'fillbk-5 bgbk-1'}
			else if props.hue == 'blue' then bg = {fill: _.colors('bub'), ho: 'fillbub bgbub-1'}
			else if props.hue == 'red' then bg = {fill: _.colors('re'), ho: 'fillpia'}
			else bg = {fill: _.colors('wh-4'), ho: 'fillbk-4 bgwh-3'}

			switch size
				when ːsmall then size = 10
				when ːmedium then size = 16
				when ːML then size = 20
				when ːlarge then size = 99
				else size = size

			if comp != 'div'
				_ comp, {...commonProps, ...cleanProps, onTouchStart,
				s: "#{commonS} disif p8 coa(p10) hofo(#{bg.ho}) #{touchStart && 'bgbuj'}"},
					_ props.icon, {fill: bg.fill, className: 'test123', s: "w#{size} h#{size} coa(w#{size+4} h#{size+4})"}
			else
				_ {...commonProps, ...cleanProps, s: "disif #{commonS} p8 hofo(#{bg.ho})"},
					_ props.icon, {fill: bg.fill, s: "w#{size} h#{size} coa(w#{size+4} h#{size+4})"}



		when ːcustom
			_ comp, {s: "#{commonS}",
			...commonProps, onTouchStart, ...cleanProps},
				if type(props.children) == 'Function' then props.children({touchStart})
				else props.children

		when ːbeveled
			if props.hue
				if props.hue == 'green'
					bg1 = 'gn'
					bg2 = 'gna'
					fclr = 'wh'
				else if props.hue == 'pink'
					bg1 = 'pib'
					bg2 = 'pic'
					fclr = 'wh'
				else if props.hue == 'grey'
					bg1 = 'buf'
					bg2 = 'buf-8'
					fclr = 'bk-4'

				if props.disabled
					designS = "fa14#{fclr}6 bg#{bg1}-6 br5 _sha0_2_1_0_bk-4 curd"
				else if props.wait
					designS = "fa14bk6 bg#{bg1}-8 br5 _sha0_2_1_0_bk-4 curd"

				else
					designS = "fa14#{fclr}6 bg#{bg1} br5 _sha0_2_1_0_bk-4 hofo(bg#{bg2} f__wh)"


			_ comp, {s: "#{commonS} xrcc ls0.2 p11_30 #{designS}",
			...commonProps, ...cleanProps},
				if props.wait
					waitSize = if type(props.wait) == 'Boolean' then 18 else props.wait
					_ {s: 'posr xrcc'},
						_ {s: "h#{waitSize}px op0"}, props.text
						_ {s: "posa top0 w#{waitSize}px"},
							# _ {s: ''}, 'Wait...'
							_ BounceLoader, {color: 'white', loading: true, size: waitSize}
				else if props.text then props.text
				else props.children




dottedButton = RE.dottedApi {kind: _kind, hue: _hue, mood: _mood, size: _size}, Button
module.exports = dottedButton
