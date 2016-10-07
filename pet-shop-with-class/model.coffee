# 店主信息类
class window.Person
  constructor: (@name) ->

  possessiveName: ->
    if @name[@name.length - 1] in ['s','x','z']
      "#{@name}'"
    else
      "#{@name}'s"

# 动物信息类
class window.Animal
  @fromHash: (data)->
    animal = new @
    animal[key] = val for key, val of data
    animal

  @loadSeedData: ->
    for animal in window.data.animals
      @fromHash animal

  behaviors: ->
    switch @type
      when 'cat' then ['meow', null]
      when 'dog' then ['bark', 'wag']
      when 'rabbit' then [null, 'hop hop']
      when 'horse', 'donkey' then ['neigh', null]
      else [null,null]