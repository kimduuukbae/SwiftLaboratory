//
//  RatingCell.swift
//  RatingsStar
//
//  Created by kpugame on 2020/04/19.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class RatingCell: UITableViewCell {

    @IBOutlet weak var ratingImageView : UIImageView!
    
    func imageForRating(rating: Int) -> UIImage? {
        let imageName = "\(rating)Stars"
        return UIImage(named: imageName)
    }
    func setImage(rating : Int){
        ratingImageView.image = imageForRating(rating: rating)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
