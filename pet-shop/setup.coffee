# 在文档标题和主题中设置商店名称
nameElement = document.getElementById 'owner_name'
nameElement.innerHTML = shop.owner.name
document.title = shop.owner.name + '\'s Pet Shop'

# 设置宠物叫声
animalSound = (animal) ->
  switch animal.type
    when 'cat' then 'meow'
    when 'dog' then 'bark'
    when 'horse', 'dnkey'
      'neigh'
    else
      'sniff sniff'

# 格式化宠物名称
formatPetName = (pet) ->
  "#{pet.name} <span class='sound'>#{animalSound pet}!</span>"

# 插入宠物数据
petList = for animal, i in shop.animals
  "<li><a href='#' onclick='selectPet(#{i},this)'>#{formatPetName animal}</a></li>"

pets = document.getElementById 'available_pets'
pets.innerHTML = petList.join ''

# 输入图片文件名,输出图片html元素
imageTag = (filename)->
  if filename?
    "<img src='images/#{filename}' />"
  else
    ''

# 输入宠物对象，输出宠物对象信息的html字符串
formatPetDescription = (pet) ->
  "<h2>#{pet.name}</h2>" +
    "<h3 class='breed'>#{pet.breed}" +
    "(#{pet.age ? "??"} years old)</h3>" +
    imageTag(pet.image) +
    "<p class='description'>#{pet.description}</p>"

# 选中宠物触发的事件
window.selectPet = (petIndex, element) ->
  pet = shop.animals[petIndex]
  petInfo = document.getElementById "pet_information"
  petInfo.innerHTML = formatPetDescription pet
  for link in document.querySelectorAll "#available_pets > li > a"
    link.className = ''
  element.className = 'selected'

# 页面加载时默认显示第一个
window.onload = ->
  firstElement = document.querySelector '#available_pets > li > a'
  firstElement.click()