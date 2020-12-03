{__, append, contains, inc, into, join, map, match, props, test, without} = R = require 'ramda' #auto_require: ramda
{$} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːwhite, ːblue, ːgreen, ːicon, ːpink, ːraised, ːlight, ːlink, ːlarge, ːmodal, ːfree, ːveryGood, ːbad, ːveryBad, ːsmall, ːcustom, ːbeveled, ːdark, ːgood] = ['white', 'blue', 'green', 'icon', 'pink', 'raised', 'light', 'link', 'large', 'modal', 'free', 'veryGood', 'bad', 'veryBad', 'small', 'custom', 'beveled', 'dark', 'good'] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'

Button = require 'negin/Button'
useNegin = require 'negin/useNegin'
# AutoComplete = require 'negin/AutoComplete'
DropDown = require 'negin/DropDown'
{useChangeState} = require 'negin/utils'
SVGmail = require './mail.svg'

colors = require '../style/colors'
Panels = require 'negin/Panels'
selectedTheme = require '../style/themes/selectedTheme'
tc = selectedTheme.themeColors

module.exports = () ->
	_ = useNegin()
	_ {s: 'bgza xg1 p20'},
		_ ColorsDemo, {}
		_ ButtonDemo, {}
		_ DropDownDemo, {}
		_ PanelDemo, {}
		# _ FlagDemo, {}

Box1 = (props) -> _ Box, {...props, level: 1}
Box2 = (props) -> _ Box, {...props, level: 2}
Box3 = (props) -> _ Box, {...props, level: 3}
Box4 = (props) -> _ Box, {...props, level: 4}
Box5 = (props) -> _ Box, {...props, level: 5}

Box = (props) ->
	_ = useNegin()
	switch props.level
		when 1 then clr = 'gy-6'
		when 2 then clr = 'bua'
		when 3 then clr = 're-7'
		when 4 then clr = 'bk-6'
		when 5 then clr = 'pu-3'

	lvl1 = props.level == 1

	_ {s: "mt10 xc__ xg1 #{lvl1 && 'mr20'}"},
		_ {s: "fa13#{clr}6 mb4"}, props.text || ''
		_ {s: "#{if props.bg then 'bg'+props.bg else lvl1 && 'bgwh'} borl#{clr}",
		style: lvl1 && {} || {backgroundColor: 'inherit'}},
			_ {s: 'ml5 p10', className: props.className},
				props.children


