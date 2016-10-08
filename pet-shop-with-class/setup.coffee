shop = {
  owner : new Person data.ownerName
  animals: Animal.loadSeedData()
}

petViews = (new PetView pet for pet in shop.animals)
petListView = new PetListView petViews
mainView = new ShopView shop.owner, petListView
mainView.render()