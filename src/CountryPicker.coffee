find = require('ramda/src/find'); map = require('ramda/src/map'); match = require('ramda/src/match'); props = require('ramda/src/props'); test = require('ramda/src/test'); toLower = require('ramda/src/toLower'); toUpper = require('ramda/src/toUpper'); union = require('ramda/src/union'); whereEq = require('ramda/src/whereEq'); #auto_require: srcramda
{func, $} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args
_ = (...xs) -> xs

React = require 'react'
rfr = require 'react-functional-router'

useNegin = require './useNegin'
{useChangeState, useOuterClick, keyCodes: {ENTER, UP, DOWN}} = require './utils'
AutoComplete = require './AutoComplete'
Button = require './Button'
DropDown = require './DropDown'
clm = require 'country-locale-map'


# https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
countries = [
	{code: 'AF', name: 'Afghanistan'}
	{code: 'AL', name: 'Albania'}
	{code: 'DZ', name: 'Algeria'}
	{code: 'AS', name: 'American Samoa'}
	{code: 'AD', name: 'Andorra'}
	{code: 'AO', name: 'Angola'}
	{code: 'AI', name: 'Anguilla'}
	{code: 'AQ', name: 'Antarctica'}
	{code: 'AG', name: 'Antigua and Barbuda'}
	{code: 'AR', name: 'Argentina'}
	{code: 'AM', name: 'Armenia'}
	{code: 'AW', name: 'Aruba'}
	{code: 'AU', name: 'Australia'}
	{code: 'AT', name: 'Austria'}
	{code: 'AZ', name: 'Azerbaijan'}
	{code: 'BS', name: 'Bahamas'}
	{code: 'BH', name: 'Bahrain'}
	{code: 'BD', name: 'Bangladesh'}
	{code: 'BB', name: 'Barbados'}
	{code: 'BY', name: 'Belarus'}
	{code: 'BE', name: 'Belgium'}
	{code: 'BZ', name: 'Belize'}
	{code: 'BJ', name: 'Benin'}
	{code: 'BM', name: 'Bermuda'}
	{code: 'BT', name: 'Bhutan'}
	{code: 'BO', name: 'Bolivia (Plurinational State of)'}
	# {code: 'BQ', name: 'Bonaire, Sint Eustatius and Saba'}
	{code: 'BW', name: 'Botswana'}
	# {code: 'BV', name: 'Bouvet Island'}
	{code: 'BR', name: 'Brazil'}
	# {code: 'IO', name: 'British Indian Ocean Territory'}
	{code: 'BN', name: 'Brunei Darussalam'}
	{code: 'BG', name: 'Bulgaria'}
	{code: 'BF', name: 'Burkina Faso'}
	{code: 'BI', name: 'Burundi'}
	{code: 'CV', name: 'Cabo Verde'}
	{code: 'KH', name: 'Cambodia'}
	{code: 'CM', name: 'Cameroon'}
	{code: 'CA', name: 'Canada'}
	{code: 'KY', name: 'Cayman Islands'}
	{code: 'CF', name: 'Central African Republic'}
	{code: 'TD', name: 'Chad'}
	{code: 'CL', name: 'Chile'}
	{code: 'CN', name: 'China'}
	# {code: 'CX', name: 'Christmas Island'}
	# {code: 'CC', name: 'Cocos (Keeling) Islands'}
	{code: 'CO', name: 'Colombia'}
	{code: 'KM', name: 'Comoros'}
	{code: 'CG', name: 'Congo'}
	{code: 'CD', name: 'Congo, Democratic Republic of the'}
	{code: 'CK', name: 'Cook Islands'}
	{code: 'CR', name: 'Costa Rica'}
	{code: 'CI', name: 'Côte d\'Ivoire'}
	{code: 'HR', name: 'Croatia'}
	{code: 'CU', name: 'Cuba'}
	# {code: 'CW', name: 'Curaçao'}
	{code: 'CY', name: 'Cyprus'}
	{code: 'CZ', name: 'Czechia'}
	{code: 'DK', name: 'Denmark'}
	{code: 'DJ', name: 'Djibouti'}
	{code: 'DM', name: 'Dominica'}
	{code: 'DO', name: 'Dominican Republic'}
	{code: 'EC', name: 'Ecuador'}
	{code: 'EG', name: 'Egypt'}
	{code: 'SV', name: 'El Salvador'}
	{code: 'GQ', name: 'Equatorial Guinea'}
	{code: 'ER', name: 'Eritrea'}
	{code: 'EE', name: 'Estonia'}
	{code: 'SZ', name: 'Eswatini'}
	{code: 'ET', name: 'Ethiopia'}
	# {code: 'FK', name: 'Falkland Islands (Malvinas)'}
	{code: 'FO', name: 'Faroe Islands'}
	{code: 'FJ', name: 'Fiji'}
	{code: 'FI', name: 'Finland'}
	{code: 'FR', name: 'France'}
	# {code: 'GF', name: 'French Guiana'}
	{code: 'PF', name: 'French Polynesia'}
	# {code: 'TF', name: 'French Southern Territories'}
	{code: 'GA', name: 'Gabon'}
	{code: 'GM', name: 'Gambia'}
	{code: 'GE', name: 'Georgia'}
	{code: 'DE', name: 'Germany'}
	{code: 'GH', name: 'Ghana'}
	{code: 'GI', name: 'Gibraltar'}
	{code: 'GR', name: 'Greece'}
	{code: 'GL', name: 'Greenland'}
	{code: 'GD', name: 'Grenada'}
	{code: 'GP', name: 'Guadeloupe'}
	{code: 'GU', name: 'Guam'}
	{code: 'GT', name: 'Guatemala'}
	{code: 'GG', name: 'Guernsey'}
	{code: 'GN', name: 'Guinea'}
	{code: 'GW', name: 'Guinea-Bissau'}
	{code: 'GY', name: 'Guyana'}
	{code: 'HT', name: 'Haiti'}
	# {code: 'HM', name: 'Heard Island and McDonald Islands'}
	{code: 'VA', name: 'Holy See'}
	{code: 'HN', name: 'Honduras'}
	{code: 'HK', name: 'Hong Kong'}
	{code: 'HU', name: 'Hungary'}
	{code: 'IS', name: 'Iceland'}
	{code: 'IN', name: 'India'}
	{code: 'ID', name: 'Indonesia'}
	{code: 'IR', name: 'Iran (Islamic Republic of)'}
	{code: 'IQ', name: 'Iraq'}
	{code: 'IE', name: 'Ireland'}
	{code: 'IM', name: 'Isle of Man'}
	{code: 'IL', name: 'Israel'}
	{code: 'IT', name: 'Italy'}
	{code: 'JM', name: 'Jamaica'}
	{code: 'JP', name: 'Japan'}
	{code: 'JE', name: 'Jersey'}
	{code: 'JO', name: 'Jordan'}
	{code: 'KZ', name: 'Kazakhstan'}
	{code: 'KE', name: 'Kenya'}
	{code: 'KI', name: 'Kiribati'}
	{code: 'KP', name: 'Korea (Democratic People\'s Republic of)'}
	{code: 'KR', name: 'Korea, Republic of'}
	{code: 'KW', name: 'Kuwait'}
	{code: 'KG', name: 'Kyrgyzstan'}
	{code: 'LA', name: 'Lao People\'s Democratic Republic'}
	{code: 'LV', name: 'Latvia'}
	{code: 'LB', name: 'Lebanon'}
	{code: 'LS', name: 'Lesotho'}
	{code: 'LR', name: 'Liberia'}
	{code: 'LY', name: 'Libya'}
	{code: 'LI', name: 'Liechtenstein'}
	{code: 'LT', name: 'Lithuania'}
	{code: 'LU', name: 'Luxembourg'}
	{code: 'MO', name: 'Macao'}
	{code: 'MG', name: 'Madagascar'}
	{code: 'MW', name: 'Malawi'}
	{code: 'MY', name: 'Malaysia'}
	{code: 'MV', name: 'Maldives'}
	{code: 'ML', name: 'Mali'}
	{code: 'MT', name: 'Malta'}
	{code: 'MH', name: 'Marshall Islands'}
	{code: 'MQ', name: 'Martinique'}
	{code: 'MR', name: 'Mauritania'}
	{code: 'MU', name: 'Mauritius'}
	# {code: 'YT', name: 'Mayotte'}
	{code: 'MX', name: 'Mexico'}
	{code: 'FM', name: 'Micronesia (Federated States of)'}
	{code: 'MD', name: 'Moldova, Republic of'}
	{code: 'MC', name: 'Monaco'}
	{code: 'MN', name: 'Mongolia'}
	{code: 'ME', name: 'Montenegro'}
	{code: 'MS', name: 'Montserrat'}
	{code: 'MA', name: 'Morocco'}
	{code: 'MZ', name: 'Mozambique'}
	{code: 'MM', name: 'Myanmar'}
	{code: 'NA', name: 'Namibia'}
	{code: 'NR', name: 'Nauru'}
	{code: 'NP', name: 'Nepal'}
	{code: 'NL', name: 'Netherlands'}
	{code: 'NC', name: 'New Caledonia'}
	{code: 'NZ', name: 'New Zealand'}
	{code: 'NI', name: 'Nicaragua'}
	{code: 'NE', name: 'Niger'}
	{code: 'NG', name: 'Nigeria'}
	# {code: 'NU', name: 'Niue'}
	# {code: 'NF', name: 'Norfolk Island'}
	{code: 'MK', name: 'North Macedonia'}
	# {code: 'MP', name: 'Northern Mariana Islands'}
	{code: 'NO', name: 'Norway'}
	{code: 'OM', name: 'Oman'}
	{code: 'PK', name: 'Pakistan'}
	{code: 'PW', name: 'Palau'}
	{code: 'PS', name: 'Palestine, State of'}
	{code: 'PA', name: 'Panama'}
	{code: 'PG', name: 'Papua New Guinea'}
	{code: 'PY', name: 'Paraguay'}
	{code: 'PE', name: 'Peru'}
	{code: 'PH', name: 'Philippines'}
	# {code: 'PN', name: 'Pitcairn'}
	{code: 'PL', name: 'Poland'}
	{code: 'PT', name: 'Portugal'}
	{code: 'PR', name: 'Puerto Rico'}
	{code: 'QA', name: 'Qatar'}
	{code: 'RE', name: 'Réunion'}
	{code: 'RO', name: 'Romania'}
	{code: 'RU', name: 'Russian Federation'}
	{code: 'RW', name: 'Rwanda'}
	# {code: 'BL', name: 'Saint Barthélemy'}
	# {code: 'SH', name: 'Saint Helena, Ascension and Tristan da Cunha'}
	{code: 'KN', name: 'Saint Kitts and Nevis'}
	{code: 'LC', name: 'Saint Lucia'}
	# {code: 'MF', name: 'Saint Martin (French part)'}
	# {code: 'PM', name: 'Saint Pierre and Miquelon'}
	{code: 'VC', name: 'Saint Vincent and the Grenadines'}
	{code: 'WS', name: 'Samoa'}
	{code: 'SM', name: 'San Marino'}
	{code: 'ST', name: 'Sao Tome and Principe'}
	{code: 'SA', name: 'Saudi Arabia'}
	{code: 'SN', name: 'Senegal'}
	{code: 'RS', name: 'Serbia'}
	{code: 'SC', name: 'Seychelles'}
	{code: 'SL', name: 'Sierra Leone'}
	{code: 'SG', name: 'Singapore'}
	# {code: 'SX', name: 'Sint Maarten (Dutch part)'}
	{code: 'SK', name: 'Slovakia'}
	{code: 'SI', name: 'Slovenia'}
	{code: 'SB', name: 'Solomon Islands'}
	{code: 'SO', name: 'Somalia'}
	{code: 'ZA', name: 'South Africa'}
	# {code: 'GS', name: 'South Georgia and the South Sandwich Islands'}
	# {code: 'SS', name: 'South Sudan'}
	{code: 'ES', name: 'Spain'}
	{code: 'LK', name: 'Sri Lanka'}
	{code: 'SD', name: 'Sudan'}
	{code: 'SR', name: 'Suriname'}
	# {code: 'SJ', name: 'Svalbard and Jan Mayen'}
	{code: 'SE', name: 'Sweden'}
	{code: 'CH', name: 'Switzerland'}
	{code: 'SY', name: 'Syrian Arab Republic'}
	{code: 'TW', name: 'Taiwan, Province of China'}
	{code: 'TJ', name: 'Tajikistan'}
	{code: 'TZ', name: 'Tanzania, United Republic of'}
	{code: 'TH', name: 'Thailand'}
	{code: 'TL', name: 'Timor-Leste'}
	{code: 'TG', name: 'Togo'}
	# {code: 'TK', name: 'Tokelau'}
	{code: 'TO', name: 'Tonga'}
	{code: 'TT', name: 'Trinidad and Tobago'}
	{code: 'TN', name: 'Tunisia'}
	{code: 'TR', name: 'Turkey'}
	{code: 'TM', name: 'Turkmenistan'}
	{code: 'TC', name: 'Turks and Caicos Islands'}
	{code: 'TV', name: 'Tuvalu'}
	{code: 'UG', name: 'Uganda'}
	{code: 'UA', name: 'Ukraine'}
	{code: 'AE', name: 'United Arab Emirates'}
	{code: 'GB', name: 'United Kingdom of Great Britain and Northern Ireland', alias: ['uk', 'england', 'britan']}
	# {code: 'UM', name: 'United States Minor Outlying Islands'}
	{code: 'US', name: 'United States of America', alias: ['usa']}
	{code: 'UY', name: 'Uruguay'}
	{code: 'UZ', name: 'Uzbekistan'}
	{code: 'VU', name: 'Vanuatu'}
	{code: 'VE', name: 'Venezuela (Bolivarian Republic of)'}
	{code: 'VN', name: 'Viet Nam'}
	{code: 'VG', name: 'Virgin Islands (British)'}
	{code: 'VI', name: 'Virgin Islands (U.S.)'}
	# {code: 'WF', name: 'Wallis and Futuna'}
	{code: 'EH', name: 'Western Sahara'}
	{code: 'YE', name: 'Yemen'}
	{code: 'ZM', name: 'Zambia'}
	{code: 'ZW', name: 'Zimbabwe'}
	{code: 'AX', name: 'Åland Islands'}
]


