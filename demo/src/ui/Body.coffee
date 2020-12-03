{match} = R = require 'ramda' #auto_require: ramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args

React = require 'react'

{Link} = require 'react-functional-router'

{_, withData} = require '../setup'

DemoPage = require './DemoPage'



module.exports = ({url}) ->
	_ DemoPage, {}





