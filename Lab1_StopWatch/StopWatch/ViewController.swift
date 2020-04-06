//
//  ViewController.swift
//  StopWatch
//
//  Created by kpugame on 2020/04/06.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var timeLabel :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }

    var timer = Timer()
    var minute1:Int = 0
    var minute2:Int = 0
    var second1:Int = 0
    var second2:Int = 0
    var millisecond:Int = 0
    var isStop:Bool = false

        //timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector
            //(self.subtractTime), userInfo: nil, repeats: true)
    
    @IBAction func startButton(){
        if(isStop){
            isStop = false
        }else{
            if(!timer.isValid){
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector
            (self.subtractTime), userInfo: nil, repeats: true)
            }
        }
    }
    @IBAction func stopButton(){
        isStop = true
    }
    @IBAction func resetButton(){
        if(timer.isValid){
            timeLabel.text = "00:00:0"
            timer.invalidate()
            minute1 = 0
            minute2 = 0
            second1 = 0
            second2 = 0
            millisecond = 0
            isStop = false
        }
    }
    @objc func subtractTime(){
        timeLabel.text = "\(minute1)\(minute2):\(second1)\(second2):\(millisecond)"
        if(!isStop){
            millisecond += 1
            if(millisecond > 9){
                second2 += 1
                millisecond = 0
            }
            if(second2 > 9){
                second1 += 1
                second2 = 0
            }
            if(second1 > 5){
                second1 = 0
                minute2 += 1
            }
            if(minute2 > 9){
                minute2 = 0
                minute1 += 1
            }
        }
    }
}
