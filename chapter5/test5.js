// Generated by CoffeeScript 1.11.0
(function() {
  var Airplane, Automobile, Truck, plane, today, truck,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Airplane = (function() {
    function Airplane() {}

    Airplane.prototype.takeOff = function() {
      return console.log('Vrroom!');
    };

    return Airplane;

  })();

  plane = new Airplane();

  plane.takeOff();

  Date.prototype.getYearAE = function() {
    var monthOffset;
    monthOffset = this.getMonth() < 11 ? 1 : 0;
    return this.getFullYear() - 1944 - monthOffset;
  };

  today = new Date();

  console.log("It is the year " + (today.getYearAE()) + " AE");

  Automobile = (function() {
    function Automobile() {}

    Automobile.prototype.honk = function() {
      return console.log('Beep!');
    };

    return Automobile;

  })();

  Truck = (function(superClass) {
    extend(Truck, superClass);

    function Truck() {
      return Truck.__super__.constructor.apply(this, arguments);
    }

    Truck.prototype.honk = function(test) {
      Truck.__super__.honk.call(this);
      return console.log('Wee-oo wee-oo wee-oo');
    };

    return Truck;

  })(Automobile);

  truck = new Truck();

  truck.honk();

}).call(this);
