//
//  ViewController.swift
//  Screen Break
//
//  Created by Saeed Baig on 3/1/21.
//

import UIKit

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
        
        resetButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    /* On button tap */
    
    // Reset
    @IBAction func onTapResetButton(_ sender: Any) {
        print("You pressed Reset button")
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
        }
    }
    
    // Pause
    @IBAction func onTapPauseButton(_ sender: Any) {
        print("You pressed Pause button")
    }
    
    /* Helper functions */
    @objc func runTimer() {
        numSeconds += 1
        timerText.text = "\(numSeconds) seconds"
    }
}

