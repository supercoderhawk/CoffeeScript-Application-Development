yeti = 1
if yeti?
    console.log "I want to believe"
test = null
test ?= 'a'
test ||= 'm'
k = yeti?

bird = verb: 'singing', time: 'midnight'
{time:k} = bird
# console.log time+':' + k

[languageName, prefix] = "CoffeeScript".match /(.*)Script/
# console.log "I love the smell of #{prefix} in the morning."

[drink,[alcohol,mixer]] = ["Screwdriver", ["vodka", "orange juice", "m"]] 

direction = [
    {type: 'boat', directions: ['port', 'starboard']}
    {type: 'dogsled', directions: ['haw', 'gee']}
]

[boatInfo, {directions: [left, right]}] = direction

# console.log 'boatInfo: ' + boatInfo.type
# console.log 'left: ' + left + '; right: ' + right 

func = (a, b = 'KK') ->
    console.log a + ':' + b

func('a','v')

func2 = (a,b...)->
    console.log b.length

func2(1,2,3,4)

[race, [splits..., time]] = ['10K',['13:08','13:09','23:17']]

console.log race
console.log splits

func3 = (a,b,c) ->
    len = arguments.length
    console.log len 
    if len == 1
        a
    else if len == 2
        a + ',' + b
    else if len == 3
        a + ',' + b + ',' + c
    else
        'null'

arr = [1,2,3]

console.log func3 arr...

func4 = (a,b...) ->
    for v in b
        console.log v
    console.log Math.min b...

# func4 1, 2, 3, 4

