// Generated by CoffeeScript 1.11.0
(function() {
  var animal, animalBehaviors, displayFeatured, filterOpt, filterOutput, formatPetDescription, formatPetLink, formatPetName, i, imageTag, nameElement, petList, pets, type,
    slice = [].slice;

  nameElement = document.getElementById('owner_name');

  nameElement.innerHTML = shop.owner.name;

  document.title = shop.owner.name + '\'s Pet Shop';

  animalBehaviors = function(animal) {
    switch (animal.type) {
      case 'cat':
        return ['meow', null];
      case 'dog':
        return ['bark', 'wag'];
      case 'rabbit':
        return [null, 'hop hop'];
      case 'horse':
      case 'donkey':
        return ['neigh', null];
      default:
        return [null, null];
    }
  };

  formatPetName = function(pet, showBehavior) {
    var action, behavior, cssClass, ref, ref1, result, sound;
    result = pet.name;
    if (showBehavior) {
      ref = animalBehaviors(pet), sound = ref[0], action = ref[1];
      ref1 = sound != null ? [sound, 'sound'] : [action, 'action'], behavior = ref1[0], cssClass = ref1[1];
      result += " <span class='" + cssClass + "'>" + (behavior.toLowerCase()) + "</span>";
    }
    return result;
  };

  petList = (function() {
    var j, len, ref, results;
    ref = shop.animals;
    results = [];
    for (i = j = 0, len = ref.length; j < len; i = ++j) {
      animal = ref[i];
      results.push("<li><a href='#' onclick='selectPet(" + i + ",this)'>" + (formatPetName(animal)) + "</a></li>");
    }
    return results;
  })();

  pets = document.getElementById('available_pets');

  pets.innerHTML = petList.join('');

  imageTag = function(filename) {
    if (filename != null) {
      return "<img src='images/" + filename + "' />";
    } else {
      return '';
    }
  };

  formatPetDescription = function(pet) {
    var ref;
    return ("<h2>" + pet.name + "</h2>") + ("<h3 class='breed'>" + pet.breed) + ("(" + ((ref = pet.age) != null ? ref : "??") + " years old)</h3>") + imageTag(pet.image) + ("<p class='description'>" + pet.description + "</p>");
  };

  window.selectPet = function(petIndex, element) {
    var j, len, link, pet, petInfo, ref;
    pet = shop.animals[petIndex];
    petInfo = document.getElementById("pet_information");
    petInfo.innerHTML = formatPetDescription(pet);
    ref = document.querySelectorAll("#available_pets > li > a");
    for (j = 0, len = ref.length; j < len; j++) {
      link = ref[j];
      link.className = '';
    }
    return element.className = 'selected';
  };

  filterOutput = (function() {
    var j, len, ref, results;
    ref = ['All', 'Dog', 'Cat', 'Rabbit', 'Horse'];
    results = [];
    for (j = 0, len = ref.length; j < len; j++) {
      type = ref[j];
      results.push("<li><a href='#' onclick='displayPetList(\"" + type + "\")'>" + type + "</a></li>");
    }
    return results;
  })();

  filterOpt = document.getElementById('filtering_opts');

  filterOpt.innerHTML = filterOutput.join('');

  formatPetLink = function(pet, index, showBehavior) {
    if (showBehavior == null) {
      showBehavior = true;
    }
    return "<a href='#' onclick='selectPet(" + index + ",this)'>" + (formatPetName(pet, showBehavior)) + "</a>";
  };

  window.displayPetList = function(filter) {
    var available_pets, firstElement;
    if (filter == null) {
      filter = 'All';
    }
    petList = (function() {
      var j, len, ref, results;
      ref = shop.animals;
      results = [];
      for (i = j = 0, len = ref.length; j < len; i = ++j) {
        animal = ref[i];
        if (filter === 'All' || animal.type === filter.toLowerCase()) {
          results.push("<li>" + (formatPetLink(animal, i)) + "</li>");
        }
      }
      return results;
    })();
    available_pets = document.getElementById('available_pets');
    available_pets.innerHTML = petList.join('');
    firstElement = document.querySelector('#available_pets > li > a');
    return firstElement.click();
  };

  displayFeatured = function() {
    var chosenPet, chosenPetIndex, chosenPetName, featured, featuredPets, index, j, len, listIndex, pet, ref, ref1;
    featuredPets = 1 <= arguments.length ? slice.call(arguments, 0) : [];
    chosenPetIndex = Math.floor(Math.random() * featuredPets.length);
    chosenPetName = featuredPets[chosenPetIndex];
    ref = shop.animals;
    for (index = j = 0, len = ref.length; j < len; index = ++j) {
      pet = ref[index];
      if (pet.name === chosenPetName) {
        ref1 = [pet, index], chosenPet = ref1[0], listIndex = ref1[1];
      }
    }
    featured = document.getElementById('featured');
    if (listIndex != null) {
      return featured.innerHTML = "<span class='title'>Featured Pet</span>" + formatPetLink(chosenPet, listIndex, false);
    } else {
      return featured.innerHTML = "<span class='title'>Featured Pet</span><a href='#'>No Pet</a>";
    }
  };

  window.onload = function() {
    displayPetList();
    return displayFeatured('Chupa', 'Kelsey', 'Flops');
  };

}).call(this);

//# sourceMappingURL=setup.js.map
