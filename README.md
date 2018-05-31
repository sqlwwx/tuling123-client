# tuling123-client
## Installation
```shell
npm install tuling123-client
```
## Getting Started

```
Robot = require 'tuling123-client'
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
```

