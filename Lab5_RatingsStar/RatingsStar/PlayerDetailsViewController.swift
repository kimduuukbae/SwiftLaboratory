//
//  PlayerDetailsViewController.swift
//  RatingsStar
//
//  Created by kpugame on 2020/04/19.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UITableViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var ratingImage: UIImageView!
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    
    var game : String = "Default" {
        didSet {
            detailLabel.text? = game
        }
    }
    
    var rating : Int = 1{
        didSet {
            ratingImage.image = imageForRating(rating: rating)
        }
    }
    
    @IBAction func unwindWithSelectedGame(segue : UIStoryboardSegue){
        if let gamePickerViewController = segue.source as? GamePickerViewController {
            let selectedGame = gamePickerViewController.selectedGame
            game = selectedGame!
        }
        if let selectPickerViewController = segue.source as? SelectRatingViewController {
            let selectedRating = selectPickerViewController.selectedRating
            rating = selectedRating
        }
    }
    
    var player : Player?
    override func viewDidLoad() {
        super.viewDidLoad()
        ratingImage.image = imageForRating(rating: rating)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SavePlayerDetail"{
            player = Player(name : nameTextField.text!, game : game, rating : rating)
        }
        
        if segue.identifier == "PickGame"{
            if let gamePickerViewController = segue.destination as? GamePickerViewController{
                gamePickerViewController.selectedGame = game
            }
        }
        if segue.identifier == "PickRating"{
            if let selectRatingViewController = segue.destination as? SelectRatingViewController{
                selectRatingViewController.selectedRating = rating
            }
        }
        
       // if segue
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }
}
