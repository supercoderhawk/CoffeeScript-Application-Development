class Airplane
    takeOff: ->
        console.log 'Vrroom!'

plane = new Airplane()
plane.takeOff()

Date::getYearAE = ->
    monthOffset = if @getMonth() < 11 then 1 else 0
    @getFullYear() - 1944 - monthOffset

today = new Date()
console.log "It is the year #{today.getYearAE()} AE"

class Automobile
    honk: ->
        console.log 'Beep!'

class Truck extends Automobile
    honk: (test)->
        super()
        console.log 'Wee-oo wee-oo wee-oo'

truck = new Truck()
truck.honk()