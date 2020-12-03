match = require('ramda/src/match'); omit = require('ramda/src/omit'); props = require('ramda/src/props'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[ːonEnter, ːonKeyDown, ːonChange] = ['onEnter', 'onKeyDown', 'onChange'] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args

React = require 'react'
rfr = require 'react-functional-router'

BounceLoader = require 'react-spinners/BounceLoader'
useNegin = require './useNegin'
utils = require './utils'
# colors = require '../../style/colors'
# icons = require './icons'
BounceLoader = require('react-spinners/BounceLoader').default;


module.exports = React.forwardRef (props, ref) ->
	_ = useNegin()

	cleanProps = omit [ːonChange, ːonKeyDown, ːonEnter], props

	_ 'input', {ref, s: ' ' + props.s_, type: 'text',
	onKeyDown: (e) ->
		if e.keyCode == utils.keyCodes.ENTER then props.onEnter?()
		props.onKeyDown?(e)
	onChange: (e) -> props.onChange?(e.target.value, e)
	...cleanProps}

