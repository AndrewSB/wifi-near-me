//
//  Router.swift
//  wifi near me
//
//  Created by Andrew Breckenridge on 3/22/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import UIKit

enum Route: StoryboardScene.Main.RawValue {
    case Onboarding
    case Authorized
    case Denied
    
    var storyboardScene: StoryboardScene.Main {
        get {
            switch self {
            case .Onboarding:
                return StoryboardScene.Main.OnboardingScene
            case .Authorized:
                return StoryboardScene.Main.AuthorizedScene
            case .Denied:
                return StoryboardScene.Main.DeniedScene
            }
        }
    }
    
    func locationEmbeddedVC(location: Location) -> UIViewController {
        var vc = self.storyboardScene.viewController() as! Locationable
        vc.location = location
        
        return vc as! UIViewController
    }
    
    func route(from: Route) -> StoryboardSegue.Main {
        switch from {
        case .Onboarding:
            switch Route.routeFromLocation {
            case .Authorized:
                return StoryboardSegue.Main.ToAuthorized
            default:
                return StoryboardSegue.Main.ToDenied
            }
        default:
            return StoryboardSegue.Main.ToDenied
        }
    }
}

extension Route {

    static var routeFromLocation: Route {
        let location = (UIApplication.sharedApplication().delegate as! AppDelegate).location // #warning: this is a shit way of accessing a *singleton* #deathtosingletonsanyway #bestpracticesdiedwithmysoul
        switch location.authorizationStatus {
        case .AuthorizedAlways, .AuthorizedWhenInUse:
            return .Authorized
        case .Denied:
            return .Denied
        case .NotDetermined, .Restricted:
            return .Onboarding
        }
    }

}