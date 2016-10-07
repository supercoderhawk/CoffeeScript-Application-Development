class window.PetView
  constructor: (@pet) ->

  formattedDescription: ->
    "<h2>#{pet.name}</h2>" + "<h3 class='breed'>#{pet.breed} (#{pet.age ? '??'} years old)</h3>" +
      @imageTag(@pet.image) + "<p class='description'>#{@pet.description}</p>"

  imageTag: (filename) ->
    if filename?
      "<img src='images/#{filename}' />"
    else
      ""

  # 格式化宠物名称
  formattedName: (showBehavior) ->
    result = @pet.name
    if showBehavior
      [sound, action] = @pet.behaviors()
      [behavior, cssClass] = if sound?
        [sound, 'sound']
      else
        [action, 'action']
      result += " <span class='#{cssClass}'>#{behavior.toLowerCase()}</span>"
    result

  # 产生宠物的超链接
  formattedLink = (index, showBehavior = true) ->
    "<a href='#' onclick='selectPet(#{index},this)'>#{@formattedName showBehavior}</a>"

class window.PetListView
  constructor: (@views) ->

  renderList: (filter = 'All') ->
    petList = for animal, i in @views when filter == 'All' or view.pet.type == filter.toLowerCase()
      "<li>#{view.formattedLink i}</li>"

    available_pets = document.getElementById 'available_pets'
    available_pets.innerHTML = petList.join ''
#firstElement = document.querySelector '#available_pets > li > a'
#firstElement.click()

# 选中宠物触发的事件
  selectPet: (petIndex, element) ->
    petView = @views[petIndex]
    petInfo = document.getElementById "pet_information"
    petInfo.innerHTML = petView.formattedDescription()
    for link in document.querySelectorAll "#available_pets > li > a"
      link.className = ''
    element.className = 'selected'

  renderFeatured: (featuredPets...) ->
    chosenPetIndex = Math.floor Math.random() * featuredPets.length
    chosenPetName = featuredPets[chosenPetIndex]
    for view, index in @views when view.pet.name == chosenPetName
      [chosenView, listIndex] = [view, index]
    featured = document.getElementById 'featured'
    if listIndex?
      featured.innerHTML = "<span class='title'>Featured Pet</span>" +
          chosenView.formattedLink listIndex, false
    else
      featured.innerHTML = "<span class='title'>Featured Pet</span><a href='#'>No Pet</a>"

  renderFilteringBar: ->
    filterOutput = for type in ['All', 'Dog', 'Cat', 'Rabbit', 'Horse']
      "<li><a href='#' onclick='displayPetList(\"#{type}\")'>#{type}</a></li>"

    filterOpt = document.getElementById 'filtering_opts'
    filterOpt.innerHTML = filterOutput.join ''

  render: ->
    @renderList()
    @renderFilteringBar()
    @renderFeatured 'Chupa', 'Kelsey', 'Flopa'
    window.listView = @
    window.displayPetList = (filterType) ->
      window.listView.renderList(filterType)
    window.selectPet = (index, element) ->
      window.listView.selectPet(index, element)

class window.ShopView
  constructor: (@owner, @mainContent)->

  render: ->
    nameElement = document.getElementById 'owner_name'