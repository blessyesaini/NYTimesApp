//
//  GeneralHandler.swift
//  NYTimesApp
//
//  Created by Blessy Elizabeth Saini on 7/28/21.
//

import Foundation
import UIKit
import Reachability
class GeneralHandler {
    static let shared = GeneralHandler()
  
    //MARK: - Network connection check

     func testConnection() -> Bool {
        
        var networkstatus = false
        let reachability = try? Reachability(hostname: "www.apple.com")
        
        switch reachability?.connection {
        case .wifi, .cellular:
            networkstatus = true
            break
            
        default:
            networkstatus = false
            break
        }
        
        if !networkstatus {
            DispatchQueue.main.async {
            }
        }
        
        return networkstatus
    }

    //MARK: - alert view controller display

     func showAlert(controller: UIViewController?, message:String){
        
        if let alertPresentController = controller{
            
            let validationLinkAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            
            let dismissAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            validationLinkAlert.addAction(dismissAction)
            alertPresentController.present(validationLinkAlert, animated: true, completion: nil)
        }
    }
}
