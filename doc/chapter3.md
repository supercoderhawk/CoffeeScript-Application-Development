# 第三章-构建简单的应用程序
## 字符串插值
CoffeeScript提供了一种更好的构建字符串的解决方案。在**双引号字符串**(单引号无效)中使用`#{}`包含一个动态的值。

```coffeescript
str = 'Hello, CoffeeScript.'
console.log "#{str + ':)'}"
# 输出：Hello, CoffeeScript:)
```

## 定义函数
CoffeeScript引入lambda表达式的形式来定义函数。

函数定义：

```coffeescript
# 定义有参函数并调用
sayHello = (name)->
    return "Hello, #{name}!"
sayHello "Programmer"   # 输出Hello, Programmer!

# 定义无参函数并调用
sayGoodBye = ->
    return "Bye now!"
sayGoodBye() # 输出Bye now!

```

### 函数命名
大多数情况下，CoffeeScript不支持形如`function sayHello(name){...}`的命名函数，只支持绑定函数。

JavaScript中的命名函数在文件中其他一切之前执行定义，但是绑定函数不遵循此规则，绑定函数只在函数声明（定义）的位置执行声明操作，也就是说，只有在此之后的代码可以调用此函数，在绑定函数之前无法调用此函数。

### 函数返回
CoffeeScript中函数有一个重要特性：**隐式返回**。即函数中如果没有显式给定返回的值，那么函数将以运行时执行的最后一条语句结果作为返回值。

其中，如果最有一条语句为`if`语句，则在`if`语句的每个分支中都加入`return`语句；如果是for循环，则返回每次循环执行结果组成的