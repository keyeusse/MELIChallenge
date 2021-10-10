//
//  CategoryTableViewCell.swift
//  MELIStore
//
//  Created by Meli on 10/5/21.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {

    @IBOutlet  var titleLabel: UILabel!
    @IBOutlet  var categoryImageView: UIImageView!
    
    @IBOutlet weak var viewCell: UIView!
    
    var category = CategoryDetail()
    var name = ""
    var id = ""
    
    static let idCell = "CategoryTableViewCell"
    
    
    static func nib() -> UINib{
        return UINib(nibName: "CategoryTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpCell(category : CategoryDetail) {
        self.category = category
        titleLabel.text = category.name
        
        // Create URL
        let url = URL(string: category.picture)!
        
           // Fetch Image Data
           if let data = try? Data(contentsOf: url) {
               // Create Image and Update Image View
            categoryImageView.image = UIImage(data: data)
           }
       
        
        viewCell.layer.masksToBounds = true
        viewCell.layer.borderColor = Colors().MainGray.cgColor
        viewCell.layer.borderWidth = 1.0
        self.viewCell.layer.cornerRadius = 13
        viewCell.layer.shadowColor = Colors().LightGray.cgColor
        viewCell.layer.shadowOpacity = 0.2
        viewCell.layer.shadowOffset = CGSize(width: 4, height: 4)
        viewCell.layer.shadowRadius = 13.0
        viewCell.layer.masksToBounds = false
    }
    
}
