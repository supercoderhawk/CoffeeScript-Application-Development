# 第二章 编写第一个CoffeeScript应用程序
## CoffeeScript基础
### 语句
CoffeeScript没有分号，语句由新的一行结束，但是可以使用\将语句延续至下一行。

有时可以跨行实现函数调用:

```coffeescript
"foo".
    .concat("barbaz")
    .replace("foobar", "fubar")
```

也可以把几条语句写在同一行，使用分号分隔。

### 变量
CoffeeScript变量不需要定义，且默认都是局部变量。如：
```coffeescript
x = 1
y = 2
```

被编译为：

```coffeescript
var x,y;
x = 1;
y = 2;
```

如果确实想使用全局变量，那么在node或者coffee控制台中，将变量绑定到global，在浏览器中，将变量绑定到window。

### 注释
使用#开始的都是注释，仅能在一行中。使用###表示的注释能够跨行。

## 函数调用
类似于JavaScript的函数调用：

```coffeescript
console.log("hello planet")
```

另一种函数调用：
```coffeescript
console.log "Hello planet." #单参数
Math.pow 2, 3   #多参数
```

但是如果调用的函数没有参数，必须使用小括号。如：
```coffeescript
Date.now()
```

因为在没有参数的时候，如果不加括号的话是访问函数对象还是执行函数并不清楚，使用小括号可以区分两者。**不偏离JavaScript语言的基本原理，是CoffeeScript哲学的一部分。**

### 优先权
函数调用优先级原则：参数**由内向外分配给函数**，即参数所属的函数**遵循最近原则**。例：
```coffeescript
# 以下两种调用等价
Math.max 2, 3, Math.min 4, 5, 6
Math.max 2, 3, Math.min(4, 5, 6)
```

## 控制结构
CoffeeScript中的控制结构和JavaScript基本一致。

> CoffeeScript的多行模式：在控制台按Ctrl+V，然后就可以输入多行代码，最后按Ctrl+V退出多行模式并执行输入的多行代码

### if语句
标准if语句的写法：

```coffeescript
if(true == true)
    console.log "Test"
```

去除括号版：
```coffeescript
if true == true
    console.log "Test"
```

同时，CoffeeScript在所有控制结构（如if语句，循环或者函数）中**都不使用大括号，而是使用缩进来控制代码执行**。

### else和else if语句
用法类似于JavaScript。例：
```coffeescript
number = -8
if number > 0
    "Positive"
else if number < 0
    "Negative"
else
    "Zero"
```

### unless语句
unless当测试条件为假值的时候执行分支语句块。与if相反。例：
```coffeescript
day = "Monday"
unless day[0] == "S"
    console.log "This is a weekday."
```

unless语句也可以与else,else if语句一起使用

### 单行形式
if语句可以写成单行形式，例：
```coffeescript
console.log "Test" if true == true
```
unless语句也支持这种写法。

## 比较运算符
在CoffeeScript中，`==`被编译为`===`，`!=`被编译为`!==`。

CoffeeScript提供了一些别名用法增强代码的可读性，
|CoffeeScript|JavaScript|
|------------|----------|
|is|===|
|isnt|!==|
|not|!|
|and|&&|
|or|\|\||
|true,yes,on|true|
|false,on ,off|false|
|@,this|this|
|of|in|
|in|无对应js|

## 数组
数组声明使用和JavaScript中一致

如果每个数组成员单独在一行声明，则可省略逗号

```coffeescript
languages = [
    "english"
    "french"
    "chinese"
]
```

### 数列
可以使用数列创建连续数字组成的数组。其中两个`..`代表包含尾边界，三个`...`代表不包含尾边界。除了使用数字常量，也可以使用变量来创建。
```coffeescript
arr = [0..3] # 等价于 arr = [0,1,2,3]
arr2 = [3..0] # 等价于 arr2 = [3,2,1,0]
arr3 = [0...3] # 等价于 arr3 = [0,1,2]

start = 0
end = 3
arr4 = [start..end] # 等价于arr4 = [0,1,2,3]
```

>   数列的实现原理：
>   ```javascript
>   var end, start, _i, _results;
>   start = 0;
>   end = 100;
>   numbers = (function(){
>       _results = [];
>       for(var _i = start;
>           start <= end ? _i <= end : _i >= end;
>           start <= end ? _i++ : _i--)
>       {_results.push(i);}
>       return _results; 
>   }).apply(this)
>   ```

### 循环
CoffeeScript中的for in循环和JavaScript中的不同。迭代参数为数组元素，不是索引，不过需要使用索引的话，可声明for循环的第二个循环参数，即为索引。同时，还可以与when语句一起使用，起到进一步过滤的作用。例：

```coffeescript
animals = ['dog','cat','bird']

# 使用带索引的for..in语句
for animal, index in animals
    console.log index + ':' + animal

# 使用when语句
for animal in animals when animal == 'cat'
    console.log 'This is a cat'

```

与JavaScript不同的是，CoffeeScript数组for in循环有返回值，返回值为每次迭代的执行结果的数组。

```coffeescript
pluralAnimals = for animal in animals
    animal + 's'

# pluralAnimals为[ 'dogs', 'cats', 'birds' ]
```

与if相同，for in也可写在一行上，并将循环条件后置。

CoffeeScript可使用by关键字实现遍历每第n个成员

```coffeescript
evenNumbers = (n  for n in [0..10] by 2)
# evenNumbers为[0, 2, 4, 6, 8, 10]
```

## 简单对象
CoffeeScript中的对象与JavaScript中的类似，但是在声明时有些不同，CoffeeScript中声明对象时可以省略大括号，使用缩进来确定对象的结构；同时，在不同行声明对象属性，可以省略逗号，类似于数组的声明。

```
bicyle = 
    color: 'black'
    brand: 
        make: 'Surly'
        model: 'Cross Check'
    fenders: true
    gears: 24

```