//
//  PruebaViewController.swift
//  AppDocencia23
//
//  Created by Ivan Gabriel on 08/04/23.
//



import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    
    
    
    override func awakeFromNib() {
    layer.cornerRadius = 30
    layer.borderColor = UIColor.gray.cgColor
      
        layer.borderWidth = 0.6
        //layer.masksToBounds = true
       // layer.shadowOpacity = 0.1
        //layer.shadowRadius = 10
        //layer.shadowOffset = 	CGSize(width: 0.0, height: 0.0)
      
  }

}
