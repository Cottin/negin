match = require('ramda/src/match'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'
rfr = require 'react-functional-router'
NeginContext = require './NeginContext'

{keyCodes: {ENTER, UP, DOWN}} = require './utils'


NeginProvider = ({renderer, children}) ->
	React.createElement NeginContext.Provider, {value: renderer}, children
	

module.exports = NeginProvider
