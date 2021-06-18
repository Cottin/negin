contains = require('ramda/src/contains'); flip = require('ramda/src/flip'); match = require('ramda/src/match'); omit = require('ramda/src/omit'); prop = require('ramda/src/prop'); props = require('ramda/src/props'); type = require('ramda/src/type'); #auto_require: srcramda
{func} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːicon, ːhref, ːbeveled, ːblue, ːveryBad, ːslant, ːsquare, ːdark, ːgreen, ːselected, ːlinkBlank, ːdisabled, ːlook, ːmodal, ːindigo, ːgrey, ːfree, ːlightBlue, ːkind, ːwhite, ːhue, ːred, ːveryGood, ːraised, ːlink, ːpink, ːtext, ːbrown, ːwait, ːlight, ːcustom, ːonClick, ːgood, ːmood, ːbad, ːsubmit] = ['icon', 'href', 'beveled', 'blue', 'veryBad', 'slant', 'square', 'dark', 'green', 'selected', 'linkBlank', 'disabled', 'look', 'modal', 'indigo', 'grey', 'free', 'lightBlue', 'kind', 'white', 'hue', 'red', 'veryGood', 'raised', 'link', 'pink', 'text', 'brown', 'wait', 'light', 'custom', 'onClick', 'good', 'mood', 'bad', 'submit'] #auto_sugar
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

_kind = [ːraised, ːfree, ːlink, ːmodal, ːicon, ːcustom, ːbeveled, ːslant]
_look = [ːdark, ːlight, ːblue, ːlightBlue, ːgreen, ːpink, ːgrey, ːbrown, ːindigo, ːred, ːgood, ːbad, ːveryGood, ːveryBad, ːwhite]

Button2 = func.loose
	kind: new Set _kind
	look〳: new Set _look
	# hue〳: new Set _hue
	# mood〳: new Set _mood

	disabled〳: Boolean
	wait〳: [Boolean, Number]
	selected〳: Boolean
	square〳: Boolean
	text〳: String
	icon〳: Function
	size〳: Number
	link〳: [Object, Function]
	linkBlank〳: Boolean
	submit〳: Boolean
	href〳: String
	onClick〳: (e) -> # Will also be called onKeyDown == SPACE or ENTER
	s_〳: String
	clr〳: String # override clr from look
