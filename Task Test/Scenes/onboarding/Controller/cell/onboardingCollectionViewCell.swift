//
//  onboardingCollectionViewCell.swift
//  Task Test
//
//  Created by Ali Wicca on 20/01/2023.
//

import UIKit

class onboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var sliedTitel: UILabel!
    @IBOutlet weak var slideImag: UIImageView!
    @IBOutlet weak var sliedDescrbtione: UILabel!
    
    func setup(_ slide:OnbardingModel ) {
        
        slideImag.image = slide.image
        sliedTitel.text = slide.title
        sliedDescrbtione.text = slide.descriptione
        
        
    }
    
    
    
    
    
}
