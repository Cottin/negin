match = require('ramda/src/match'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'
NeginContext = require './NeginContext'

buildTheme = (spec) ->
  return spec # in future, calculate things based on what is not given
  
defaultTheme = buildTheme
  za: _ 100, 50, 50


#auto_export: none_
module.exports = {buildTheme, defaultTheme}