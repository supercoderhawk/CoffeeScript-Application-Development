# 商店信息，包括所有者名字和宠物名字
shop = {
  owner: {name: 'Programmer'}
  animals: [
    {name: 'Kelsey', type: 'dog'}
    {name: 'Sgt. Snuffles', type: 'dog'}
    {name: 'Chomps', type: 'rabbit'}
    {name: 'Flops', type: 'rabbit'}
    {name: 'Bopper', type: 'rabbit'}
    {name: 'Chairman Meow', type: 'cat'}
    {name: 'Jacques', type: 'cat'}
    {name: 'Chupa', type: 'cat'}
    {name: 'Alfred', type: 'horse'}
  ]
}

# 在文档标题和主题中设置商店名称
nameElement = document.getElementById 'owner_name'
nameElement.innerHTML = shop.owner.name
document.title = shop.owner.name + '\'s Pet Shop'

# 插入宠物数据
petList = for animal in shop.animals
  '<li>' + animal.name + '</li>'

pets = document.getElementById 'available_pets'
pets.innerHTML = petList.join ''

