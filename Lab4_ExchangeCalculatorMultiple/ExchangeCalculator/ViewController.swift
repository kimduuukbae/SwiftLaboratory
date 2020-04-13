//
//  ViewController.swift
//  ExchangeCalculator
//
//  Created by kpugame on 2020/04/13.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textField : UITextField!
    @IBOutlet var textView : UITextView!
    
    @IBOutlet var dollarLabel : UILabel!
    @IBOutlet var yuanLabel : UILabel!
    @IBOutlet var yenLabel : UILabel!
    
    var wonValue : Double = 1000.0
    var slideDict : [String : Double] = ["달러": 1000.0, "위안" : 130.0, "엔" : 1050.0]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func pressedCalcButton(){
        wonValue = Double(textField.text!)!
        var tempString : String = ""
        var temparr : [String] = []
        for i in slideDict{
            temparr.append(i.key)
        }
        temparr.sort()
        for i in temparr{
            tempString += possibleExchange(percentage: 30, value: slideDict[i]!, type: i) + "\n"
            tempString += possibleExchange(percentage: 50, value: slideDict[i]!, type: i) + "\n"
            tempString += possibleExchange(percentage: 70, value: slideDict[i]!, type: i) + "\n"
            
            tempString += "\n\n"
        }
        textView.text = tempString
    }
    @IBAction func slideChangeValue(Sender : UISlider){
        let castValue : Double = Double(Sender.value)
        switch Sender.tag {
        case 1:
            slideDict["달러"] = castValue
            dollarLabel.text = "원/달러 " + String(format: "%0.2f", castValue)
        case 2:
            slideDict["위안"] = castValue
            yuanLabel.text = "원/위안 " + String(format: "%0.2f", castValue)
        case 3:
            slideDict["엔"] = castValue
            yenLabel.text = "원/엔 " + String(format: "%0.2f", castValue)
        default:
            print("Error")
        }
    }
    func possibleExchange(percentage:Int, value:Double, type : String) -> String{
        var fee : Double = (value / 100) * 2
        let discount = (Int(fee) * percentage) / 100
        fee -= Double(discount)
        return "\(percentage)% 쿠폰 : \(Int(wonValue) / (Int(value) + Int(fee))) \(type) 환전 가능"
    }
}

