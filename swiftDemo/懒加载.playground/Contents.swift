//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
/*
 懒加载
   1.使用懒加载既能保证控件延迟创建
   2.又能够避免在开发中处理解包的问题
 
 懒加载的本质是一个闭包,所以会有两种写法,详见下面的例子
 
 ****注意****
 Swift中的懒加载只会执行一次:
    Swift的懒加载代码只会在第一次调用该属性的时候执行闭包,然后将闭包的结果保存在该属性中
    如果手动将属性释放了,后面懒加载不会再执行,也就不会创建属性了.
    所以在swift中注意不要主动清理视图或者控件,因为懒加载不会再次创建
 
 
 OC中的懒加载属性是,是重写对象的get方法,在里面判断,如果为nil就创建.所以哪怕主动把这个属性给至为nil了,只要使用的时候用self.属性名调用,就会自动创建
 
 
 */
class myLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //这句代码写着是表示不允许通过xib/sb方式实现这个类.
        fatalError("init(coder:) has not been implemented")
    }
}

class testVC: UIViewController {
    
    //如果是直接在声明时就创建的属性,则该属性的初始化和分配空间会在viewDidload之前
    var labelOne = myLabel()
    
    //声明为可选项的属性,这里只是定义了这个属性,并没有初始化和分配空间
    var labelTwo: myLabel?
    
    
//MARK:- 懒加载写法1 *************************
    
    //用lazy声明的属性,声明时要显示指定类型,而不会自动推导
    //用lazy属性,只是定义,此时并不会初始化和分配空间,所以不会在viewDidload之前创建
    //一旦使用的时候就会自动创建,后面用的时候就不用加可选符号
    lazy var labelThree: myLabel = myLabel()
    
    
//MARK:- 懒加载写法2  **************************
    
    //这种写法就会自动推导. 不过一般不这样懒加载.因为闭包里面智能提示不好,还要注意循环引用
    // { }是闭包的定义,后面的()是闭包的调用
    lazy var labelFour = {() -> myLabel in
        let l = myLabel()
        //可以在这里设置label的属性
        l.text = "hahaha"
        l.frame = CGRect(x: 100, y: 400, width: 100, height: 100)
        
        return l
    }()
    

//MARK: - 懒加载的代码只会执行一次  **************************

    //不声明为可选类型,不能赋值nil
    lazy var labelFive: myLabel? = myLabel()
    
    
    
    override func loadView() {
        super.loadView()
        setUI()
    }
    
    func setUI() {

        //1.
        labelOne.frame = CGRect(x: 100, y: 50, width: 100, height: 20)
        view.addSubview(labelOne)
        
        //2.
        labelTwo = myLabel()
      //因为label是可选的,所有这里要强制解包才能添加到数组里.数组里不能添加值为nil的
        view.addSubview(labelTwo!)
      //因为label声明是可选的,所以用起来的时候就全带可选符号了
        labelTwo?.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        labelTwo?.text = "test"
         
        
        //3.
        labelThree.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        view.addSubview(labelThree)
        
    
        //4.此时就会创建labelFour了,而且属性也设置好了
        view.addSubview(labelFour)
        
        //5.
        labelFive?.frame = CGRect(x: 300, y: 300, width: 100, height: 100)
        
        view.addSubview(labelFive!)
        //手动赋值为nil
        labelFive = nil
        //这个就没赋值成功,因为此时labelFive依然是nil.懒加载不会再次创建
        labelFive?.text = "heihieh"
        //打印出来的是没有值
        print(labelFive ?? "没有值")
    }
}