###############################################################################
CountryPicker = func
	isPicked: ({name, code}) -> Boolean
	onPicked: ({name, code}) ->
	inputS〳: String
	className〳: String
	s_〳: String # Just pass-through for easier debugging
	s__〳: String # Just pass-through for easier debugging
,
(props) ->
	_ = useNegin()
	[state, changeState] = useChangeState {isPicking: false}

	groups = [{items: countries}]
	pickedItem = null
	for c in countries
		if props.isPicked c
			pickedItem = c
			break

	_ AutoComplete, {s: '', inputS: props.inputS || 'fa13bk-86 _noOut', groups,
	onPicked: (country) -> props.onPicked country
	test: (text, item) ->
		if !item then false
		else if test new RegExp("^#{text}", 'i'), item.name then true
		else if item.alias
			for a in item.alias
				if test new RegExp("^#{text}", 'i'), a then return true
			return false
		else false
	},
	(selectedIdx, groups) ->
		_ {s: 'posa top35 w100% bgwh sh0_1_8_1_bk-2 z20'},
			$ groups[0]?.items || [], map (country) ->
				_ {key: country.code, tabIndex: 0, onMouseDown: -> props.onPicked(country),
				s: "p2_10 xr_c #{selectedIdx == country.idx && 'bggyb-6'} ho(bggyb-4) curp"},
					_ 'ul', {className: 'f16', s: 'm0 p0'},
							_ 'li', {className: "flag flag__#{toLower country.code}"}
					_ {s: 'fa12bk-85 ml7 mb1 p5_0'}, country.name