ColorsDemo = -> 
	_ = useNegin()
	_ {s: 'mb50'},
		_ {s: 'fa24bk-86'}, 'Colors'
		_ {s: 'mt20 xc__'}, 
			# _ Box1, {text: ''},
			# 	_ ColorBox2, {name: 'TODO: automatic raw colors'}

			# _ Box1, {text: ''},
			# 	_ ColorBox2, {name: 'App backgrounds'},
			# 		tc.za && _ ColorSquare, {clr: tc.za, themeColor: 'za',  text: 'First background'}
			# 		tc.zb && _ ColorSquare, {clr: tc.zb, themeColor: 'zb', text: 'Second background'}
			# 		tc.zc && _ ColorSquare, {clr: tc.zc, themeColor: 'zc', text: 'Third background'}
			# 		tc.zd && _ ColorSquare, {clr: tc.zd, themeColor: 'zd', text: 'Fourth background'}
			# 		tc.ze && _ ColorSquare, {clr: tc.ze, themeColor: 'ze', text: 'Fifth background'}

			# 	_ ColorBox2, {name: 'Backgrounds'},
			# 		tc.zf && _ ColorSquare, {clr: tc.za, themeColor: 'za',  text: 'First background'}
			# 		tc.zg && _ ColorSquare, {clr: tc.zb, themeColor: 'zb', text: 'Second background'}
			# 		tc.zh && _ ColorSquare, {clr: tc.zc, themeColor: 'zc', text: 'Third background'}
			# 		tc.zi && _ ColorSquare, {clr: tc.zd, themeColor: 'zd', text: 'Fourth background'}
			# 		tc.zj && _ ColorSquare, {clr: tc.ze, themeColor: 'ze', text: 'Fifth background'}

			_ Box1, {text: ''},
				_ ColorBox, {name: 'Black'},
					_ ColorSquare, {clr: 'bk-1'}
					_ ColorSquare, {clr: 'bk-2'}
					_ ColorSquare, {clr: 'bk-3'}
					_ ColorSquare, {clr: 'bk-4'}
					_ ColorSquare, {clr: 'bk-5'}
					_ ColorSquare, {clr: 'bk-6'}
					_ ColorSquare, {clr: 'bk-7'}
					_ ColorSquare, {clr: 'bk-8'}
					_ ColorSquare, {clr: 'bk-9'}
					_ ColorSquare, {clr: 'bk'}
				_ ColorBox, {name: 'Grey'},
					_ ColorSquare, {clr: 'gy'}
					_ ColorSquare, {clr: 'gya'}
					_ ColorSquare, {clr: 'gyb'}
					_ ColorSquare, {clr: 'gyc'}
					_ ColorSquare, {clr: 'gyd'}
				_ ColorBox, {name: 'Beige'},
					_ ColorSquare, {clr: 'be'}
				_ ColorBox, {name: 'Blue'},
					_ ColorSquare, {clr: 'bu'}
					_ ColorSquare, {clr: 'bua'}
					_ ColorSquare, {clr: 'bub'}
					_ ColorSquare, {clr: 'buc'}
					_ ColorSquare, {clr: 'bud'}
					_ ColorSquare, {clr: 'bue'}
					_ ColorSquare, {clr: 'buf'}
					_ ColorSquare, {clr: 'bug'}
					_ ColorSquare, {clr: 'buh'}
					_ ColorSquare, {clr: 'bui'}
				_ ColorBox, {name: 'Red'},
					_ ColorSquare, {clr: 're'}
					_ ColorSquare, {clr: 'rea'}
				_ ColorBox, {name: 'Green'},
					_ ColorSquare, {clr: 'gn'}
					_ ColorSquare, {clr: 'gna'}
					_ ColorSquare, {clr: 'gnb'}
				_ ColorBox, {name: 'Yellow'},
					_ ColorSquare, {clr: 'ye'}
					_ ColorSquare, {clr: 'yea'}
					_ ColorSquare, {clr: 'yeb'}
				_ ColorBox, {name: 'Brown'},
					_ ColorSquare, {clr: 'bw'}
				_ ColorBox, {name: 'Pink'},
					_ ColorSquare, {clr: 'pi'}
					_ ColorSquare, {clr: 'pia'}
					_ ColorSquare, {clr: 'pib'}
					_ ColorSquare, {clr: 'pic'}
				_ ColorBox, {name: 'x-colors'},
					_ ColorSquare, {clr: 'xpi'}
					_ ColorSquare, {clr: 'xpu'}
					_ ColorSquare, {clr: 'xvi'}
					_ ColorSquare, {clr: 'xbu'}
					_ ColorSquare, {clr: 'xgn'}
					_ ColorSquare, {clr: 'xye'}
					_ ColorSquare, {clr: 'xor'}
					_ ColorSquare, {clr: 'xre'}
					_ ColorSquare, {clr: 'xbr'}
					_ ColorSquare, {clr: 'xgy'}


ColorBox = ({name, children}) ->
	_ = useNegin()
	_ {s: 'mb10'},
		_ {s: 'fa13bk-75'}, name
		_ {s: 'xr__'},
			children

ColorBox2 = ({name, children}) ->
	_ = useNegin()
	_ {s: 'mb20'},
		_ {s: 'fa13bk-75 mb5'}, name
		_ {s: 'xc__'},
			children


ColorSquare = ({clr, themeColor, text}) ->
	_ = useNegin()
	_ {s: 'xr_c'},
		_ {s: 'xc_c'},
			# _ {s: "w40 h40 bg#{clr} xrcc fa10bk5"}, themeColor && "#{themeColor} - #{clr}" || clr
			_ {s: "w40 h40 bg#{clr} xrcc fa10#{_.colors.forBg(clr)}5"}, clr
			_ {s: 'fa6bk-73'}, join ', ', colors.hsb clr
		if text then _ {s: 'ml10'}, text

