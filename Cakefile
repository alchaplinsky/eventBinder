VERSION = "0.1.0"

{exec} = require "child_process"

task "build", ->
  exec "cat src/version.js | sed s/{VERSION}/#{VERSION}/ > eventbinder.js"
  exec "coffee -cp src/eventbinder.coffee >> eventbinder.js"

task "copy", ->
  exec "cp eventbinder.js build/eventbinder-#{VERSION}.js"