CountryPicker.currency = func
	isPicked: ({name, code}) -> Boolean
	onPicked: ({name, code}) ->
	inputS〳: String
	className〳: String
	s_〳: String # Just pass-through for easier debugging
	s__〳: String # Just pass-through for easier debugging
,
(props) ->
	_ = useNegin()
	[state, changeState] = useChangeState {isPicking: false}

	groups = [{items: countries}]
	pickedItem = null
	for c in countries
		if props.isPicked c
			pickedItem = c
			break

	_ AutoComplete, {s: '', inputS: props.inputS || 'fa13bk-86 _noOut', groups,
	onPicked: (country) -> props.onPicked country
	test: (text, item) ->
		if !item then false
		else if test new RegExp("^#{text}", 'i'), item.name then true
		else if test new RegExp("^#{text}", 'i'), clm.getCurrencyByAlpha2 item.code then true
		else if item.alias
			for a in item.alias
				if test new RegExp("^#{text}", 'i'), a then return true
			return false
		else false
	},
	(selectedIdx, groups) ->
		_ {s: 'posa top35 w100% bgwh sh0_1_8_1_bk-2 z20'},
			$ groups[0]?.items || [], map (country) ->
				_ {key: country.code, tabIndex: 0, onMouseDown: -> props.onPicked(country),
				s: "p2_10 xr_c #{selectedIdx == country.idx && 'bggyb-6'} ho(bggyb-4) curp"},
					_ 'ul', {className: 'f16', s: 'm0 p0'},
							_ 'li', {className: "flag flag__#{toLower country.code}"}
					_ {s: 'fa12bk-85 ml7 mb1 p5_0'}, country.name + ' - ' + clm.getCurrencyByAlpha2 country.code

	# _ DropDown,
	# 	groups: groups
	# 	onPicked: (task) -> props.onPicked task
	# 	input: ({isOpen, onClick}) ->
	# 		_ {onClick, s: 'bgwh br10 p10_20 curp _sh10', className: props.className},
	# 			if pickedItem
	# 				_ {s: 'xrcc', key: pickedItem.code},
	# 					_ 'ul', {className: 'f16'},
	# 						_ 'li', {className: "flag #{pickedItem.code}"}
	# 					_ {s: 'fa12bk-66 ml4 mr5'}, pickedItem.name
	# 	content: (selectedIdx, groups, close) ->
	# 		_ {s: 'posa top38 bgwh w100% sh0_1_8_1 z20 p4_0'},
	# 			_ {s: 'p5_0_5_0'}, 'test'

					# $ groups[0].items, map (item) ->
					# 	extra = if props.isPicked item then 'bggy-1'
					# 	_ {key: item.idx, onClick: -> props.onPicked(item),
					# 	s: "p6_15_6_15 mb1px xrbc hofo(bggy-1) curp #{extra}"},
					# 		_ {s: 'xr_c'},
					# 			_ {s: 'fa12bk-85 whn'}, item.name
					# 		if extra then _ icons('check'), {s: 'fillbk-3 w14 h14'}
							# if extra then _ {s: ''}, 'test'




							# if contains item, props.picked
							# 	_ {key: item.idx, onClick: -> props.onPicked(item),
							# 	s: "p6_20_6_20 xrbc hofo(bggy-1) curp bggy-2"},
							# 		_ {s: 'xr_c'},
							# 			_ {s: "w14 h13 mr8 bg#{colors.fromId item.color}"}
							# 			_ {s: 'fa12bk-85 whn'}, item.name
							# 		_ icons('check'), {s: 'fillbk-3 w14 h14'}
							# else
							# 	_ {key: item.idx, onClick: -> props.onPicked(item),
							# 	s: "p6_20_6_20 xrbc hofo(bggy-1) curp"},
							# 		_ {s: 'xr_c'},
							# 			_ {s: "w14 h13 mr8 bg#{colors.fromId item.color}"}
							# 			_ {s: 'fa12bk-85 whn'}, item.name

CountryPicker.codeToName = (code) ->
	res = find whereEq({code: toUpper code || ''}), countries
	return res && res.name || null



module.exports = CountryPicker