ButtonDemo = ->
	_ = useNegin()
	_ {s: 'mb50'},
		_ {s: 'fa24bk-86'}, 'Button'
		_ {s: 'mt20 xr__w'}, 
			# _ {s: 'fa15bk-86'}, 'kind'
			_ Box1, {text: 'kind = raised'},
				_ Box2, {text: 'mode = null = neutral (default)'},
					_ Box3, {text: 'hue = dark'},
						_ Button.raised.dark, {text: 'Click', icon: SVGmail}
					_ Box, {text: 'hue = light', s: 'bgzb', level: 3},
						_ Button.raised.light, {text: 'Click'}
						_ Box4, {text: 'variation = selected', s: 'bgzb'},
							_ Button.raised.light, {text: 'Click', variation: 'selected'}
					_ Box, {text: 'hue = blue', s: '', level: 3},
						_ Button.raised.blue, {text: 'Click'}
					_ Box, {text: 'hue = brown', s: '', level: 3, s: 'bgbe'},
						_ Button.raised.brown, {text: 'Click'}
					_ Box, {text: 'hue = brown', s: '', level: 3, s: 'bgbe'},
						_ {s: 'xr__'},
							_ Button.raised.brown, {icon: SVGmail, square: true, s: 'mr8'}
							_ Button.raised.brown, {icon: SVGmail, square: true, link: {a: (a) -> inc a || 0}}
				_ Box2, {text: 'mode = veryBad'},
					_ Button.raised.veryBad, {text: 'Click'}

			_ Box1, {text: 'kind = free'},
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = dark'},
						_ Button.free.dark, {text: 'Click', icon: SVGmail}
					_ Box3, {text: 'hue = light', s: 'bgbua'},
						_ {s: 'bgbk-2 p10'},
							_ Button.free.light, {text: 'Click'}
					_ Box3, {text: 'hue = blue'},
						_ {s: 'p10'},
							_ Button.free.blue, {text: 'Click'}

			_ Box1, {text: 'kind = link'},
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = dark'},
						_ Button.link.dark, {text: 'Click'}
					_ Box3, {text: 'hue = light', s: 'bgbua'},
						_ {s: 'bgbk-2 p10'},
							_ {s: 'fa11wh3 disi'}, "Click"
							_ Button.link.light, {text: 'here'}
					_ Box3, {text: 'hue = blue'},
						_ Button.link.blue, {text: 'Click'}
						_ 'br', {}
						_ 'br', {}
						_ Button.link.blue, {text: 'hello@timeadore.com', href: 'mailto:hello@timeadore.com?subject=test'}
					_ Box3, {text: 'hue = indigo', s: 'bgbud'},
						_ {s: 'bgbk-2 p10'},
							_ {s: 'fa11wh3 disi'}, "Click"
							_ Button.link.indigo, {text: 'here'}


			_ Box1, {text: 'kind = modal'},
				_ Box2, {text: 'mode = bad'},
					_ Button.modal.bad, {text: 'Click'}
				_ Box2, {text: 'mode = veryGood'},
					_ Button.modal.veryGood, {text: 'Click'}

			_ Box1, {text: 'kind = icon'},
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = dark'},
						_ Button.icon.dark, {size: 'small', icon: SVGmail, link: {a: (a) -> inc a || 0}}
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = light', s: 'bgbua'},
						_ Button.icon.light, {size: 'small', icon: SVGmail}
						_ Button.icon.light, {icon: SVGmail}
						# _ Button.icon.light, {size: 50, icon: SVGmail}
						_ Button.icon.light, {size: 'large', icon: SVGmail}
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = blue'},
						_ Button.icon.blue, {icon: SVGmail, link: {a: (a) -> inc a || 0}}
						_ Button.icon.blue, {icon: SVGmail, link: {a: (a) -> inc a || 0}}

			_ Box1, {text: 'kind = custom'},
				_ Box2, {text: '1'},
					_ Button.custom, {s: 'bgxpu ho(op9) w40 h40 m5', onClick: -> console.log 'click!'}
				_ Box2, {text: '2'},
					_ Button.custom, {s: 'disif p5_10 fa12buf9 hofo(bgbuf-2)',
					onClick: -> console.log 'click!'}, 'YEAR'
				
			_ Box1, {text: 'kind = beveled'},
				_ Box2, {text: 'mode = (blank)'},
					_ Box3, {text: 'hue = green'},
						_ Button.beveled.green, {text: 'Click'}
					_ Box3, {text: 'hue = pink'},
						_ Button.beveled.pink, {text: 'Click'}
						_ Box4, {text: 'disabled = true'},
							_ Button.beveled.pink, {text: 'Click', disabled: true}
						_ Box4, {text: 'disabled = wait'},
							_ Button.beveled.pink, {text: 'Click here to win the price', wait: 50,
							onClick: -> alert('Should not open!')}
					_ Box3, {text: 'hue = grey'},
						_ Button.beveled.grey, {},
							_ SVGmail, {s: 'w13 h13 mr5'}
							_ {s: 'fa14bk-56'}, 'Click'




