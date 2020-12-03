React = require 'react'
fela = require 'fela'
prefixer = require('fela-plugin-prefixer').default
fallbackValue = require('fela-plugin-fallback-value').default
shortstyle = require 'shortstyle'
{has, omit, props, type} = require 'ramda' #auto_require: ramda
{fchange, $} = require 'ramda-extras' #auto_require: ramda-extras

styleMaps = require './styleMaps'
felaRenderer = require './felaRenderer'


# attrMaps = {}
# attrMaps.is = (x) -> {id: x} # hack to be able to use is as a label

parseShortstyle = shortstyle omit(['unit', '_'], styleMaps), styleMaps.unit

createElementFela = ->
	[a0] = arguments

	if 'Object' == type(a0) && ! has '$$typeof', a0
		comp = 'div'
		props = a0
		children = Array.prototype.splice.call(arguments, 1)
	else
		comp = a0 # either a string or a component, eg. 'span' or Icon
		props = arguments[1]
		children = Array.prototype.splice.call(arguments, 2)

	t0 = performance.now()
	# use s_ for explicit overriding of parent styles
	felaStyle = parseShortstyle props.s + if props.s_ then ' ' + props.s_ else ''
	shortParse = performance.now() - t0

	shortRender0 = performance.now()
	felaClassName = felaRenderer.renderRule (-> felaStyle), {}
	shortRender = performance.now() - shortRender0

	props_ = fchange props,
		s: undefined
		s__: if props.s__ then props.s__ + ' > ' + props.s else props.s
		className: (c) -> if c then felaClassName + ' ' + c else felaClassName
		is: undefined # hack to be able to use is as a label
		id: (id) -> id || props['is'] || undefined


	# console.log "Shortstyle perf: #{Math.round(performance.now() - t0)}ms \
	# (parse: #{Math.round shortParse}ms, \
	# renderRule: #{Math.round shortRender}ms)"

	return React.createElement comp, props_, children...

module.exports = createElementFela

