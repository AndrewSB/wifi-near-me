//
//  Location.swift
//  wifi near me
//
//  Created by Andrew Breckenridge on 3/22/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import Foundation

import CoreLocation

import RxSwift
import RxCocoa

protocol Locationable {
    var location: Location! { get set }
}

class Location {
    
    let manager: CLLocationManager = {
        let m = CLLocationManager()
//        m.delegate = s
        return m
    }()
    
    var authorizationStatus: CLAuthorizationStatus {
        get { return CLLocationManager.authorizationStatus() }
    }
    
}

extension Location {

    func requestAccess(kind: AuthorizationType) -> Observable<CLAuthorizationStatus> {
        switch kind {
        case .WhenInUse:
            manager.requestWhenInUseAuthorization()
        case .Always:
            manager.requestAlwaysAuthorization()
        }
                
        return manager.rx_didChangeAuthorizationStatus
    }

}

extension Location {

    enum AuthorizationType {
        case Always, WhenInUse
    }
    
}