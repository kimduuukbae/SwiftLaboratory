import Foundation

class Player{
    var cards = [Card]()
    private var N : Int = 0
    private var name : String
    init(name : String){
        self.name = name
    }
    func inHand() -> Int {
        return self.N
    }
    func addCard ( c : Card){
        cards.append(c)
        self.N += 1
    }
    func reset(){
        self.N = 0
        cards.removeAll()
    }
    func value() -> Int{
        var total : Int = 0
        var ace : Int = 0
        for i in cards{
            if i.getValue() == 1{
                ace += 11
                total += 11
            }
            else{
                total += i.getValue()
            }
        }
        if total >= 21{
            var templt : Int = 0
            if ace >= 11{
                templt = ace / 11
            }
            total -= templt * 11
            total += templt
        }
        return total
    }
}
