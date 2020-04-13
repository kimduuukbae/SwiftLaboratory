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
    @IBOutlet var exchangeSlider : UISlider!
    @IBOutlet var exchangeLabel : UILabel!
    @IBOutlet var textView : UITextView!
    
    var textValue : Double = 1000.0
    var slideValue : Double = 1000.0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pressedCalcButton(){
        textValue = Double(textField.text!)!
        textView.text = possibleExchange(percentage: 30) + "\n" +
                        possibleExchange(percentage: 50) + "\n" +
                        possibleExchange(percentage: 70)
    }
    @IBAction func slideChangeValue(){
        slideValue = Double(exchangeSlider.value)
        exchangeLabel.text = "원/달러 \(String(format: "%0.2f", exchangeSlider.value))"
    }
    func possibleExchange(percentage:Int) -> String{
        var fee : Double = (slideValue / 100) * 2
        let discount = (Int(fee) * percentage) / 100
        fee -= Double(discount)
        return "\(percentage)% 쿠폰 : \(Int(textValue) / (Int(slideValue) + Int(fee))) 달러 환전 가능"
    }
}

