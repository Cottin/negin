{match} = R = require 'ramda' #auto_require: ramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

buildTheme = require './buildTheme'

module.exports = buildTheme
	rawColors:
		wh: _ 0, 0, 100
		bk: _ 0, 0, 0

		gy: _ 0, 0, 35
		gya: _ 0, 0, 50
		gyb: _ 0, 0, 90
		gyc: _ 0, 0, 98
		gyd: _ 0, 0, 95

		be: _ 37, 7, 98

		bu: _ 196, 15, 100
		buc: _ 200, 23, 100 #a
		bua: _ 209, 53, 95 #b
		buf: _ 206, 9, 95 #c
		bud: _ 206, 39, 91 #d
		bui: _ 234, 69, 89 #e
		bub: _ 196, 81, 61 #f
		bue: _ 206, 47, 72 #g
		bug: _ 206, 78, 52 #h
		buh: _ 206, 50, 50 #i
		buj: _ 201, 48, 100

		re: _ 360, 100, 73
		rea: _ 334, 46, 100

		gn: _ 111, 92, 66
		gna: _ 111, 92, 76
		gnb: _ 117, 77, 100

		ye: _ 64, 40, 95
		yea: _ 27, 64, 97
		yeb: _ 55, 34, 100

		bw: _ 50, 75, 54

		pi: _ 331, 30, 92
		pia: _ 335, 82, 75
		pib: _ 343, 76, 86
		pic: _ 343, 76, 100
		pic: _ 343, 76, 100

		xpi: _ 340, 49, 99
		xpu: _ 292, 45, 77
		xvi: _ 235, 49, 78
		xbu: _ 195, 87, 83
		xgn: _ 134, 87, 82
		xye: _ 48, 88, 95
		xor: _ 20, 65, 94
		xre: _ 360, 65, 85
		xbr: _ 31, 60, 69
		xgy: _ 360, 11, 43

	themeColors:
		za: 'be'
		zb: 'bua'
		zc: 'bud'
		zd: 'wh'
		# ze: ''

