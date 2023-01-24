//      username  kminchelle
//      password  0lelplR

import UIKit
import Alamofire
class serves: NSObject {
    
    class func login(email : String , password : String , completion: (_ error : Error? , _ success: Bool)-> Void) {

        guard  let url = URL(string: URLs.login ) else {return}
        let parameter : [String:String] =
         ["username": email,
          "password": password]
        
        AF.request(url, method: .post, parameters: parameter, encoding: JSONEncoding.default)
            .responseDecodable(of: loginmodel.self) { Response in
                switch Response.result{
                case .success(let loginmodel) :
//                    print(Modellogin.data?.user?.token ?? "المشكله في خط ٦١")
//                    عشان نحفظ التوكن او اي حاجة
                    UserDefaults.standard.set(loginmodel.token, forKey: "ModelToken")
                    helper.RestatApp()
//                    عشان نستةعي الي حفظناة
                    let uesrdevoeldToken = UserDefaults.standard.string(forKey: "ModelToken")
                    print("uesrdevoeldToken",uesrdevoeldToken)
                case .failure(let errer): break
                    print("erre ")
                }
            }
         
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
