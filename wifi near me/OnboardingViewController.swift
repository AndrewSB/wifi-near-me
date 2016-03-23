//
//  OnboardingViewController.swift
//  wifi near me
//
//  Created by Andrew Breckenridge on 3/22/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import UIKit

import Library

import PermissionScope

import CoreLocation

class OnboardingViewController: UIViewController, Locationable {
    
    @IBOutlet weak var bigTextLabel: UILabel!

    var location: Location!
    
    let pscope: PermissionScope = {
        let infoPlist = NSBundle.mainBundle().infoDictionary!
        
        let permissions: [(Permission, String)] = [
//            (LocationWhileInUsePermission(), infoPlist["NSLocationWhenInUseUsageDescription"] as! String),
            (LocationAlwaysPermission(), infoPlist["NSLocationAlwaysUsageDescription"] as! String),
            (NotificationsPermission(), "We use this to alert you when we find a nearby network")
        ]
        
        let ps = PermissionScope()
        permissions.forEach(ps.addPermission)
        
        return ps
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delay(2, closure: showPermissionScope)
    }

}

extension OnboardingViewController {

    func showPermissionScope() {
        
        self.pscope.show { _ in
            
        }
    }
    
    func handlePermissionResult(authChange: authClosureType?, cancelled: cancelClosureType?) {
        
        
        
    }

}