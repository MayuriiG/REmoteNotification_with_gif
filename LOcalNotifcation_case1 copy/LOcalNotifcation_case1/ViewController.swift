//
//  ViewController.swift
//  LOcalNotifcation_case1
//
//  Created by Mayurii Gajbhiye on 12/09/20.
//  Copyright © 2020 Mayurii Gajbhiye. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController,UNUserNotificationCenterDelegate {

    let notifictnCenter = UNUserNotificationCenter.current()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notifictnCenter.delegate = self
 //requests authorization to interact with the user when local and remote  notification are deliver to the user..
 
        
//  Mark:notification pop up
        notifictnCenter.requestAuthorization(options: [.alert,.badge,.sound]) { (success,error) in
            
        }
    
    }

    @IBAction func btn(_ sender: UIButton) {
    
    //title subtitle ...................
  
        
        let contentValue = UNMutableNotificationContent()
    
        contentValue.categoryIdentifier = "My🍪"
        contentValue.title = "Balance Nutrition!"
        contentValue.body =  " This is Diet time🥬🥒🥕 "
        contentValue.badge = 1
        //contentValue.launchImageName
       // contentValue.attachments
        contentValue.sound  = UNNotificationSound.defaultCritical
      //  content.subtitle
        contentValue.userInfo =  ["name": "BalanceUser😜"]
    
        
        
        
        //image
        
        let imageURL = Bundle.main.url(forResource: "0o", withExtension: "gif")!
        
        
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: [:])
        
        contentValue.attachments = [attachment]
        //let triggerDate = Calendar.current.date(byAdding: .day, value: 1, to: self)!
       // let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let triggerTime = UNTimeIntervalNotificationTrigger.init(timeInterval: 2, repeats: false)
        let identifierName = "Main identifier"
        
     
        //Request..........
        var request = UNNotificationRequest.init(identifier: identifierName, content: contentValue, trigger: triggerTime)
        
    
        //Add request
           notifictnCenter.add(request) { (error) in
                   print("\(error?.localizedDescription)")
               }
        
        
        //   actions for dragging .
        
        let like_action = UNNotificationAction.init(identifier: "Like", title: "Like👍🏼", options: .foreground)
        
        let delet_action =  UNNotificationAction.init(identifier: "Delete", title: "Delete😞", options: .destructive)
      
        //action and option
        let categoryy = UNNotificationCategory.init(identifier: contentValue.categoryIdentifier, actions: [like_action ,delet_action], intentIdentifiers: [], options: [])
        
        notifictnCenter.setNotificationCategories([categoryy])
        
//
        
    }
    
 //method -wii present
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.badge,.sound])
    }
    
    
    
    //did receiver
    
    
    //pushing to vc
//
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
//            homeViewController = mainStoryboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController

        let nextVC = self.storyboard?.instantiateViewController(identifier: "NextViewController") as! NextViewController
      
        if let  dictionry = response.notification.request.content.userInfo as? [AnyHashable: Any]{
        
            
            nextVC.textString = dictionry["name"] as! String
        }
        
        //        }        nextVC.textString = response.notification.request.content.userInfo["name"]
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        print("next")
    }
    
    
    
    

    func userNotificationCenter(center: UNUserNotificationCenter, didReceiveNotificationResponse response: UNNotificationResponse, withCompletionHandler completionHandler: () -> Void) {

        print("didReceive")
        print(" i receive")
        completionHandler()
    }

}



//normal notification
//then add like/delete
//add image 
