all = require('ramda/es/all').default; values = require('ramda/es/values').default; # auto_require: srcramda
{} = RE = require 'ramda-extras' # auto_require: ramda-extras
[] = [] #auto_sugar
{eq, deepEq} = RE = require 'testhelp' # auto_require: testhelp

# todo: move to test help?
console.clear()
console.log((new Date).toISOString())
dots = ''
dots += '.' for num in [0..Date.now() % 50]
console.log dots
console.log dots
console.log dots

{equalsAt, toHMM, fromHHMMorDec, durationToDates, durationToView, round, formatCardNo, formatExpiry, validateExpiry, formatCVC} = utils = require './utils'


describe 'utils', ->
	describe 'equalsAt', ->
		it 'values', ->
			o1 = {a: 1, b: 2, c: 3}
			o2 = {a: 1, b: 2, c: 4}
			eq true, equalsAt 'a,b', o1, o2
			
		it 'refs', ->
			a = {a1: 1}
			o1 = {a: {a1: 1}, b: {b1: 2}, c: 3}
			o2 = {a: o1.a, b: o1.b, c: 4}
			eq true, equalsAt 'a,b', o1, o2

		it 'refs false', ->
			a = {a1: 1}
			o1 = {a: {a1: 1}, b: {b1: 2}, c: 3}
			o2 = {a: o1.a, b: {b1: 2}, c: 4}
			eq false, equalsAt 'a,b', o1, o2

		it '3', ->
			a = {a1: 1}
			o1 = {a: {a1: 1}, b: {b1: 2}, c: 3}
			o2 = {a: o1.a, b: {b1: 2}, c: 4}
			eq false, equalsAt 'a,b', o1, o2

		it '* all', ->
			o1 = {a: {a1: 1, a2: {a21: 2}}, b: {b1: 2}, c: 3}
			o2 = {a: o1.a, b: o1.b, c: 3}
			eq true, equalsAt '*', o1, o2

		it '*', ->
			o1 = {a: {a1: 1, a2: {a21: 2}}, b: {b1: 2}, c: 3}
			o2 = {a: {a1: o1.a.a1, a2: o1.a.a2}, b: o1.b, c: 4}
			eq true, equalsAt 'a.*,b', o1, o2

		it '* false', ->
			o1 = {a: {a1: 1, a2: {a21: 2}}, b: {b1: 2}, c: 3}
			o2 = {a: {a1: o1.a.a1, a2: {a21: 2}}, b: o1.b, c: 4}
			eq false, equalsAt 'a.*,b', o1, o2

		it '* false no obj', ->
			o1 = {a: {a1: 1, a2: {a21: 2}}, b: {b1: 2}, c: 3}
			o2 = {a: {a1: o1.a.a1}, b: o1.b, c: 4}
			eq false, equalsAt 'a.*,b', o1, o2

	describe 'toHMM + fromHHMMorDec', ->
		it 'easy', -> eq '0:30', toHMM 0.5
		it 'hard', -> eq '4:05', toHMM 4.083333333333333
		it 'null', -> eq null, toHMM null

		it '.', -> eq 4.33, fromHHMMorDec '4.33'
		it ':', -> eq 4.083333333333333, fromHHMMorDec '4:05'
		it ',', -> eq 4.33, fromHHMMorDec '4,33'

		it 'abc', -> eq null, fromHHMMorDec 'abc'

		it '4:', -> eq 4, fromHHMMorDec '4:'
		it ':23', -> eq 0.4, fromHHMMorDec ':24'
		it ': alone', -> eq null, fromHHMMorDec ':'

	describe 'round', ->
		it 'simple', ->
			eq '1', round 1.0
			eq '1.01', round 1.005
			eq '0', round null

	describe 'durationToDates', ->
		it 'simple', ->
			now = 1583421949082
			deepEq ['2020-03-02', '2020-03-08'], durationToDates 'This week', now
			deepEq ['2020-02-24', '2020-03-01'], durationToDates 'Last week', now
			deepEq ['2020-03-01', '2020-03-31'], durationToDates 'This month', now
			deepEq ['2020-02-01', '2020-02-29'], durationToDates 'Last month', now
			deepEq ['2020-01-01', '2020-12-31'], durationToDates 'This year', now
			deepEq ['2019-01-01', '2019-12-31'], durationToDates 'Last year', now
			deepEq ['2020-01-01', '2020-03-31'], durationToDates 'So far this year', now
			deepEq ['1970-01-01', '2050-12-31'], durationToDates 'All time', now

	describe 'formatCardNo', ->
		it '1', -> eq '1234 1234 1234 1234', formatCardNo '1234123412341234'
		it '2', -> eq '1234 1234 1234 1234 1234', formatCardNo '12341234123412341234'
		it '3', -> eq '1234 1234', formatCardNo '1234 1234 '
		it '4', -> eq '1234 1234', formatCardNo '1234 1234 '
		it '5', -> eq '1234', formatCardNo '1234 ab'
		it '6', -> eq '1234 1234 1234 1234 1234 123', formatCardNo '1234 123412341234123412341234'

	describe 'formatExpiry', ->
		it '1', -> eq '12 / 12', formatExpiry '1212'
		it '2', -> eq '99', formatExpiry '99'
		it '3', -> eq '99', formatExpiry '99 / ab'

	describe.only 'validateExpiry', ->
		it '1', -> eq false, validateExpiry '13 / 26'
		it '2', -> eq false, validateExpiry '07 / 19'
		it '3', -> eq true, validateExpiry '12 / 26'
		it '4', -> eq false, validateExpiry '12 / 2'

	describe 'formatCVC', ->
		it '1', -> eq '123', formatCVC '123'
		it '2', -> eq '992', formatCVC '99-as.2oai'
		it '3', -> eq '123456', formatCVC '123456789'



















