//
//  TiltController.swift
//  WiFiCar
//
//  Created by Ziad Ali on 11/27/16.
//  Copyright © 2016 ZiadCorp. All rights reserved.
//

import UIKit
import CoreMotion

class TiltController: UIViewController {

    let motionManager = CMMotionManager()
    var previousController = URLController()
    @IBOutlet var directionLabel: UILabel!
    @IBOutlet var sendCommandsSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendCommandsSwitch.isOn = false
        
        let count = self.navigationController?.viewControllers.count
        previousController = self.navigationController?.viewControllers[count!-3] as! URLController
        
        motionManager.accelerometerUpdateInterval = 0.3
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (accData, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            else if let accData = accData {
                self.processAccData(acceleration: accData.acceleration)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func processAccData(acceleration:CMAcceleration) {
        //print("X Acc: \(acceleration.x)")
        //print("Y Acc: \(acceleration.y)")
        //print("Z Acc: \(acceleration.z)")
        
        if acceleration.z > 0.45 {
            print("Backward")
            directionLabel.text = "Backward"
            performCommand(command: ".Z975B100")
        }
        else if acceleration.z < -0.45 {
            print("Forward")
            directionLabel.text = "Forward"
            performCommand(command: ".Z975F100")
        }
        else if acceleration.x < -0.45 && acceleration.y < -0.45 {
            print("Right")
            directionLabel.text = "Right"
            performCommand(command: ".Z975R100")
        }
        else if acceleration.x < -0.45 && acceleration.y > 0.45 {
            print("Left")
            directionLabel.text = "Left"
            performCommand(command: ".Z975L100")
        }
        else {
            print("Stop")
            directionLabel.text = "Stop"
            performCommand(command: ".Z975S100")
        }
    }
    
    func performCommand(command:String) {
        if sendCommandsSwitch.isOn {
            previousController.enterCommand(command: command)
        }
    }
}