DropDownDemo = ->
	[state, changeState] = useChangeState {select1: 'No choice', multi: []}
	_ {s: 'mb50'},
		_ {s: 'fa24bk-86'}, 'DropDown'
		_ {s: 'mt20 xr__w'}, 
			_ Box1, {text: 'kind = menu', bg: 'be'},
				_ Box2, {text: 'look = brown (default)'},
					_ DropDown.menu, 
						items: ['First choice', 'Second choice', 'Third choice']
						onPicked: (item) -> changeState {select1: item.value}
						text: -> 'Menu'

					_ DropDown.menu,
						s: 'mt10'
						items: ['First choice', 'Second choice', 'Third choice']
						onPicked: (item) -> changeState {select1: item.value}
						text: -> "Selected: #{state.select1}"

				_ Box2, {text: 'look = white'},
					_ DropDown.menu, 
						look: ːwhite
						inputS: 'fa13__6 w160'
						items: ['First choice', 'Second choice', 'Third choice']
						onPicked: (item) -> changeState {select1: item.value}
						text: -> state.select1

					_ DropDown.menu, 
						s: 'mt10'
						look: ːwhite
						inputS: "fa13__6 w160 #{state.select1 == 'No choice' && 'op6'}"
						items: ['First choice', 'Second choice', 'Third choice']
						onPicked: (item) -> changeState {select1: item.value}
						text: -> state.select1

			_ Box1, {text: 'kind = (default), made into custom multi here', bg: 'be'},
				_ DropDown,
					groups: [{items: [{name: 'First choice'}, {name: 'Second choice'}, {name: 'Third choice'}]}]
					picked: (item) -> false
					onPicked: (item) -> console.log item
					input: ({isOpen, onClick}) ->
						_ {onClick, s: 'xr_c bgbk-1 iw100 ih40 p10 curp'},
							$ state.multi, map (item) ->
								_ {key: item.idx, s: 'bgwh _sh8 p5_10 br99 whn mr5'}, item.name
					content: (selectedIdx, groups, close) ->
						_ {s: 'posa top38 bgwh sh0_1_8_1 z20 p4_0 w100%'},
							$ groups, map (group) ->
								$ group.items, map (item) ->
									if contains item, state.multi 
										_ {key: item.idx, s: 'fa12bk-86 p8_14 curp bgbua-2 ho(bgbua f__wh_) whn'
										onClick: -> changeState({multi: without([item])})}, item.name
									else
										_ {key: item.idx, s: 'fa12bk-86 p8_14 curp ho(bgbua f__wh_) whn'
										onClick: -> changeState({multi: append(item)})}, item.name


# FlagDemo = ->
# 	[state, changeState] = useChangeState {name: 'France', code: 'fr', pick: false}
# 	_ {s: 'mb50'},
# 		_ {s: 'fa24bk-86'}, 'Flags'
# 		_ {s: 'mt20 xr__w'}, 
# 			# _ {s: 'fa15bk-86'}, 'kind'
# 			_ Box1, {text: '(normal)'},
# 				_ 'ul', {className: 'f32'}, # Need to include 32 css file to use
# 						_ 'li', {className: 'flag ar'}
# 						_ 'li', {className: 'flag fr'}
# 				_ 'ul', {className: 'f16'},
# 						_ 'li', {className: 'flag ar'}
# 						_ 'li', {className: 'flag fr'}

# 			_ Box1, {text: 'Country picker', bg: 'be'},

# 				if !state.pick
# 					_ Button.custom, {s: 'xr_c p10 hofo(bggy-1)', onClick: -> changeState {pick: true}},
# 						_ 'ul', {className: 'f16', s: 'm0 p0'},
# 								_ 'li', {className: "flag flag__#{toLower state.code}"}
# 						_ {s: 'ml5 fa12bk-56'}, state.name
# 						_ {s: 'ml10 fa11bua-96 tdu'}, 'Change country'
# 				else
# 					_ CountryPicker,
# 						isPicked: ({code}) -> state.code == code
# 						onPicked: (c) ->
# 							if !c then changeState {pick: false}
# 							else changeState {name: c.name, code: c.code, pick: false}


PanelDemo = ->
	_ {s: 'mb50'},
		_ {s: 'fa24bk-86'}, 'Panel'
		_ {s: 'mt20 xr__w'}, 
			# _ {s: 'fa15bk-86'}, 'kind'
			_ Box1, {text: 'YellowError', s: 'bgbud'},
				_ Panels.YellowError, {}, 'User already exists'






# _kind = [ːraised, ːbeveled, ːfree, ːmodal, ːicon, ːcustom, ːlink] # no default, must choose
# _hue = [ːdark, ːlight, ːblue, ːgreen, ːpink] # default medium
# _mood = [ːgood, ːbad, ːveryGood, ːveryBad] # default neutral
# _size = [ːsmall, ːlarge] # default medium


