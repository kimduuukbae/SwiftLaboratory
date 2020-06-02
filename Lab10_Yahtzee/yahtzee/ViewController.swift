//
//  ViewController.swift
//  yahtzee
//
//  Created by kpugame on 2020/06/02.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var roll : Int = 0
    var round : Int = 0
    var dice : [Int] = [1,1,1,1,1]
    var scores : [Int] = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    var used : [Bool] = [false,false,false,false,false,false,false,false,false,false,false,false,false]
    
    var usePrepare : Bool = true
    
    var prepareDice : [[Int]] = [[1,1,1,1,1], [2,2,2,2,2], [3,3,3,3,3], [4,4,4,4,4], [5,5,5,5,5],
    [6,6,6,6,6], [6,6,6,1,1], [6,6,6,6,1], [6,6,6,3,3], [1,2,3,4,6], [1,2,3,4,5], [1,1,1,1,1], [1,2,3,4,5]]
    
    @IBOutlet weak var rollDice: UIButton!
    @IBOutlet weak var dice1: UIButton!
    @IBOutlet weak var dice2: UIButton!
    @IBOutlet weak var dice3: UIButton!
    @IBOutlet weak var dice4: UIButton!
    @IBOutlet weak var dice5: UIButton!
    
    @IBAction func rollDiceAction(_ sender: Any) {
        if rollDice.isEnabled{
            rollCurrentDice()
            switch (roll){
            case 0,1:
                roll += 1
                rollDice.setTitle("Roll Again", for: UIControl.State.normal)
                gameMessage.text = "간직할 주사위를 선택한 후 roll again 버튼을 누르세요."
            case 2:
                roll = 0
                gameMessage.text = "Category를 선택하세요."
                rollDice.isUserInteractionEnabled = false
                rollDice.backgroundColor = UIColor.gray
            default:
                break
            }
        }
    }
    
    func rollCurrentDice(){
        if usePrepare{
            if dice1.isUserInteractionEnabled{
                dice[0] = prepareDice[round][0]
                dice1.setTitle(String(dice[0]), for: UIControl.State.normal)
            }
            if dice2.isUserInteractionEnabled{
                dice[1] = prepareDice[round][1]
                dice2.setTitle(String(dice[1]), for: UIControl.State.normal)
            }
            if dice3.isUserInteractionEnabled{
                dice[2] = prepareDice[round][2]
                dice3.setTitle(String(dice[2]), for: UIControl.State.normal)
            }
            if dice4.isUserInteractionEnabled{
                dice[3] = prepareDice[round][3]
                dice4.setTitle(String(dice[3]), for: UIControl.State.normal)
            }
            if dice5.isUserInteractionEnabled{
                dice[4] = prepareDice[round][4]
                dice5.setTitle(String(dice[4]), for: UIControl.State.normal)
            }
        }else{
            if dice1.isUserInteractionEnabled{
                dice[0] = Int((arc4random() % 6) + 1)
                dice1.setTitle(String(dice[0]), for: UIControl.State.normal)
            }
            if dice2.isUserInteractionEnabled{
                dice[1] = Int((arc4random() % 6) + 1)
                dice2.setTitle(String(dice[1]), for: UIControl.State.normal)
            }
            if dice3.isUserInteractionEnabled{
                dice[2] = Int((arc4random() % 6) + 1)
                dice3.setTitle(String(dice[2]), for: UIControl.State.normal)
            }
            if dice4.isUserInteractionEnabled{
                dice[3] = Int((arc4random() % 6) + 1)
                dice4.setTitle(String(dice[3]), for: UIControl.State.normal)
            }
            if dice5.isUserInteractionEnabled{
                dice[4] = Int((arc4random() % 6) + 1)
                dice5.setTitle(String(dice[4]), for: UIControl.State.normal)
            }
        }
    }
    
    @IBAction func dice1Action(_ sender: Any) {
        if roll != 0{
            dice1.backgroundColor = UIColor.gray
            dice1.isUserInteractionEnabled = false
        }
    }
    @IBAction func dice2Action(_ sender: Any) {
        if roll != 0{
            dice2.backgroundColor = UIColor.gray
            dice2.isUserInteractionEnabled = false
        }
    }
    @IBAction func dice3Action(_ sender: Any) {
        if roll != 0{
            dice3.backgroundColor = UIColor.gray
            dice3.isUserInteractionEnabled = false
        }
    }
    @IBAction func dice4Action(_ sender: Any) {
        if roll != 0{
            dice4.backgroundColor = UIColor.gray
            dice4.isUserInteractionEnabled = false
        }
    }
    @IBAction func dice5Action(_ sender: Any) {
        if roll != 0{
            dice5.backgroundColor = UIColor.gray
            dice5.isUserInteractionEnabled = false
        }
    }
    
    
    @IBOutlet weak var category1: UIButton!
    @IBOutlet weak var category2: UIButton!
    @IBOutlet weak var category3: UIButton!
    @IBOutlet weak var category4: UIButton!
    @IBOutlet weak var category5: UIButton!
    @IBOutlet weak var category6: UIButton!
    @IBOutlet weak var category7: UIButton!
    @IBOutlet weak var category8: UIButton!
    @IBOutlet weak var category9: UIButton!
    @IBOutlet weak var category10: UIButton!
    @IBOutlet weak var category11: UIButton!
    @IBOutlet weak var category12: UIButton!
    @IBOutlet weak var category13: UIButton!
    
    @IBOutlet weak var upperTotal: UILabel!
    @IBOutlet weak var upperBonus: UILabel!
    @IBOutlet weak var lowerTotal: UILabel!
    @IBOutlet weak var grandTotal: UILabel!
    
    @IBAction func category1Action(_ sender: Any) {
        if category1.isEnabled{
            scores[0] = upperScore(index : 1)
            used[0] = true
            category1.setTitle(String(scores[0]), for: UIControl.State.normal)
            category1.isUserInteractionEnabled = false
            category1.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category2Action(_ sender: Any) {
        if category2.isEnabled{
            scores[1] = upperScore(index : 2)
            used[1] = true
            category2.setTitle(String(scores[1]), for: UIControl.State.normal)
            category2.isUserInteractionEnabled = false
            category2.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category3Action(_ sender: Any) {
        if category3.isEnabled{
            scores[2] = upperScore(index : 3)
            used[2] = true
            category3.setTitle(String(scores[2]), for: UIControl.State.normal)
            category3.isUserInteractionEnabled = false
            category3.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category4Action(_ sender: Any) {
        if category4.isEnabled{
            scores[3] = upperScore(index : 4)
            used[3] = true
            category4.setTitle(String(scores[3]), for: UIControl.State.normal)
            category4.isUserInteractionEnabled = false
            category4.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category5Action(_ sender: Any) {
        if category5.isEnabled{
            scores[4] = upperScore(index : 5)
            used[4] = true
            category5.setTitle(String(scores[4]), for: UIControl.State.normal)
            category5.isUserInteractionEnabled = false
            category5.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category6Action(_ sender: Any) {
        if category6.isEnabled{
            scores[5] = upperScore(index : 6)
            used[5] = true
            category6.setTitle(String(scores[5]), for: UIControl.State.normal)
            category6.isUserInteractionEnabled = false
            category6.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category7Action(_ sender: Any) {
        if category7.isEnabled{
            scores[6] = scoreThreeOfAKind()
            used[6] = true
            category7.setTitle(String(scores[6]), for: UIControl.State.normal)
            category7.isUserInteractionEnabled = false
            category7.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category8Action(_ sender: Any) {
        if category8.isEnabled{
            scores[7] = scoreFourOfAKind()
            used[7] = true
            category8.setTitle(String(scores[7]), for: UIControl.State.normal)
            category8.isUserInteractionEnabled = false
            category8.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category9Action(_ sender: Any) {
        if category9.isEnabled{
            
            var sortDice = dice
            var match = 0
            sortDice.sort()
            if (sortDice[0] == sortDice[1]) && sortDice[2] == sortDice[3] && sortDice[3] == sortDice[4]{
                match = 1
            }
            if(sortDice[0] == sortDice[1] && sortDice[1] == sortDice[2]) && sortDice[3] == sortDice[4]{
                match = 1
            }
            if match == 1{
                scores[8] = 25
            }else{
                scores[8] = 0
            }
            used[8] = true
            category9.setTitle(String(scores[8]), for: UIControl.State.normal)
            category9.isUserInteractionEnabled = false
            category9.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category10Action(_ sender: Any) {
        if category10.isEnabled{
           
            var sortDice = dice
            var match = 0
            sortDice.sort()
            for i in 0..<4{
                if sortDice[i]+1 == sortDice[i+1]{
                    match += 1
                }
            }
            if match >= 3{
                scores[9] = 30
            }else{
                scores[9] = 0
            }
            used[9] = true
            category10.setTitle(String(scores[9]), for: UIControl.State.normal)
            category10.isUserInteractionEnabled = false
            category10.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }

    }
    @IBAction func category11Action(_ sender: Any) {
        if category11.isEnabled{
           
            var sortDice = dice
            var match = 0
            sortDice.sort()
            for i in 0..<4{
                if sortDice[i]+1 == sortDice[i+1]{
                    match += 1
                }
            }
            if match == 4{
                scores[10] = 40
            }else{
                scores[10] = 0
            }
            used[10] = true
            category11.setTitle(String(scores[10]), for: UIControl.State.normal)
            category11.isUserInteractionEnabled = false
            category11.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
        
    }
    @IBAction func category12Action(_ sender: Any) {
        if category12.isEnabled{
            var match = 0
            for i in 0..<4{
                if dice[i] == dice[i+1]{
                    match += 1
                }
            }
            if match == 4{
                scores[11] = 50
            }else{
                scores[11] = 0
            }
            used[11] = true
            category12.setTitle(String(scores[11]), for: UIControl.State.normal)
            category12.isUserInteractionEnabled = false
            category12.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    @IBAction func category13Action(_ sender: Any) {
        if category13.isEnabled{
            scores[12] = sumDice()
            used[12] = true
            category13.setTitle(String(scores[12]), for: UIControl.State.normal)
            category13.isUserInteractionEnabled = false
            category13.backgroundColor = UIColor.gray
            toDoAfterCategory()
        }
    }
    
    @IBOutlet weak var gameMessage: UILabel!
    
    
    func upperScore(index : Int) -> Int{
        var sum : Int = 0
        for i in 0..<5{
            if(dice[i] == index){
                sum += index
            }
        }
        return sum
    }
    func scoreFourOfAKind() -> Int{
        var sameNum : Int
        for i in 0..<5{
            sameNum = 0
            for j in 0..<5{
                if i == j {
                    continue
                }
                if dice[i] == dice[j]{
                    sameNum += 1
                }
            }
            if sameNum >= 3{
                return sumDice()
            }
        }
        return 0
    }
    func scoreThreeOfAKind() -> Int{
        var sameNum : Int
        for i in 0..<5{
            sameNum = 0
            for j in 0..<5{
                if i == j{
                    continue
                }
                if dice[i] == dice[j]{
                    sameNum += 1
                }
            }
            if sameNum >= 2{
                return sumDice()
            }
        }
        return 0
    }
    
    func sumDice() -> Int{
        var sum : Int = 0
        for i in 0..<5{
            sum += dice[i]
        }
        return sum
    }
    
    func allUpperUsed() -> Bool{
        return !category1.isUserInteractionEnabled && !category2.isUserInteractionEnabled && !category3.isUserInteractionEnabled && !category4.isUserInteractionEnabled && !category5.isUserInteractionEnabled && !category6.isUserInteractionEnabled
    }
    
    func allLowerUsed() -> Bool{
        return !category7.isUserInteractionEnabled && !category8.isUserInteractionEnabled && !category9.isUserInteractionEnabled && !category10.isUserInteractionEnabled && !category11.isUserInteractionEnabled && !category12.isUserInteractionEnabled
    }
    
    func getUpperTotal() -> Int{
        var sum : Int = 0
        for i in 0..<6{
            sum += scores[i]
        }
        return sum
    }
    
    func getUpperBonus() -> Int{
        if getUpperTotal() > 62{
            return 35
        }
        return 0
    }
    
    func getLowerTotal() -> Int{
        var sum : Int = 0
        for i in 6..<12{
            sum += scores[i]
        }
        return sum
    }
    
    func toDoAfterCategory(){
        if allUpperUsed(){
            upperTotal.text = String(getUpperTotal())
            upperBonus.text = String(getUpperBonus())
        }
        if allLowerUsed(){
            lowerTotal.text = String(getLowerTotal())
        }
        if allLowerUsed() && allUpperUsed(){
            grandTotal.text = String(getLowerTotal() + getUpperTotal() + getUpperBonus())
        }
        rollDice.isUserInteractionEnabled = true
        
        dice1.isUserInteractionEnabled = true
        dice1.setTitle("?", for: UIControl.State.normal)
        dice1.backgroundColor = UIColor.black
        
        dice2.isUserInteractionEnabled = true
        dice2.setTitle("?", for: UIControl.State.normal)
        dice2.backgroundColor = UIColor.black
        
        dice3.isUserInteractionEnabled = true
        dice3.setTitle("?", for: UIControl.State.normal)
        dice3.backgroundColor = UIColor.black
        
        dice4.isUserInteractionEnabled = true
        dice4.setTitle("?", for: UIControl.State.normal)
        dice4.backgroundColor = UIColor.black
        
        dice5.isUserInteractionEnabled = true
        dice5.setTitle("?", for: UIControl.State.normal)
        dice5.backgroundColor = UIColor.black
        
        rollDice.setTitle("Roll Dice", for: UIControl.State.normal)
        gameMessage.text = "Click To Roll Dice"
        
        rollDice.backgroundColor = UIColor.orange
        
        round += 1
        roll = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

