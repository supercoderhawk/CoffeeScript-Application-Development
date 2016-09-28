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

