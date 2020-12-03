isNil = require('ramda/src/isNil'); last = require('ramda/src/last'); match = require('ramda/src/match'); prepend = require('ramda/src/prepend'); #auto_require: srcramda
{} = RE = require 'ramda-extras' #auto_require: ramda-extras
[] = [] #auto_sugar
qq = (f) -> console.log match(/return (.*);/, f.toString())[1], f()
qqq = (...args) -> console.log ...args

React = require 'react'

useNegin = require './useNegin'

ren = 0
rot = 0


# A spinner implemented in javascript in order to block when js blocks.
# Writes out how long each blocker was.
module.exports = PerfSpinner = React.memo () ->
  renId = -1

  [_] = useNegin()
  [blockers, setBlockers] = React.useState([])

  addBlocker = (ms) ->
    setBlockers prepend "#{Math.round(ms)} ms", blockers

  _ {},
    React.createElement Spinner, {delay: 100, maxTime: 300, cb: addBlocker}
    _ {s: 'fa10bk-45 mt10 xc_e'},
      _ {s: 'fa11bk-25 _curp', onClick: -> setBlockers []}, 'Clear'
      fmapI blockers, (b, i) -> _ {key: i, s: "#{i == 0 && 'fa10bk-95'}"}, b


Spinner = React.memo ({delay, maxTime, cb}) ->
  renId = -1
  [_] = useNegin()
  ref = React.createRef()

  React.useEffect ->
    destroyTimer = createTimer delay, rotate
    return destroyTimer

  last = performance.now()

  rotate = ->
    rotId = ++rot
    t = performance.now()
    sinceLast = t - last
    # console.log [renId, rotId], Math.round(t), Math.round(last), Math.round(sinceLast), ref.current && 'DOM'
    if isNil ref.current then return

    last = t
      
    [___, sdeg] = match(/rotate\((\d+)deg\)/, ref.current.style.transform)
    if isNil sdeg then deg = 0 else deg = parseInt sdeg
    deg += 5
    if deg > 360 then deg = 0
    ref.current.style.transform = "rotate(#{deg}deg)"

    # console.log 'sinceLast, maxTime', sinceLast, maxTime
    if sinceLast > maxTime
      # console.log 'sinceLast > maxTime'
      cb sinceLast

  renId = ++ren
  _ {s: 'bordbk-1_4 bortbk-5_4 br50% w40 h40', ref}

createTimer = (delay, cb) ->
  isDestroyed = false

  tick = ->
    if isDestroyed then return
    cb()
    setTimeout tick, delay

  setTimeout tick, delay

  return () -> isDestroyed = true
