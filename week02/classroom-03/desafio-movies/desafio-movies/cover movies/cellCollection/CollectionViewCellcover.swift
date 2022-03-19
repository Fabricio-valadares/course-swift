//
//  CollectionViewCellcover.swift
//  desafio-movies
//
//  Created by FL00027 on 19/03/22.
//

import UIKit

class CollectionViewCellcover: UICollectionViewCell {

    @IBOutlet weak var imageCover: UIImageView!
    
    static let identifier = "CollectionViewCellcover"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(image: String) {
        if let image = UIImage(named: image) {
            imageCover.image = image
        }
    }
}
