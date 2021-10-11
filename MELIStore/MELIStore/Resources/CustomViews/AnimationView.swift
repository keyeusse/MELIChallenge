//
//  AnimationView.swift
//  MELIStore
//
//  Created by Meli on 10/10/21.
//

import UIKit
import SCLAlertView

class AnimationView: UIView {

    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view1: UIView!
        
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpCustomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var view = UIView()

        func loadViewFromNib() -> UIView {

            let bundle = Bundle(for: type(of: self))
            let nib = UINib(nibName: "AnimationView", bundle: bundle)
            let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
            
            
            _ =  self.frame
            view.frame = CGRect(x:0, y: 0, width:200, height:150)
                   self.addSubview(view)
                   self.bringSubviewToFront(view)

            return view
        }


    func setUpCustomView() {
        
        totalView?.layer.cornerRadius = 10
        totalView?.backgroundColor = UIColor.white
        totalView?.layer.borderWidth = 1.0
        totalView?.layer.borderColor = Colors().LightGray.cgColor
        totalView?.layer.shadowColor = Colors().MainGray.cgColor
        totalView?.layer.shadowOffset = CGSize(width: 2, height: 2)
        totalView?.layer.shadowOpacity = 0.6
        totalView?.layer.shadowRadius = 10
        
        view1?.isSkeletonable = true
        view2?.isSkeletonable = true
        view3?.isSkeletonable = true
        view4?.isSkeletonable = true
        squareView?.isSkeletonable = true
        
        view1?.showAnimatedGradientSkeleton()
        view2?.showAnimatedGradientSkeleton()
        view3?.showAnimatedGradientSkeleton()
        view4?.showAnimatedGradientSkeleton()
        squareView?.showAnimatedGradientSkeleton()
        squareView?.layer.cornerRadius = 10
        
        view.frame = CGRect.init(x: 0, y: 0, width: 200, height: 200)
        view.backgroundColor = UIColor.white     //give color to the view
        view.center = self.view.center
    }
}
