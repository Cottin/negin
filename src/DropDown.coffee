either = require('ramda/src/either'); isNil = require('ramda/src/isNil'); map = require('ramda/src/map'); match = require('ramda/src/match'); merge = require('ramda/src/merge'); props = require('ramda/src/props'); type = require('ramda/src/type'); #auto_require: srcramda
{func, $} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːfree, ːwhite, ːbrown] = ['free', 'white', 'brown'] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'
rfr = require 'react-functional-router'

{useEventListener, useOuterClick, keyCodes: {ESC}} = require './utils'
Button = require './Button2'
# icons = requije './icons'
useNegin = require './useNegin'
SVGarrowDown = require 'icons/arrowDown.svg'



###############################################################################
DropDown = func
	groups〳: [{items: [Object]}] # supply either groups or items
	items〳: [Object, String] # either array of {} or strings that will be converted to {value: string}
	input: (inputProps) -> # inputProps = {isOpen, onClick, onKeyDown}
	picked〳: (item) -> Boolean # not used, for later arrow navigation
	onPicked: (item) ->
	content: (selectedIdx, groups) ->
	className〳: String
	s_〳: String # Just pass-through for easier debugging
	s__〳: String # Just pass-through for easier debugging
,
(props) ->
	if props.groups && props.items then throw new Error 'use either groups or items'
	if isNil(props.groups) && isNil(props.items) then throw new Error 'missing groups or items'

	[arrowIdx, setArrowIdx] = React.useState null
	[isOpen, setIsOpen] = React.useState false
	_ = useNegin()
	onKeyDown = (e) ->
		if !isOpen || !e then return
		if e.keyCode == ESC then setIsOpen false
	useEventListener 'keydown', onKeyDown

	ref = React.useRef null
	useOuterClick ref, -> setIsOpen false

	if props.items
		if type(props.items[0]) == 'String'
			_groups = [{items: $ props.items, map (value) -> {value}}]
		else _groups = [{items: props.items}]
	else _groups = props.groups

	groups = []
	count = 0
	items = []
	selectedIdx = null
	for group in _groups
		groupItems = []
		for item in group.items
			if props.picked?(item)
				selectedIdx = count # selectedIdx will be last picked item if multiple
			groupItems.push merge item, {idx: count++}
		groups.push merge group, {items: groupItems}
		items.push ...groupItems

	# TODO: arrow navigation

	onClick = () -> setIsOpen !isOpen

	_ {s: 'posr disif', className: props.className, s_: props.s_, s__: props.s__},
		props.input {isOpen, onClick}
		if isOpen then _ {ref, s: 'posa iw100%'}, props.content selectedIdx, groups, () -> setIsOpen false
		# if isOpen then props.content selectedIdx, groups, () -> setIsOpen false


###############################################################################
DropDown.menu = func
	groups〳: [{items: [Object]}] # items must have text in {value: ...}
	items〳: [Object, String] # if using objects, items muse have text in {value: ...}
	text〳: () -> String
	onPicked: (item) ->
	look〳: new Set [ːbrown, ːwhite, ːfree]
	button: () -> # component eg. Button.slant.white
	className〳: String
	inputS〳: String
	s_〳: String # Just pass-through for easier debugging
	s__〳: String # Just pass-through for easier debugging
,
({className, look: _look, button, groups, items, onPicked, text, input, inputS}) ->
	_ = useNegin()

	look = _look || ːbrown

	_ DropDown, {className, groups, items, onPicked,
	input: ({isOpen, onClick}) ->
		_ button, {onClick, s: "xrbc #{inputS}"},
			_ {s: ''}, text()
			_ SVGarrowDown, {fill: _.colors('bk-4'), s: 'w11 h11 ml8'}
	content: (selectedIdx, groups, close) ->
		_ {s: 'posa top38 bgwh sh0_2_4_1_bk-2 z20 p4_0 iw100%'},
			$ groups, map (group) ->
				$ group.items, map (item) ->
					_ {key: item.idx, s: 'fa12bk-86 p8_14 curp ho(bgbua f__wh_) whn'
					onClick: -> onPicked(item) & close()}, item.value
	}




# dottedButton = RE.dottedApi {kind: _kind, look: _look}, DropDown

module.exports = DropDown
