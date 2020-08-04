//
//  ViewController.swift
//  Chess Timer
//
//  Created by Aadi Padmawar on 3/6/19.
//  Copyright © 2019 Aadi Padmawar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer()
    var opptimer = Timer()
    
    
    var time = 300
    var mintime = 0
    var sectime = 0
    
    var opptime = 300
    var oppmintime = 0
    var oppsectime = 0
    
    var check = 0
    var oppcheck = 0
    
    

    
    @IBAction func OpTimer(_ sender: UIButton) {
        if (oppcheck == 0) {
            opptimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.opaction), userInfo: nil, repeats: true)
            timer.invalidate()
            oppcheck = 1
            check = 0
        }
    }
    
    @IBAction func reset(_ sender: UIButton) {
        resets()
    }
    
    func resets() {
        opptimer.invalidate()
        timer.invalidate()
        time = 301
        opptime = 301
        action()
        opaction()
        check = 0
        oppcheck = 0
    }
    
    @IBAction func pause(_ sender: UIButton) {
        opptimer.invalidate()
        timer.invalidate()
        check = 0
        oppcheck = 0
    }
    
    @IBAction func clock(_ sender: UIButton) {
        time = 301
        opptime = 301
        resets()
    }
    
    @IBAction func facingTimer(_ sender: Any) {
        
        if (check == 0) {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.action), userInfo: nil, repeats: true)
            opptimer.invalidate()
            check = 1
            oppcheck = 0
        }
        
        
        
    }
    
    @IBOutlet weak var opTime: UILabel!
    
    
    
    @IBOutlet weak var facingTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        opTime.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func action() {
        time -= 1
        mintime = time/60
        sectime = time%60
        
        if (sectime < 10) {
            facingTime.text = ("\(mintime):0\(sectime)")
        }
        else {
            facingTime.text = ("\(mintime):\(sectime)")
        }
        
        if (mintime == 0 && sectime == 0) {
            endgame(fromWho: "purple")
            resets()
            
        }
    }
    
    @objc func opaction() {
        opptime -= 1
        oppmintime = opptime/60
        oppsectime = opptime%60
        if (oppsectime < 10) {
            opTime.text = ("\(oppmintime):0\(oppsectime)")
        }
        else {
            opTime.text = ("\(oppmintime):\(oppsectime)")
        }
        
        if (oppmintime == 0 && oppsectime == 0) {
            endgame(fromWho: "blue")
            resets()
            
        }
        
    }
    
    func endgame(fromWho player: String) {
        
        // create the alert
        let alert = UIAlertController(title: "The game has ended", message: "Team \(player) has won!", preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

