filter = require('ramda/src/filter'); none = require('ramda/src/none'); props = require('ramda/src/props'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar

React = require 'react'
ReactDOM = require 'react-dom'

useNegin = require './useNegin'


# stolen from https://reactjs.org/docs/portals.html
modalRoot = document.getElementById 'modal-root'

class ModalBase extends React.Component
	constructor: (props) ->
		super(props)
		@el = document.createElement 'div'

	componentDidMount: ->
		# The portal element is inserted in the DOM tree after
		# the Modal's children are mounted, meaning that children
		# will be mounted on a detached DOM node. If a child
		# component requires to be attached to the DOM tree
		# immediately when mounted, for example to measure a
		# DOM node, or uses 'autoFocus' in a descendant, add
		# state to Modal and only render the children when Modal
		# is inserted in the DOM tree.
		modalRoot.appendChild @el
		document.getElementById('root').style.filter = "url('#blurFilter')"
		# Workaround to not show scrollbar when mouse is connected
		document.getElementById('root').style.overflow = 'hidden'


	componentWillUnmount: ->
		modalRoot.removeChild @el
		document.getElementById('root').style.filter = 'none'
		document.getElementById('root').style.overflow = 'initial'

	render: ->
		ReactDOM.createPortal @props.children, @el

Modal = (props) ->
	_ = useNegin()
	_ ModalBase, {},
		_ {s: 'posa w100% p0_20 z11 top15vh <500[top5vh] xrc_ xg1 ' + props.s_},
			props.children
		_ {s: 'posf w100% h100% z10 bgbk-6 xrcc _fade1'}

		_ 'svg', {height: 0, width: 0},
			_ 'filter', {id: "blurFilter"},
				_ 'feGaussianBlur', {stdDeviation: 5}

module.exports = Modal

