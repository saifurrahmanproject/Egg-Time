//
//  ViewController.swift
//  Egg Time
//
//  Created by Tonoy Rahman on 2020-10-08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var titleLevel: UILabel!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
  
    @IBAction func eggSelected(_ sender: UIButton) {
        
       
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLevel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
           secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            
            timer.invalidate()
            titleLevel.text = "Done!"
        }
    }
 
}

