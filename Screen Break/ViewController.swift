//
//  ViewController.swift
//  Screen Break
//
//  Created by Saeed Baig on 3/1/21.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    /* UI elements */
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var timerText: UILabel!
    
    /* Global variables */
    var timer = Timer()
    var isTimerRunning = false
    var numSeconds = 0     // just use seconds for now
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the appropriate buttons to enabled/disabled
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
        
        // Get permission to send notifications
        // Borrowed from online tut:
        // https://www.techotopia.com/index.php/An_iOS_10_Local_Notification_Tutorial#Requesting_Notification_Authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [[.alert, .sound, .badge]], completionHandler: {(granted, error) in
            // Handle error
        })
    }
    
    /* On button tap */
    
    // Reset
    @IBAction func onTapResetButton(_ sender: Any) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("Removed all notifications (I think)")
    }
    
    // Play
    @IBAction func onTapPlayButton(_ sender: Any) {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(
                timeInterval: 1,    // Call timer every 1 second
                target: self,
                selector: #selector(runTimer),
                userInfo: nil,
                repeats: true
            )
            isTimerRunning = true
            
            resetButton.isEnabled = true
            pauseButton.isEnabled = true
            playButton.isEnabled = false
            
            sendNotification()
        }
    }
    
    // Pause
    @IBAction func onTapPauseButton(_ sender: Any) {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        print("Removed all notifications (I think)")
    }
    
    /* Helper functions */
    @objc func runTimer() {
        numSeconds += 1
        timerText.text = "\(numSeconds) seconds"
    }
    
    func sendNotification() {
        //Borrowed from StackOverflow
        // https://stackoverflow.com/questions/30619998/repeating-local-notification-daily-at-a-set-time-with-swift
        
        let content = UNMutableNotificationContent()
        content.title = "Meeting Reminder"
        content.subtitle = "Staff meeting in 20 minutes"
        content.body = "Don't forget to bring coffee"
        
        // Deliver the notification every 1 minute
        let numMinutesBetweenNotifications = 1
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: TimeInterval(numMinutesBetweenNotifications * 60),
            repeats: true
        )

        // Create notification object
        let request = UNNotificationRequest(identifier: "takeBreakNotification", content: content, trigger: trigger)
        
        // Add it to Notification Centre
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
            // Handle error
        })
    }
}

