//
//  SideMenuController.swift
//  Task Test
//
//  Created by Ali Wicca on 21/01/2023.
//

import UIKit

class SideMenuController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
     @IBOutlet weak var containerView: UIView!
    var arryphotos = [photo]()
     var menu = false
     let screen = UIScreen.main.bounds
     var home = CGAffineTransform()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        arryphotos.append(photo(name: "Found 30 results", photos: [UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!, UIImage(named: "imagDelivery")!]) )
                          
        home = self.containerView.transform
        collectionView.dataSource = self
        collectionView.delegate = self
 
    }
    
    func showMenu() {
        
        self.containerView.layer.cornerRadius = 40
        let x = screen.width * 0.8
        let originalTransform = self.containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
            let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = scaledAndTranslatedTransform
            })
    }
    
    func hideMenu() {
        
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = self.home
                self.containerView.layer.cornerRadius = 0
            })
    }

    @IBAction func hidMeun(_ sender: Any) {
        
        if menu == true {
            print("user is hiding menu")
            hideMenu()
            menu = false
        }
    }
    
    @IBAction func showMenu(_ sender: UISwipeGestureRecognizer) {
        
        if menu == false && swipeGesture.direction == .right {
            showMenu()
            menu = true
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        arryphotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arryphotos[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecollectione", for: indexPath) as! Homecollectione
    cell.photos.image = arryphotos[indexPath.section].photos[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.41 , height: collectionView.frame.width * 0.41 )
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom:20, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let heder = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "photosCollectionReusableView", for: indexPath) as! photosCollectionReusableView
        heder.hedertietl.text = arryphotos[indexPath.section].name
        
        
        return heder
    }
    
    
    
    
}
struct photo {
    let name : String
    let photos : [UIImage]
}














//
//func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: collectionView.frame.width , height: 80)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 1
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0.5
//    }
