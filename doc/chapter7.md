# CoffeeScript高级用法
## 正确的上下文
使用胖箭头`=>`表示将回调函数绑定到this对象。
```coffeescript
class t
    func: (callback)->
        if callback?
            setTimeout callback(), 1000
    func2: ->
        @func =>
            console.log 'test'
    
```

## 使用memoization节省工作
使用`?=`运算符实现缓存，即如果变量还未被赋值，则调用函数赋值，否则不赋值。