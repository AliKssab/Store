//
//  didselectViewController.swift
//  Task Test
//
//  Created by Ali Wicca on 22/01/2023.
//

import UIKit

class didselectViewController: UIViewController {
    var arrycatgry : Product?
    @IBOutlet weak var imagedid: UIImageView!
    @IBOutlet weak var labeldid: UILabel!
    @IBOutlet weak var descrbtiondid: UILabel!
    @IBOutlet weak var priesdid: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labeldid.text = arrycatgry?.title
        descrbtiondid.text = arrycatgry?.description
        priesdid.text = ("\(arrycatgry!.price)")
        let imgurl =  (arrycatgry?.thumbnail)

        imagedid.downloaded(from: imgurl!)
    }
    

    

}
