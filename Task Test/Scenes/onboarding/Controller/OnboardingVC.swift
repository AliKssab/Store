//
//  OnboardingVC.swift
//  Task Test
//
//  Created by Ali Wicca on 20/01/2023.
//

import UIKit

class OnboardingVC: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource  , UICollectionViewDelegateFlowLayout{
    var slides :[OnbardingModel] = []
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var Page: UIPageControl!
    @IBOutlet weak var Nexst: UIButton!
    var currentPage = 0 {
        didSet {
            Page.currentPage = currentPage
            if currentPage == slides.count - 1 {
                Nexst.setTitle("", for: .normal)
            } else {
                Nexst.setTitle("", for: .normal)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Page.numberOfPages = slides.count

        slides = [
            OnbardingModel(title: "Browse your menu and order directly", descriptione: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "imagman")),
            OnbardingModel(title: "Even to space with us! Together", descriptione: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "imageater")),
            OnbardingModel(title: "Pickup delivery at your door", descriptione: "Our app can send you everywhere, even space. For only $2.99 per month", image: #imageLiteral(resourceName: "imagDelivery"))
                 ]
        Page.numberOfPages = slides.count
        CollectionView.delegate = self
        CollectionView.dataSource = self
    }
    
    
    
    
    @IBAction func nextButtonClick(_ sender: Any) {
        if currentPage == slides.count - 1 {
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            UserDefaults.standard.hasOnboarded = true
            present(vc, animated: true)
        } else {
            
        
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            CollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onboardingCollectionViewCell.identifier, for: indexPath) as! onboardingCollectionViewCell
        cell.setup(slides[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
