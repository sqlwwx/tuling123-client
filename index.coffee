request = require('request')
Promise = require('bluebird')

Promise.promisifyAll request

module.exports = class Robot
  constructor: (@key, @api='http://www.tuling123.com/openapi/api', @answer)->
  ask: (info, options={}, answer=@answer) ->
    ret = if answer then await answer info, options
    if ret
      return ret
    options.key = @key
    options.info = info
    request.getAsync(@api, qs: options).then (res) ->
      Promise.resolve JSON.parse(res.body)

if require.main == module
  robot = new Robot(
    '0a4114ff7687944016c9d50a07eb0f250',
    'http://www.tuling123.com/openapi/api',
    (info, options) ->
      if info.startsWith '#'
        'start command ' + info.substr 1
      else
        null
  )
  robot.ask('你好', userid: 'wwx').then console.log
  robot.ask('#list', userid: 'wwx').then console.log
  robot.ask('#list', userid: 'wwx', (info, options) ->
    if info.startsWith '#'
      'start command ' + info.substr(1) + ' for ' + options.userid
    else
      null
  ).then console.log
