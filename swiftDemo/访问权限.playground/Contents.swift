//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 1，private
    private访问级别所修饰的属性或者方法只能在当前类里访问。(在延展里也不能访问)
 
    给按钮添加点击方法时,方法如果是private/fileprivate修饰的,是添加不成功,要加@objc修饰. 
 
 2.filePrivate
    fileprivate访问级别所修饰的属性或者方法在当前的Swift源文件里可以访问。
    所以同一个文件里声明的多个类或者延展就都可以访问
  
 3.internal（默认访问级别，internal修饰符可写可不写）
 internal访问级别所修饰的属性或方法在源代码所在的整个模块都可以访问。
 如果是框架或者库代码，则在整个框架内部都可以访问，框架由外部代码所引用时，则不可以访问。
 如果是App代码，也是在整个App代码，也是在整个App内部可以访问。
 
 4，public
 可以被任何人访问。但其他module中不可以被override和继承，而在module内可以被override和继承。
 
 5，open
 可以被任何人使用，包括override和继承。
 */