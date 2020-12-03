fela = require 'fela'
prefixer = require('fela-plugin-prefixer').default
fallbackValue = require('fela-plugin-fallback-value').default

colors = require './colors'

felaRenderer = fela.createRenderer {plugins: [prefixer(), fallbackValue()]}

felaRenderer.renderStatic """
html, body {
	display: flex;
	flex-grow: 1;
	margin: 0;
	padding: 0;
	font-family: 'Open Sans', sans-serif;
	height: 100%;
}

html {
	font-size: calc(9px + 0.2vw);
	background-color: #{colors 'be'};
	-webkit-tap-highlight-color: transparent;
}

@media screen and (max-width: 320px) {
	html {
		font-size: 10px;
	}
}

@media screen and (min-width: 1000px) {
	html {
		font-size: 12px;
	}
}

* {
	box-sizing: border-box;
}

#root {
	display: flex;
	flex-grow: 1;
}

::placeholder {
	color: #{colors 'bk-2'}
}
.pl1::placeholder {
	color: #{colors 'bk-1'}
}

/* MENU here because css too advanced for fela
	inspiration from: https://codepen.io/lbebber/pen/rawQKR
*/
.menu:active, .menuOpen {
	background-color: #{colors 'bu'};
	width: 800px;
	box-shadow: -1px 0px 15px 25px #{colors 'bu'};
}
.menuItem {
	transition-timing-function: cubic-bezier(0.05, 0.95, 0.32, 0.96);
	transition-duration: 400ms;
	transform: scale(1.0,1.0) translate3d(0px, 0px, 0px);
	-webkit-tap-highlight-color: transparent;
}
.menuItem > .menuItemText {
	opacity: 0;
}
.menuItem:hover > .menuItemText,
.menuItem:focus > .menuItemText,
.menuItemSel > .menuItemText {
	opacity: 1;
}
.menuItem > svg {
	transition: ease-out 180ms;
}
.subMenu > div > .menuItem {
	opacity: 0;
	visibility: hidden;
}
.menuItem:hover > svg, .menuItem:focus > svg, .menuItemSel > svg {
	transform: scale(1.2, 1.2);
	fill: #{colors 'bub'};
	stroke: none;
}
.menu:active + .subMenu > div > .menuItem,
.menuOpen + .subMenu > div > .menuItem {
	opacity: 1;
	visibility: visible;
}
.menu:active + .subMenu > div > .menuItem:nth-child(1),
.menuOpen + .subMenu > div > .menuItem:nth-child(1) {
	transform: translate3d(-60px, 0px, 0px);
}
.menu:active + .subMenu > div > .menuItem:nth-child(2),
.menuOpen + .subMenu > div > .menuItem:nth-child(2) {
	transform: translate3d(-120px, 0px, 0px);
}
.menu:active + .subMenu > div > .menuItem:nth-child(3),
.menuOpen + .subMenu > div > .menuItem:nth-child(3) {
	transform: translate3d(-180px, 0px, 0px);
}
.menu:active + .subMenu > .menuItem:nth-child(4),
.menuOpen + .subMenu > div > .menuItem:nth-child(4) {
	transform: translate3d(-240px, 0px, 0px);
}



/* RESETS */
a {
	text-decoration: none;
}

/*
a:visited { text-decoration: none; color: inherit; }
a:hover { text-decoration: none; color: inherit; }
a:focus { text-decoration: none; color: inherit; }
a:hover, a:active { text-decoration: none; color: inherit; }
*/

input {
	background: none;
	border: none;
}

textarea,
input.text,
input[type="text"],
input[type="password"],
input[type="button"],
input[type="submit"] {
	/* https://www.daretothink.co.uk/stop-ios-styling-your-input-fields-and-buttons/ */
	/* https://stackoverflow.com/a/15440636/416797 */
	-webkit-appearance: none;
	/*border-radius: 0; This messes with br8_8_8_8, disabling for now*/
	margin: 0; /* seems iOS (eg. iPhone 8) adds some margin */
}

button {
	border: none;
}

input:focus, textarea:focus {
	outline: none;
	/*box-shadow: 0 0 3px 2px #{colors 'bu-9'};*/
	/*transition: box-shadow linear 0.2s;*/
}

@keyframes spin {
	0% { transform: rotate(0deg); }
	100% { transform: rotate(360deg); }
}


"""

module.exports = felaRenderer