, 
(props) ->
	_ = useNegin()
	commonProps = {tabIndex: 0}
	[touchStart, setTouchStart] = React.useState false
	onTouchStart = () ->
		if props.disabled || props.wait then return
		setTouchStart true
		flip(setTimeout) 500, -> setTouchStart false

	cleanProps = omit [ːkind, ːlook, ːhue, ːmood, ːdisabled, ːwait, ːselected, ːsquare, ːtext, ːicon, ːlink,
	ːlinkBlank, ːsubmit, ːhref, ːonClick], props

	if props.onClick && !props.wait && !props.disabled
		commonProps.onClick = props.onClick
		commonProps.onKeyDown = (e) ->
			if e.keyCode == SPACE || e.keyCode == ENTER then props.onClick()

	if props.link
		comp = rfr.Link
		if !props.disabled then cleanProps.link = props.link
	else if props.href
		comp = 'a'
		if props.disabled then cleanProps.href = 'javascript:void(0)' else cleanProps.href = props.href
	else if props.submit && !props.wait
		comp = 'button'
		cleanProps.type = 'submit'
	else
		comp = 'a'

	if props.linkBlank then cleanProps.target = '_blank'

	size = props.size || 13
	iconSize = size * 1.2

	clr = if contains props.look, ['dark', 'brown'] then 'bk-6' else 'wh-9'


	switch props.kind
		when ːraised
			kindS = "ls0.2 #{props.square && 'p10 coa(p12)' || 'p10_20 coa(p15_20)'}"
			switch props.look
				when ːdark then lookS = 'fa_bk-45 bggy-2 ho(bggy-3 f__bk-6)'
				when ːgrey then lookS = 'fa_bk-45 bggy-1 ho(bggy-2 f__bk-6)'
				when ːlight
					if props.selected then lookS = 'fa_wh-94 bgbk-3 ho(bgbk-4 f__wh)'
					else lookS = "fa_wh-94 #{!props.wait && 'bgwh-1 ho(bgwh-2 f__wh)'}"
				when ːblue then lookS = 'fa_wh-94 bgbua ho(bgbud f__wh)'
				when ːbrown then lookS = 'fa_bk-64 bgbw-1 ho(bgbw-2)'
				when ːveryGood then lookS = 'fa_wh5 bggn-9 ho(bggn)'
				when ːveryBad then lookS = 'fa_wh5 bgre-9 ho(bgre)'

		when ːfree
			kindS = "#{props.square && 'p12 coa(p12)' || 'p10_15_10_12 coa(p10_15_10_15)'}"
			switch props.look
				when ːdark then lookS = 'fa_bk-55 hofo(bggy-1)'
				when ːlight then lookS = "fa_wh-94 #{!props.wait && 'hofo(bgwh-1 f__wh)'}"
				when ːblue then lookS = 'fa_bua-96 hofo(bggyb-3 f__bua)'
				when ːdark then lookS = 'fa_bk-55 hofo(bggy-1)'
				when ːbrown then lookS = 'fa_bk-55 hofo(bgbw-2)'

		when ːlink
			kindS = "p0 disif"
			switch props.look
				when ːdark then lookS = 'tdu fa11bua-96 hofo(bggyb-1 f__ye)'
				when ːlight then lookS = 'tdu fa11ye-96 hofo(bggyb-1 f__ye)'
				when ːblue then lookS = 'fa11bua-96 hofo(f__bub)'
				when ːindigo
					lookS = 'tdu fa11bui-96 hofo(f__bui) p0'
					clr = 'bui-9'
				when ːgrey then lookS = 'fa11gy-66 hofo(f__bk-7)'

		when ːmodal
			kindS = "xg1 tac p17_0 ls1 f__bk-6 ttrau bortbk-1 borrbk-1"
			switch props.look
				when ːveryBad then hoS = '_linre f__wh'
				when ːbad then hoS = 'bggyb-3 f__re'
				when ːveryGood then hoS = '_lingn f__wh'
				else hoS = 'bggyb-3 f__bk'

			lookS = "ho(#{hoS}) #{touchStart && hoS} #{props.wait && hoS}"

		when ːicon
			if !props.icon then throw new Error 'You must supply the icon prop when using Button.icon'
			switch props.look
				when ːdark then clr = 'bk-6' ; lookS = 'ho(bgbk-1) hoc1(fillbk-5)'
				when ːblue then clr = 'bub' ; lookS = 'ho(bgbub-1) hoc1(fillbub)'
				when ːlightBlue
					if props.selected
						clr = 'bub'
						lookS = 'bgbub-1'
					else 
						clr = 'bub-2'
						lookS = 'ho(bgbub-1) hoc1(fillbub)'
				when ːred then clr = 're' ; lookS = 'hoc1(fillpia)'
				else clr = 'wh-4' ; lookS = 'ho(bgwh-3) hoc1(fillbk-4)'
			lookS += " p#{Math.max(2, Math.min(iconSize/2, 20))}"
		when ːcustom
			kindS = lookS = ''
		when ːbeveled
			kindS = "xrcc ls0.2 p11_30 br5 _sha0_2_1_0_bk-4"
			switch props.look
				when ːgreen then lookS = "fa_wh6 bggn hofo(bggna f__wh)"
				when ːpink then lookS = "fa_wh6 bgpib hofo(bgpic f__wh)"
				when ːgrey then lookS = "fa_bk-46 bgbuf hofo(bgbuf-8 f__wh)"
		when ːslant
			kindS = "xrbc p10_20 _sh8 hofo(bggyc) "
			switch props.look
				when ːwhite then lookS = "bgwh fa_bk-66"

	if props.clr? then clr = props.clr

	commonS = "fo(out0) curp xrcc posr f_#{size}___"
	commonSoverride = "#{touchStart && 'bgbuj'} #{props.disabled && 'op6 hofo()'}"

	_ comp, {s: "#{commonS} #{kindS} #{lookS} #{props.s_} #{commonSoverride}",
	...commonProps, onTouchStart, ...cleanProps},
		if props.wait
			_ {s: 'xrcc posr'},
				_ {s: 'op0'},
					if props.children
						if type(props.children) == 'Function' then props.children({touchStart})
						else props.children
					else props.text
				_ {s: 'posa'},
					_ BounceLoader, {color: _.colors(clr), loading: true, size: 25}
		else if props.icon
			_ React.Fragment, {},
				_ props.icon, {fill: _.colors(clr), className: 'c1',
				s: "w#{iconSize} h#{iconSize} coa(w#{iconSize*1.2} h#{iconSize*1.2})"}
				if props.text then _ {s: 'ml6'}, props.text
		else if props.children
			if type(props.children) == 'Function' then props.children({touchStart})
			else props.children
		else
			props.text


dottedButton = RE.dottedApi {kind: _kind, look: _look}, Button2
module.exports = dottedButton

