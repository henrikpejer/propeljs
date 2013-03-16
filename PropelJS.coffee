"use strict"
class PropelJS
  constructor : (model) ->
    @propelObject =
      "model" : model
      "commands" : []

  findPk: (pk) ->
    @propelObject.commands.push(
      command:'findPk',
      args:[pk])
    @

  propel: ->
    @propelObject


window.PropelJS = PropelJS