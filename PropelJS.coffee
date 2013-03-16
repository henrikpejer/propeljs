"use strict"
class PropelJS
  propelObject =
    model:null,
    commands: []

  temp = {}

  constructor : (model) ->
    @propelObject =
      "model" : model
      "commands" : []
    @temp = {}

  findPk: (pk) ->
    @propelObject.commands.push(
      command:'findPk',
      args:[pk])
    @

  call: (name) ->
    if arguments.length > 1
      @propelObject.commands.push(
        command:name
        args:Array.prototype.slice.call(arguments)[1..])
    else
      @temp=
        "name":name
    @
  args:->
    @propelObject.commands.push(
      command:@temp.name
      args:arguments)
    @temp={}
    @

  propel: ->
    @propelObject


window.PropelJS = PropelJS