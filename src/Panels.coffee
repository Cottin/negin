match = require('ramda/src/match'); props = require('ramda/src/props'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs


useNegin = require './useNegin'

YellowError = (props) ->
	_ = useNegin()
	_ {s: "xg1 bgyeb p15 fa13pib5 sha0_1_2_2_1 lh130% tac", ...props},
		props.children



#auto_export: none_
module.exports = {YellowError}