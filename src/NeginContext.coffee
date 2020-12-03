match = require('ramda/src/match'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'

NeginContext = React.createContext null

if process.env.NODE_ENV != 'production'
	NeginContext.displayName = 'NeginContext'

module.exports = NeginContext
