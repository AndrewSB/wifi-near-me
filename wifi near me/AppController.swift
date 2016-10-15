import UIKit

extension App {
    class Controller {
        let window: UIWindow
        
        init(window: UIWindow) {
            self.window = window
            
            window.rootViewController = StoryboardScene.Main.initialViewController()
        }
    }
}
