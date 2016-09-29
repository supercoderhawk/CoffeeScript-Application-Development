# 在文档标题和主题中设置商店名称
nameElement = document.getElementById 'owner_name'
nameElement.innerHTML = shop.owner.name
document.title = shop.owner.name + '\'s Pet Shop'

# 设置宠物行为，包括叫声和动作
animalBehaviors = (animal) ->
  switch animal.type
    when 'cat' then ['meow', null]
    when 'dog' then ['bark', 'wag']
    when 'rabbit' then [null, 'hop hop']
    when 'horse', 'donkey'
      ['neigh', null]
    else
      [null, null]

# 格式化宠物名称
formatPetName = (pet, showBehavior) ->
  result = pet.name
  if showBehavior
    [sound, action] = animalBehaviors pet
    [behavior, cssClass] = if sound?
      [sound, 'sound']
    else
      [action, 'action']
    result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
  result

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

# 产生过滤列表html字符串
filterOutput = for type in ['All', 'Dog', 'Cat', 'Rabbit', 'Horse']
  "<li><a href='#' onclick='displayPetList(\"#{type}\")'>#{type}</a></li>"

# 插入文档
filterOpt = document.getElementById 'filtering_opts'
filterOpt.innerHTML = filterOutput.join ''

# 产生宠物的超链接
formatPetLink = (pet, index, showBehavior = true) ->
  "<a href='#' onclick='selectPet(#{index},this)'>#{formatPetName pet, showBehavior}</a>"

# 根据给定过滤类型过滤列表
window.displayPetList = (filter = 'All') ->
  petList = for animal, i in shop.animals when filter == 'All' or animal.type == filter.toLowerCase()
    "<li>#{formatPetLink animal, i}</li>"

  available_pets = document.getElementById 'available_pets'
  available_pets.innerHTML = petList.join ''
  firstElement = document.querySelector '#available_pets > li > a'
  firstElement.click()

# 从给定的宠物列表中随机选一个显示在宠物特性块中
displayFeatured = (featuredPets...) ->
  chosenPetIndex = Math.floor Math.random() * featuredPets.length
  chosenPetName = featuredPets[chosenPetIndex]
  for pet, index in shop.animals when pet.name == chosenPetName
    [chosenPet, listIndex] = [pet, index]
  featured = document.getElementById 'featured'
  if listIndex?
    featured.innerHTML = "<span class='title'>Featured Pet</span>" +
        formatPetLink chosenPet, listIndex, false
  else
    featured.innerHTML = "<span class='title'>Featured Pet</span><a href='#'>No Pet</a>"

# 页面加载时默认显示第一个
window.onload = ->
  displayPetList()
  displayFeatured 'Chupa', 'Kelsey', 'Flops'
