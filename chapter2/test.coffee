# 循环
animals = ['dog','cat','bird']

for animal, index in animals
    console.log index + ':' + animal

pluralAnimals = for animal in animals
    animal + 's'

# console.log pluralAnimals

arr = [0..10]

console.log n for n in arr by 2

plants = {'p-grass':'grass', 'p-flower':'flower'}
for k,v of plants
    console.log k + ':' + v

str = "#{1+1}=#{1+1}"
# console.log str

iSpy = 'blue'

switch iSpy
    when 'sky'
        console.log 'blue'
    when 'grass', 'frog'
        console.log 'green'
    when 'lake' then 'dark'
    else 
        console.log 'gray'