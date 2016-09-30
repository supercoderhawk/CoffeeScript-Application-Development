# 第五章 CoffeeScript中的类
## 在CoffeeScript中定义类
在CoffeeScript中，使用`class`定义类，使用关键字`new`实例化对象。

### 给类绑定方法
```coffeescript
class Airplane
    takeOff: ->
        console.log 'Vrroom!'

plane = new Airplane()
plane.takeOff()
```

### CoffeeScript如何构建Javascript类
CoffeeScript中的类型系统基于JavaScript的原型继承实现。上面的代码生成的JavaScript代码为：
```javascript
var Airplane;

Airplane = (function() {
    function Airplane() {}

    Airplane.prototype.takeOff = function() {
      return console.log('Vrroom!');
    };

    return Airplane;

})();
```

上面的例子中，函数先声明空构造函数，并将takeOff函数绑定到类的原型上。

### 保持对象属性状态
状态存储在绑定到对象的属性里。使用@运算符实现。
```coffeescript
class Airplane
    describle: ->
        "A #{@color} plane"

plane = new Airplane()
plane.color = 'white'
console.log plane.describle # 输出white
```

### 在对象中调用其他方法
```coffeescript
class Airplane
    takeOff: (eta) ->
        @taxi()
        console.log "#{s}..." for s in [eta..0]
        console.log 'Vrrroom'
    taxi: ->
        if Math.random() > 0.5
            console.log 'Taxiing...'
```

`@something`实际上是`this.something`的别名。我们甚至@替换出现的this。可以将@作为this作为参数传递。

### 在类定义的外面绑定方法
CoffeeScript提供`::`运算符，以简单实现对象原型的访问。如：
```coffeescript
Date::getYearAE = ->
    monthOffset = if @getMonth() < 11 then 1 else 0
    @getFullYear() - 1944 - monthOffset

today = new Date()
console.log "It is the year #{today.getYearAE()} AE" # 输出 It is the year 71 AE
```

上面使用`::`运算符的CoffeeScript代码编译为
```coffeescript
Date.prototype.getYearAE = function() {
    var monthOffset;
    monthOffset = this.getMonth() < 11 ? 1 : 0;
    return this.getFullYear() - 1944 - monthOffset;
  };
```

可以看到`::`使用原型来实现把函数绑定到类。

## 构造函数
只要加上名字为`constructor`的方法。同时，如果在构造函数列表中使用`@`命名标识符，则自动赋值给同名属性
```coffeescript
class Train
    constructor: (@numCars, @type = 'diesel') ->
        @load = 0
        @capacity = @numCars * 100
```

## 类的静态方法调用
静态方法为绑定到类本身，在没有任何实例化的对象时，可以作为单独的引用使用。在CoffeeScript中，使用@开头的函数为静态函数。例：

同时，也可将静态属性绑定到类。

```coffeescript
class Bicyle
    @WHEELS = 2
    @frameSizeByHeight: (rideHeight) ->
        Math.floor rideHeight * 0.82

Bicyle.frameSizeByHeight 10   # 调用静态方法
console.log Bicyle.WHEELS    # 输出 2
```

## 继承
在CoffeeScript中，类定义使用`extends`表明这个类继承自另一个类。

```coffeescript
class Automobile
    honk: ->
        console.log 'Beep!'

class Truck extends Automobile
    honk: ->
        super()
        console.log 'Wee-oo wee-oo wee-oo'
```

同时，CoffeeScript继承也支持重载方法，只要在子类中重新定义**与父类同名(参数不要求匹配)**的方法即可。同时，在重载方法内部，可以使用`super()`函数
