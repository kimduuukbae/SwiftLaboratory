import UIKit

class ViewController: UIViewController {
    
    var player : Player = Player(name : "player")
    var dealer : Player = Player(name : "dealer")
    var audioController : AudioController
    required init?(coder aDecoder: NSCoder) {
        audioController = AudioController()
        audioController.preloadAudioEffects(audioFileNames: AudioEffectFiles)
        
        super.init(coder: aDecoder)
    }
    
    var LCardsPlayer = [UIImageView]()
    var LCardsDealer = [UIImageView]()
    
    var deck = [Int]()
    var deckIndex = 0
    
    var vBetMoney : Int = 0
    var vPlayerMoney : Int = 1000
    var nCardsDealer : Int = 0
    var nCardsPlayer : Int = 0
    
    @IBOutlet weak var dealerPts: UILabel!
    @IBOutlet weak var playerPts: UILabel!
    @IBOutlet weak var betMoney: UILabel!
    @IBOutlet weak var playerMoney: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var bet50: UIButton!
    @IBOutlet weak var bet25: UIButton!
    @IBOutlet weak var bet10: UIButton!
    
    @IBOutlet weak var hitBtn: UIButton!
    @IBOutlet weak var standBtn: UIButton!
    @IBOutlet weak var dealBtn: UIButton!
    @IBOutlet weak var againBtn: UIButton!
    
    @IBAction func Bet50(_ sender: Any) {
        betSupport(betVar: 50)
    }
    @IBAction func Bet25(_ sender: Any) {
        betSupport(betVar: 25)
    }
    @IBAction func Bet10(_ sender: Any) {
        betSupport(betVar: 10)
    }
    
    func betSupport(betVar : Int){
        if vPlayerMoney >= betVar{
            vBetMoney += betVar
            vPlayerMoney -= betVar
            betMoney.text = "$\(vBetMoney)"
            playerMoney.text = "You Have $\(vPlayerMoney)"
            
            dealBtn.isEnabled = true
            audioController.playerEffect(name: SoundChip)
        }
    }
    
    @IBAction func Hit(_ sender: Any) {
        nCardsPlayer += 1
        hitPlayer(n : nCardsPlayer)
        if player.value() > 21{
            checkWinner()
            bet50.isEnabled = false
            bet25.isEnabled = false
            bet10.isEnabled = false
            hitBtn.isEnabled = false
            standBtn.isEnabled = false
            dealBtn.isEnabled = false
            againBtn.isEnabled = true
        }
    }
    @IBAction func Stand(_ sender: Any) {
        checkWinner()
        bet50.isEnabled = false
        bet25.isEnabled = false
        bet10.isEnabled = false
        hitBtn.isEnabled = false
        standBtn.isEnabled = false
        dealBtn.isEnabled = false
        againBtn.isEnabled = true
    }
    @IBAction func Deal(_ sender: Any) {
        deal()
        dealBtn.isEnabled = false
        standBtn.isEnabled = true
        hitBtn.isEnabled = true
    }
    @IBAction func Again(_ sender: Any) {
        bet50.isEnabled = true
        bet25.isEnabled = true
        bet10.isEnabled = true
        hitBtn.isEnabled = false
        standBtn.isEnabled = false
        dealBtn.isEnabled = false
        againBtn.isEnabled = false
        for i in 0...51{
            deck.append(i)
        }
        for i in LCardsPlayer{
            i.removeFromSuperview()
        }
        for i in LCardsDealer{
            i.removeFromSuperview()
        }
        LCardsPlayer.removeAll()
        LCardsDealer.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        hitBtn.isEnabled = false
        standBtn.isEnabled = false
        dealBtn.isEnabled = false
        againBtn.isEnabled = false
        for i in 0...51{
            deck.append(i)
        }
    }
    
    func deal(){
        deck.shuffle()
        deckIndex = 0
        player.reset()
        dealer.reset()
        
        hitPlayer(n:0)
        hitPlayer(n:1)
        hitDealerDown()
        hitDealer(n:0)
        nCardsPlayer = 1
        nCardsDealer = 0
        
        playerPts.text = "Player: " + String(player.value())
    }
    
    func hitPlayer(n : Int){
        let newCard = Card(temp:deck[deckIndex])
        deckIndex += 1
        
        player.addCard(c : newCard)
        let newImageView = UIImageView(image: UIImage(named: newCard.filename())!)
        newImageView.center = CGPoint(x : 600, y : 150)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay : 0.0,
                       options : UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        newImageView.center = CGPoint(x : 300 + n * 50, y : 450)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
                        }, completion: nil)
        LCardsPlayer.append(newImageView)
        
        playerPts.text = "Player: " + String(player.value())
        audioController.playerEffect(name: SoundFlip)
    }
    func hitDealerDown(){
        let newCard = Card(temp:deck[deckIndex])
        deckIndex += 1
        
        dealer.addCard(c : newCard)
        let newImageView = UIImageView(image: UIImage(named: "b2fv")!)
        newImageView.center = CGPoint(x : 600, y : 150)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay : 0.0,
                       options : UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        newImageView.center = CGPoint(x : 300 , y : 150)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
                        }, completion: nil)
        LCardsDealer.append(newImageView)
        audioController.playerEffect(name: SoundFlip)
    }
    
    func hitDealer(n : Int){
        let newCard = Card(temp:deck[deckIndex])
        deckIndex += 1
        
        dealer.addCard(c : newCard)
        let newImageView = UIImageView(image: UIImage(named: newCard.filename())!)
        newImageView.center = CGPoint(x : 600, y : 150)
        self.view.addSubview(newImageView)
        
        UIView.animate(withDuration: 0.5,
                       delay : 0.0,
                       options : UIView.AnimationOptions.curveEaseInOut,
                       animations: {
                        newImageView.center = CGPoint(x : 350 + n * 50, y : 150)
                        newImageView.transform = CGAffineTransform(rotationAngle: 3.14)
                        }, completion: nil)
        LCardsDealer.append(newImageView)
        audioController.playerEffect(name: SoundFlip)
    }
    func checkWinner(){
        LCardsDealer[0].removeFromSuperview()
        let newImageView = UIImageView(image : UIImage(named: dealer.cards[0].filename())!)
        newImageView.center = CGPoint(x : 300, y : 250)
        
        self.view.insertSubview(newImageView, belowSubview : LCardsDealer[1])
        
        dealerPts.text = "Dealer: " + String(dealer.value())
        
        if player.value() > 21{
            status.text = "Player Busts"
            audioController.playerEffect(name: SoundLose)
        }
        else if dealer.value() > 21{
            status.text = "Dealer Busts"
            vPlayerMoney += vBetMoney * 2
            audioController.playerEffect(name: SoundWin)
        }
        else if dealer.value() == player.value(){
            status.text = "Push"
            vPlayerMoney += vBetMoney
        }
        else if dealer.value () < player.value(){
            status.text = "You Won!"
            vPlayerMoney += vBetMoney * 2
        }
        else{
            status.text = "Sorry You Lost!"
            audioController.playerEffect(name: SoundLose)
        }
        LCardsDealer.append(newImageView)
        vBetMoney = 0
        playerMoney.text = "You Have $" + String(vPlayerMoney)
        betMoney.text = "$" + String(vBetMoney)
    }
}

