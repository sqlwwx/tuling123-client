request = require('request')
Promise = require('bluebird')

Promise.promisifyAll request

module.exports = class Robot
  constructor: (@key, @api='http://www.tuling123.com/openapi/api')->
  ask: (info, options={}) ->
    options.key = @key
    options.info = info
    request.getAsync(@api, qs: options).then (res) ->
      Promise.resolve JSON.parse(res.body)

if require.main == module
  robot = new Robot('0a4114ff7687944016c9d50a07eb0f250',
    'http://www.tuling123.com/openapi/api')
  robot.ask('你好', userid: 'wwx').then (data) ->
    console.log data
    return
