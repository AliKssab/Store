//
//  helper.swift
//  Task Test
//
//  Created by Ali Wicca on 22/01/2023.
//

import UIKit

class helper: NSObject {
    
    class func RestatApp() {
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb  = UIStoryboard(name: "SideMenu", bundle: nil)
        var vc: UIViewController
        if getApiToken() == nil {

            vc = sb.instantiateInitialViewController()!

        } else {

            vc = sb.instantiateViewController(withIdentifier: "SideMenu")

        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .autoreverse ,  animations: nil , completion: nil)

    }
    
    class func getApiToken() -> String? {
        let uesrdevoeldToken = UserDefaults.standard
        return uesrdevoeldToken.object(forKey: "ModelToken") as? String
    }
}
