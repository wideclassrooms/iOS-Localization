//
//  ViewController.swift
//  Localization
//
//  Created by Naveen Chauhan on 11/02/22.
//

import UIKit
import FirebaseRemoteConfig

@objc(ViewController)
class ViewController: UIViewController {
    let languagesConfigKey = "languages"
    var remoteConfig: RemoteConfig!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        remoteConfig = RemoteConfig.remoteConfig()
        // [END get_remote_config_instance]
            // Create a Remote Config Setting to enable developer mode, which you can use to increase
            // the number of fetches available per hour during development. See Best Practices in the
            // README for more information.
            // [START enable_dev_mode]
            let settings = RemoteConfigSettings()
            settings.minimumFetchInterval = 0
            remoteConfig.configSettings = settings
        
        // Set default Remote Config parameter values. An app uses the in-app default values, and
            // when you need to adjust those defaults, you set an updated value for only the values you
            // want to change in the Firebase console. See Best Practices in the README for more
            // information.
            // [START set_default_values]
            remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
            // [END set_default_values]
        
        
        fetchConfig()
        
    }
    
    func fetchConfig() {
        // [START fetch_config_with_callback]
        remoteConfig.fetch { (status, error) -> Void in
          if status == .success {
            print("Config fetched!")
            self.remoteConfig.activate { changed, error in
              // ...
            }
          } else {
            print("Config not fetched")
            print("Error: \(error?.localizedDescription ?? "No error available.")")
          }
            self.displayWelcome()
        }
        // [END fetch_config_with_callback]
      }
    
    func displayWelcome() {
        // [START get_config_value]
        var welcomeMessage = remoteConfig[languagesConfigKey].jsonValue
        print(welcomeMessage)
        // [END get_config_value]
//        if remoteConfig[welcomeMessageCapsConfigKey].boolValue {
//          welcomeMessage = welcomeMessage?.uppercased()
//        }
//        welcomeLabel.text = welcomeMessage
      }

    


}

