equals = require('ramda/src/equals'); isNil = require('ramda/src/isNil'); length = require('ramda/src/length'); match = require('ramda/src/match'); replace = require('ramda/src/replace'); split = require('ramda/src/split'); test = require('ramda/src/test'); #auto_require: srcramda
{change, isNilOrEmpty} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'

keyCodes =
	ENTER: 13
	ESC: 27
	UP: 38
	DOWN: 40
	TAB: 9
	SPACE: 32

# https://www.w3schools.com/js/js_cookies.asp
getCookie = (cname) ->
	name = cname + '='
	decodedCookie = decodeURIComponent(document.cookie)
	ca = decodedCookie.split(';')
	i = 0
	while i < ca.length
		c = ca[i]
		while c.charAt(0) == ' '
			c = c.substring(1)
		if c.indexOf(name) == 0
			return c.substring(name.length, c.length)
		i++
	return ''

capitalize = (s) -> s.charAt(0).toUpperCase() + s.slice(1)

memoDeep = (f) -> React.memo f, equals

emptyIfNil = (x) -> if isNil x then '' else x

cutTextAt = (n, s) ->
	if isNil s then ''
	else if length(s) > n then s.substr(0, n) + '...'
	else return s

toHMM = (n) ->
	if isNil n then return null
	h = toH n
	mm = toMM n
	return "#{h}:#{mm}"

toH = (n) -> Math.trunc n

toMM = (n) ->
	decimalPart = n % 1
	m = Math.round decimalPart * 60
	if m < 10 then '0' + m else m

round = (n) ->
	if isNil n then return '0'
	else if n % 1 == 0 then return "#{n}"
	else return '' + Math.round((n + Number.EPSILON) * 100) / 100
	# https://stackoverflow.com/a/11832950/416797

formatPrice = (n) ->
	return '' + n.toFixed(2)


_nullIfNaN = (x) -> if isNaN x then null else x

fromHHMMorDec = (s) ->
	if test(/:/, s)
		[h, mm] = split ':', s
		if isNilOrEmpty mm then return _nullIfNaN parseInt(h)
		else if isNilOrEmpty h then return _nullIfNaN parseFloat(mm) / 60
		return parseInt(h) + parseFloat(mm) / 60
	else if test(/,/, s) then return _nullIfNaN parseFloat replace ',', '.', s
	else return _nullIfNaN parseFloat s


# Light weight way of getting some password strength
# Probably better option is https://github.com/dropbox/zxcvbn but its 400kB so would probably need server-side
# implementation = overkill right now.
# https://stackoverflow.com/a/11268104/416797
scorePassword = (pass) ->
	score = 0
	if !pass then return score
	# award every unique letter until 5 repetitions
	letters = {}
	i = 0
	while i < pass.length
		letters[pass[i]] = (letters[pass[i]] or 0) + 1
		score += 5.0 / letters[pass[i]]
		i++
	# bonus points for mixing it up
	variations = 
		digits: /\d/.test(pass)
		lower: /[a-z]/.test(pass)
		upper: /[A-Z]/.test(pass)
		nonWords: /\W/.test(pass)
	variationCount = 0
	for check of variations
		variationCount += if variations[check] == true then 1 else 0
	score += (variationCount - 1) * 10
	return parseInt score


# HOOKS
useChangeState = (initial) ->
	[state, setState] = React.useState initial
	changeState = (spec) -> setState change spec
	resetState = -> setState initial
	return [state, changeState, resetState]

useFocus = (deps) ->
	# NOTE!!!!!!! Doesn't really seem to work. Else part is needed but it throws error when component is removed
	#							Use autoFocus: true instead and go back to this when that is not enough anymore
	ref = React.useRef()
	React.useEffect ->
		if ref?.current then ref.current?.focus()
		# else
		# 	flip(setTimeout) 10, ->
		# 		ref?.current?.focus() # give time if conditonal render
	, deps
	return ref

useForceScrollbar = () ->
	React.useEffect ->
		document.body.style.overflowY = 'scroll'
		return () -> document.body.style.overflowY = 'initial'
	, []
	return null

useOuterClick = (ref, onOuterClick) ->
	React.useEffect ->
		handleClick = (e) -> if ref.current && !ref.current.contains(e.target) then onOuterClick()
		if ref.current then document.addEventListener 'click', handleClick
		return () -> document.removeEventListener 'click', handleClick
	, [ref, onOuterClick]

# Returns size of supplied ref like {width: 344, height: 102} and updates on window resize
useMySize = (ref) ->
	[size, setSize] = React.useState {width: 0, height: 0}

	handleResize = ->
		width = ref.current?.offsetWidth || 0
		height = ref.current?.offsetHeight || 0
		setSize {width, height}

	React.useEffect ->
		handleResize()
		window.addEventListener 'resize', handleResize
		return () -> window.removeEventListener 'resize', handleResize
	, [ref.current]

	return size

useWindowSize = () ->
	[size, setSize] = React.useState {width: window.innerWidth, height: window.innerHeight}

	handleResize = ->
		width = window.innerWidth || 0
		height = window.innerHeight || 0
		if width == size.width && height == size.height then return
		setSize {width, height}

	React.useEffect ->
		handleResize()
		window.addEventListener 'resize', handleResize
		return () -> window.removeEventListener 'resize', handleResize
	, []

	return size

#auto_export: none_
module.exports = {keyCodes, getCookie, capitalize, memoDeep, emptyIfNil, cutTextAt, toHMM, toH, toMM, round, formatPrice, fromHHMMorDec, scorePassword, useChangeState, useFocus, useForceScrollbar, useOuterClick, useMySize, useWindowSize}