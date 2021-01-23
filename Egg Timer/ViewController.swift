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
    
    var eggTimer = 210
    
    @IBOutlet weak var timeLabel: UILabel!
    
    
    //function associated with timer object
    @objc func processTimer() {
        if eggTimer > 0 {
            eggTimer -= 1
            timeLabel.text = String(eggTimer)
        }
            else {
                timer.invalidate()
            }
    }

    
    @IBAction func pausePressed(_ sender: Any) {
        timer.invalidate()
    }
     
    
    @IBAction func playPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func minusTenPressed(_ sender: Any) {
        if eggTimer >= 10 {
            eggTimer -= 10
            timeLabel.text = String(eggTimer)
        }
    }
    
    @IBAction func plusTenPressed(_ sender: Any) {
        eggTimer += 10
        timeLabel.text = String(eggTimer)
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

