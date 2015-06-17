//: Property Observers Example


//:调试环境：Xcode7 + Swift2.0  这一章节只是更新了一个note，为了说明didSet 和 willSet区别 

class StepCounter{

  var totalSteps:Int = 0 {
    willSet(newTotalSteps){
      //赋值set之前进行的操作 newtoTalSteps 是自定义命名那个新到来的值 假如你没有命名 默认newValue
      print("About to set totalSteps to :\(newTotalSteps)")
    }
    didSet{
      //赋值set之后进行的操作 这里也可以像上面那样(oldTotalSteps)自己命名
      //注意：newValue 已经赋值给totalSteps了 那么原先totalSteps的值0就变成了oldValue
      if totalSteps > oldValue{
        print("Added \(totalSteps - oldValue) steps")
      }
    }
  }
  
}


let stepCounter = StepCounter()

stepCounter.totalSteps = 200

stepCounter.totalSteps = 360

stepCounter.totalSteps = 200






