isEmpty = require('ramda/src/isEmpty'); isNil = require('ramda/src/isNil'); length = require('ramda/src/length'); map = require('ramda/src/map'); match = require('ramda/src/match'); merge = require('ramda/src/merge'); props = require('ramda/src/props'); test = require('ramda/src/test'); toLower = require('ramda/src/toLower'); #auto_require: srcramda
{func, $} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'
rfr = require 'react-functional-router'

useNegin = require './useNegin'
{useWindowSize, keyCodes: {ENTER, UP, DOWN, ESC}} = utils = require './utils'


AutoComplete = func
	className〳: String
	inputS〳: String
	dropDown〳: String
	groups: [{items: [Object]}]
	preSelected〳: (item) -> Boolean
	test: (text, item, group) -> Boolean # you'll be given either item or group
	onPicked: (item) ->
	children: (selectedIdx, groups, matched) ->
	s_〳: String # Just pass-through for easier debugging
	s__〳: String # Just pass-through for easier debugging
,
(props) ->
	_ = useNegin()
	size = useWindowSize()
	[text, setText] = React.useState ''
	[arrowIdx, setArrowIdx] = React.useState null

	groups = []
	count = 0
	items = []
	preSelectedIdx = null
	for group in props.groups
		groupItems = []
		groupIsMatched = props.test text, undefined, group
		for item in group.items
			if groupIsMatched || props.test text, item
				if props.preSelected?(item) then preSelectedIdx = count
				groupItems.push merge item, {idx: count++}
		if !isEmpty groupItems
			groups.push merge group, {items: groupItems}
			items.push ...groupItems
		# else groups.push merge group, {items: [], isMatch: groupIsMatched}

	if !isNil arrowIdx then selectedIdx = arrowIdx
	else if !isNil preSelectedIdx then selectedIdx = preSelectedIdx
	else selectedIdx = 0

	onKeyDown = (e) ->
		switch e.keyCode
			when ENTER
				if count == 0 then props.onPicked null, items, text
				else props.onPicked items[selectedIdx], items, text
				e.stopPropagation()
			when UP
				selectedIdx > 0 && setArrowIdx selectedIdx-1
				e.preventDefault() # arrow moves cursor in input, so we prevent it
			when DOWN 
				selectedIdx < count - 1 && setArrowIdx selectedIdx+1
				e.preventDefault() # arrow moves cursor in input, so we prevent it
			when ESC 
				props.onPicked null
			else
				setArrowIdx null # reset arrowIdx when we type or erase

	if false && size.height < 700 && window.matchMedia("(pointer:coarse)").matches
		_ {s: 'posf top0 lef0 bgwh w100%', className: props.className, s_: props.s_, s__: props.s__},
			_ 'input', {type: 'text', tabIndex: 0, autoFocus: true, value: text, s: 'xg1 ' + props.inputS,
			onKeyDown,
			onChange: (e) -> setText e.target.value
			onBlur: -> props.onPicked null
			onChange: (e) -> setText e.target.value}
			props.children selectedIdx, groups, text

	else
		_ {s: 'posr xg1 xr__', className: props.className, s_: props.s_, s__: props.s__},
			_ 'input', {type: 'text', tabIndex: 0, autoFocus: true, value: text, s: 'xg1 ' + props.inputS,
			onKeyDown,
			onChange: (e) -> setText e.target.value
			onBlur: -> props.onPicked null
			onChange: (e) -> setText e.target.value}
			props.children selectedIdx, groups, text


AutoComplete.simple = func
	className〳: String
	inputS〳: String
	items: [String]
	preSelected〳: String
	onPicked: (item) ->
	children〳: (selectedIdx, items, matched) ->
	ifEmpty〳: () -> # React child
,
(props) ->
	_ = useNegin()
	_ AutoComplete, {className: props.className, inputS: props.inputS, 
	groups: [{items: $ props.items, map (text) -> {text}}]
	preSelected: (item) -> item.text == props.preSelected
	test: (text, item) -> if item then test new RegExp("#{utils.escapeRegExp text}", 'i'), item.text
	onPicked: (item, items, text) -> props.onPicked item?.text, items, text},
		(selectedIdx, groups, matched) ->
			items = groups[0]?.items || []
			_ {s: 'posa top35 w100% bgwh sh0_1_8_1 z20 p5_0'},
				if isEmpty items
					props.ifEmpty matched
				else
					$ items, map (item) ->
						_ {key: item.text, tabIndex: 0, onMouseDown: -> props.onPicked(item.text, items),
						s: "p10_20 curp fa12bk-84 #{selectedIdx == item.idx && 'bgbua-2'} ho(bgbua-2)"},
							_ TextMatch, {matched, text: item.text}

TextMatch = ({matched, text}) ->
	_ = useNegin()
	esc = utils.escapeRegExp
	[isMatch, before_, after_] = match new RegExp("(.*?)#{toLower(esc matched)}(.*)"), toLower(esc text)
	# Note: underline of escaped things doesnt work properly but deemd not important enought to fix
	#				eg. test$123 search for $ gives underline of 1
	if !isMatch then return _ 'span', {}, text
	a = length(before_ || '')
	b = length(matched || '')
	before = text.substr 0, a
	middle = text.substr a, b
	after = text.substr a+b

	_ React.Fragment, {},
		_ 'span', {}, before
		_ 'span', {s: 'tdu'}, middle
		_ 'span', {}, after

AutoComplete.TextMatch = TextMatch


module.exports = AutoComplete
