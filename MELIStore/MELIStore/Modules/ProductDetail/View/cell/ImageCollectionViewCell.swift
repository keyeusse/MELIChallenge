//
//  ImageCollectionViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/10/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var imageDetail: UIImageView!
    
    var image : String = TextResources.noImage.rawValue
    
    static let idCell = "ImageCollectionViewCell"
    
    static func nib() -> UINib{
        return UINib(nibName: "ImageCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpCell(image : String) {
        self.image = image
        
        // Create URL
        let url = URL(string: image )!
        
           // Fetch Image Data
           if let data = try? Data(contentsOf: url) {
               // Create Image and Update Image View
            imageDetail.image = UIImage(data: data)
           }
        
    }

}
