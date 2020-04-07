//
//  ViewController.swift
//  Calculator
//
//  Created by kpugame on 2020/04/06.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var InputString : String = ""
    @IBOutlet var textLabel : UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func pressedButton(sender:UIButton){
        
        if let current = sender.currentTitle{
            InputString += current
            textLabel.text = InputString
        }
        
    }
    @IBAction func pressedCalcButton(sender:UIButton){
        switch sender.currentTitle! {
        case "C":
            self.InputString.removeAll()
            textLabel.text = ""
        case "+", "-", "%", "x", "(", ")":
            self.InputString += " \(sender.currentTitle!) "
            textLabel.text = self.InputString
        case "=":
            calcText()
        default:
            print("Error")
        }
    }
    func calcText(){
        var arr = InputString.components(separatedBy: " ")
        while arr.contains(""){
            let index = arr.firstIndex(of: "")
            arr.remove(at: index!)
        }
        let pastText = textLabel.text!
        textLabel.text = "\(pastText)  \n \(operation(token:calcPriority(tokens:arr)))"
        //print(calcPriority(tokens:arr))
        
    }
    func operation(token: String) -> Double{
        var tempStack : [Double] = []
        var named : String = token
        print(named)
        while named.isEmpty == false{
            let prio = getPriority(token: named.first!)
            if prio == 0 || prio == -1{
                var i : String = ""
                i.append(named.first!)
                named.removeFirst()
                if named.first! == "."{
                    i.append(named.first!)
                    named.removeFirst()
                    i.append(named.first!)
                    named.removeFirst()
                }
                let jj = Double(i)
                tempStack.append(jj!)
                
            }else{
                let first : Double = tempStack.last!
                tempStack.removeLast()
                let second : Double = tempStack.last!
                tempStack.removeLast()
                
                var value:Double = 0.0
                switch named.first! {
                case "+":
                    value = second + first
                case "%":
                    value = second / first
                case "x":
                    value = second * first
                case "-":
                    value = second - first
                default:
                    print("Error")
                }
                tempStack.append(value)
                named.removeFirst()
            }
        }
        return tempStack.first!
    }
    func calcPriority(tokens:[String]) -> String{
        var inFixToPostFix : String = ""
        var tempStack : String = ""
        for i in tokens{
            if i[i.startIndex] == "("{
                tempStack += i
            }else{
                let prio = getPriority(token: i[i.startIndex])
                if prio == 1{
                    while tempStack.last != "("{
                        inFixToPostFix.append(tempStack.last!)
                        tempStack.removeLast()
                    }
                    tempStack.removeLast()
                    continue
                }else if prio > 1{
                    while tempStack.isEmpty == false && prio < getPriority(token: tempStack.last!){
                        inFixToPostFix.append(tempStack.last!)
                        tempStack.removeLast()
                    }
                    tempStack.append(i)
                }else{
                    inFixToPostFix += i
                }
            }
        }
        while tempStack.isEmpty == false{
            inFixToPostFix.append(tempStack.last!)
            tempStack.removeLast()
        }
        return inFixToPostFix
    }
    func getPriority(token:Character) -> Int{
        switch token {
        case ")","(":
            return 1
        case "x", "%":
            return 3
        case "+", "-":
            return 2
        case "0"..."9":
            return 0
        case ".":
            return -1
        default:
            print("\(token) is Error")
            return -2
        }
    }

}

