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
    
    func setUpCell(with name : String, id: String) {
        self.name = name
        titleLabel.text = name
//        categoryImageView.image = UIImage(named: category.picture)
        
        let yourColor : UIColor = UIColor.lightGray
        viewCell.layer.masksToBounds = true
        viewCell.layer.borderColor = yourColor.cgColor
        viewCell.layer.borderWidth = 1.0
        self.viewCell.layer.cornerRadius = 13
        viewCell.layer.shadowColor = UIColor.black.cgColor
        viewCell.layer.shadowOpacity = 0.2
        viewCell.layer.shadowOffset = CGSize(width: 4, height: 4)
        viewCell.layer.shadowRadius = 13.0
        viewCell.layer.masksToBounds = false
    }
    
}
