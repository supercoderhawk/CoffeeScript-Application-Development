# 第四章-改进应用程序
## 检查值是否存在
### 使用存在运算符
CoffeeScript中有一个非常有用的存在运算符`?`，它能正确地处理值是否存在(存在的意思为变量不为undefined或者null)的情况。在变量后添加`?`来判断它是否存在。

注意，**如果?运算符后没有参数，那么在使用?运算符时必须紧靠在标识符后，不能有空格，否则会按照函数调用编译，编译出错。**

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

## 一次给多个变量赋值
CoffeeScript提供了解构赋值的功能，即只用一个表达式，就可以实现给数组或者对象中的多个变量赋值。

```coffeescript
[first, second] = ["home","cart"]
[first, second] = [second, first] # 变量替换
[drink,[alcohol, mixer]] = ["Screwdriver", ["vodka", "orange juice"]] # 
```

同时，我们可以在使用返回数组(多个值)的函数时使用。

```coffeescript
[languageName, prefix] = "CoffeeScript".match /(.*)Script/
console.log "I love the smell of #{prefix} in the morning."
```

同时，解构赋值还可以用于对象,将变量付给特定名字，具体有两种用法：

* `{property} = object` ,其中，property为对象中属性的名字，复制后成为单独的变量可以直接使用
* `{property: identifier} = object`, 其中，property为对象中属性的名字，identifier为给定的变量名（可以事先不声明）。赋值之后identifier的值变成对象中property对应的值。 

```coffeescript
bird = verb: 'singing', time: 'midnight'
{time} = bird # time为'midnight'
{time:timeOfDate} = bird # timeOfDate为'midnight'
```

同时，可以互相嵌套对象，还可以在对象中嵌套数组。

```coffeescript
# 使用对象嵌套赋值
direction = [
    {type: 'boat', directions: ['port', 'starboard']}
    {type: 'dogsled', directions: ['haw', 'gee']}
]

[boatInfo, {directions: [left, right]}] = direction

console.log 'boatInfo: ' + boatInfo.type   # 输出 boatInfo: boat
console.log 'left: ' + left + '; right: ' + right   # 输出 left: haw; right: gee
```

## 高级函数参数
### 默认参数值
CoffeeScript中的函数支持默认函数参数。
```coffeescript
func = (a, b = 'b') ->
    console.log a + ',' + b

func 'a'  # 输出 a,b
func 'a', null # 输出 a,b
func 'a', 'c' # 输出 a,c
```

### 接受可变参数的splat
在函数定义的参数后添加`...`，即将此参数声明为可接受任意数目参数的变量。

```coffeescript
func2 = (a,b...)->
    console.log b.length

func2 1,2,3,4 # 输出 3
```

可变参数**不一定要在参数列表最后一个**。同时，解构赋值也可以使用可变参数。

```coffeescript
[race, [splits..., time]] = ['10K',['13:08','13:09','23:17']]

console.log race    # 输出 10K
console.log splits  # 输出 ['13:08','13:09']
```

#### 调用函数时使用splat
不仅可以在定义函数时使用splat，而且还可以在调用函数时使用splat。

```coffeescript
# 调用函数时使用splat
func3 = (a,b,c) ->
    len = arguments.length
    console.log len 
    if len == 1
        a
    else if len == 2
        a + ',' + b
    else if len == 3
        a + ',' + b + ',' + c
    else
        'null'

arr = [1,2,3]
console.log func3 arr...
###
输出:
3
1,2,3
###

# 被调用函数内部使用splat
func4 = (a,b...) ->
    console.log Math.min b...

func4 1, 2, 3, 4  # 输出2
```

调用splat总结：
* splat总是让你处理一个数组
* splat为函数的参数，那么以数组的形式给出，同时，也可在函数内部将splat形式的参数用来调用函数，如func4所示
* 以splat形式调用函数，以数组的方式调用，函数接收到的为分开的值

