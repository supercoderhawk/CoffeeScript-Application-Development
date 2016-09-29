# 第四章-改进应用程序
## 检查值是否存在
### 使用存在运算符
CoffeeScript中有一个非常有用的存在运算符`?`，它能正确地处理值是否存在(存在的意思为变量不为undefined或者null)的情况。在变量后添加`?`来判断它是否存在。

注意，**使用?运算符时必须紧靠在标识符后，不能有空格，否则编译出错，?=运算度不受此影响**

```coffeescript
if yeti?
    'I want to believe'
###
上面的代码被编译为：
if(typeof yeti != null){
    'I want to believe'
}
###
```

### 在链式调用中
通过在链式调用中使用`?`可以防止空值造成类型错误，同时，这样做也无法对不同层次的属性的不存在分别处理。
```
tree = 
    pine:
        type: 'evergreen'
    crabapple:
        type: 'deciduous'
        fruit:
            ediable: false
if trees.pine.fruit?.edible
    console.log "Mmm.. pine fruit"
```

对于数组和函数调用，也可使用`?`运算符。

```coffeescript
# 数组
alpha = 
    lowercase: ['a','b','c','d']
console.log alpha.lowercase?[2].toUpperCase() # 执行
console.log alpha.uppercase?[2].toLowerCase() # 不执行

# 函数
oppositeMath = 
    min: Math.max
console.log oppositeMath.min?(3.2.5) # 执行
console.log oppositeMath.max?(3,2,5) # 不执行
```

### 以空值为条件，赋新值
```coffeescript
brief = null
breif ?= 2  # breif为2
```

上面的例子中需要注意的是：`?=`运算符左侧不能使用未声明的变量，否则编译会出错，因为变量不是有效引用。`?`运算符不受此约束。

`||`和比较运算符都被扩展了，也就是说`||=`和`or=`都是合法的。
