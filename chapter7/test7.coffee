class Boat
    liftAnchor: (doneCallback) ->
        console.log "Lifting anchor."

    setSpeed: (speed) ->
        console.log "Adjusting speed to #{speed} knots."

    depart: ->
        @liftAnchor ->
            @setSpeed 10
