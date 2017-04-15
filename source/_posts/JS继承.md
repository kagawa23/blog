---
title: JS继承
date: 2017-04-14 14:29:24
tags: javascript基础
categories: 前端
---

## 构造函数的继承
``` javascript
function Animal(){
  this.species = "动物"
}

function Cat(name,color){
  this.name = name;
  this.color = color;
}
```

<!--more-->

### 1. 构造函数的绑定
使用call或者apply，将父对象的构造函数绑定到子对象上
```javascript
function Cat(name,color){
  Animal.call(this,arguments);         //函数的 arguments 对象并不是一个数组，访问单个参数的方式与访问数组元素的方式相同。
  this.name = name;
  this.color = color;
}
```
缺点：只能继承构造器里的属性和方法

### 2.prototype模式

```javascript
Cat.prototype = new Animal();            //constructor指向Cat
Cat.prototype.constructor = Cat;
```

既能继承构造器里的属性和方法,也能继承原型上的属性和方法

### 3. 直接继承prototype
```javascript
function Animal(){}
Animal.prototype.species = "动物"

Cat.prototype = Animal.prototype;
Cat.prototype.constructor = Cat;
```

执行效率高，不需要建立Animal的实例了，constructor指向同一个对象了，只能继承原型上的属性和方法

### 4.利用空对象作为中介
```javascript
function F(){}

F.prototype = Animal.prototype
Cat.prototype = new F()
Cat.prototype.constructor = Cat

function extend(Child,Parent){
  var F = function(){};
  F.prototype = Parent.prototype;
  Child.prototype = new F();
  Child.prototype.constructor = Child;
  Child.uber = Parent.prototype
}

extend(Cat,Animal)
```
只能继承原型上的属性和方法

### 5. 继承拷贝
```javascript
function Animal(){}

Animal.prototype.species = "动物";

function extend2(Child,Parent){
  var p = Parent.prototype;
  var c= Parent.prototype;
  for(var i in p){
    c[i] = p[i]
  }
  c.uber = p;
}

extend2(Cat,Animal)
```
只能继承原型上的属性和方法
