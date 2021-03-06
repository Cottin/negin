{has, isNil, match, type} = R = require 'ramda' #auto_require: ramda
{$} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs


React = require 'react'
renderer = require './style/renderer'
React = require 'react'
rfr = require 'react-functional-router'



console.clear()

router = rfr.createRouter()

window.R = R
window.RE = RE
window.router = router

array = (xs...) -> xs

# Underscore is such a nice alias helper so we're doing some guessing to determin if it
# was used for array (popsiql queries / data queries) or for react.createElement.
arrayOrRenderer = ->
	[a0, a1] = arguments


	if arguments.length == 1
		# This case is hard... For now if you cannot render _ {} you must have _ {is: ''} or _ {s: ''}
		if 'Object' == type(a0) && (has('s', a0) || has('is', a0) || has('style', a0)) then renderer arguments...
		else return array arguments...

	if 'Object' == type a0
		# if React.isValidElement a1
		# 	console.log a1
		# return renderer arguments...
		if isNil a1 then return renderer arguments...
		else if has '$$typeof', a0 then return renderer arguments... # ex. React.memo
		else if 'Object' == type(a1)
			if has '$$typeof', a1 then return renderer arguments...
			else return array arguments...
		# else if 'Array' == type a1 then return renderer arguments...
		# else if 'String' == type a1 then return renderer arguments...
		else
			return renderer arguments...
		# if React.isValidElement a1 then return renderer arguments...
		# else return array arguments...
		# console.log a1
		# return renderer arguments...
		# if 'Object' == type a1 then return array arguments...
		# else return renderer arguments...

	else if 'Function' == type(a0) || 'String' == type(a0)
		if 'Object' == type a1 then return renderer arguments...
	else if 'Symbol' == type(a0) && a0.toString() == 'Symbol(react.fragment)'
		return React.createElement arguments...

	return array arguments...

arrayOrRenderer.frag = ->
	return React.createElement React.Fragment, arguments...



module.exports = {router, _: arrayOrRenderer}

