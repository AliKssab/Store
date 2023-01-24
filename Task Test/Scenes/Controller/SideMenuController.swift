//
//  SideMenuController.swift
//  Task Test
//
//  Created by Ali Wicca on 21/01/2023.
//


//collectionView

import UIKit
import Alamofire

class SideMenuController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    var arryproducts = [Product]()
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
     @IBOutlet weak var containerView: UIView!
     var menu = false
     let screen = UIScreen.main.bounds
     var home = CGAffineTransform()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
                          
        home = self.containerView.transform
        collectionView.dataSource = self
        collectionView.delegate = self
        gitdataHome()
    }
    
    
    
    func gitdataHome()   {
        guard  let url = URL(string: URLs.products ) else {return}
        AF.request(url, method: .get)
            .responseDecodable(of:ModelHome.self) { Response in
                switch Response.result{
                case .success(let array) :
                    self.arryproducts = array.products
                    print ("aaaaaaa\(array)")
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                case .failure(let errer):
                    print(errer)
            }
        }
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arryproducts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Homecollectione", for: indexPath) as! Homecollectione
        let catgrys = arryproducts[indexPath.row]
        cell.label.text = catgrys.title
        cell.Descrbtione.text = catgrys.brand
        let imgurl =  (catgrys.thumbnail)
        cell.photos.downloaded(from: imgurl)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.41 , height: collectionView.frame.width * 0.41 )
        
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom:20, right: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                print("user is hiding menu")
                let calender = UIStoryboard(name: "SideMenu", bundle: nil).instantiateViewController(withIdentifier: "didselectView") as? didselectViewController
                let catgrys = arryproducts[indexPath.row]
                    calender?.arrycatgry = catgrys
                self.present(calender!, animated: true)
    }
}
struct photo {
    let name : String
    let photos : [UIImage]
}
