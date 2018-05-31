axios = require 'axios'

module.exports = class Robot
  constructor: (@key, @api='http://www.tuling123.com/openapi/api', @answer)->
  ask: (info, options={}, answer=@answer) ->
    ret = if answer then await answer info, options
    if ret
      return ret
    options.key = @key
    options.info = info
    axios.get(@api, params: options).then (res) -> res.data
