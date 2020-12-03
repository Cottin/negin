{match} = R = require 'ramda' #auto_require: ramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

shortstyle = require 'shortstyle'

module.exports = ({rawColors, themeColors}) ->
	allColors = rawColors
	for k, v of themeColors
		if !rawColors[v] then throw new Error "themeColor '#{k}' refers to missing baseColor '#{v}'"
		allColors[k] = rawColors[v]

	colors = shortstyle.colors.buildColors allColors
	
	return {rawColors, themeColors, allColors, colors}

