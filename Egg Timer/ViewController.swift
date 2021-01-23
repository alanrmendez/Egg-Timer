//
//  ViewController.swift.
//  Egg Timer
//
//  Created by Alan Mendez on 1/22/21.
//  
//

import UIKit

class ViewController: UIViewController {

    
    //timer object
    var timer = Timer()
    
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    //function associated with timer object
    @objc func processTimer() {
        if let eggTimerString = timeLabel.text {
            let eggTimerInt = Int(eggTimerString)
            if var eggTimer = eggTimerInt {
                if eggTimer <= 0 {
                    timer.invalidate()
                    eggTimer = 0
                } else {eggTimer -= 1}
                timeLabel.text = String(eggTimer)
            }
            else {print("error: value not a number")}
        }
        else {print("error: value not a number")}
    }

    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func minusTenPressed(_ sender: Any) {
        if let eggTimerString = timeLabel.text {
            let eggTimerInt = Int(eggTimerString)
            if var eggTimer = eggTimerInt {
                if eggTimer - 10 <= 0 {
                    timer.invalidate()
                    eggTimer = 0
                } else {eggTimer -= 10}
                timeLabel.text = String(eggTimer)
            }
        }
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        if let eggTimerString = timeLabel.text {
            let eggTimerInt = Int(eggTimerString)
            if var eggTimer = eggTimerInt {
                eggTimer += 10
                timeLabel.text = String(eggTimer)
            }
        }
    }
    
    @IBAction func resetPressed(_ sender: Any) {
        timer.invalidate()
        timeLabel.text = "210"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

