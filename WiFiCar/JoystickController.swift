//
//  JoystickController.swift
//  WiFiCar
//
//  Created by Ziad Ali on 11/24/16.
//  Copyright © 2016 ZiadCorp. All rights reserved.
//

import UIKit

class JoystickController: UIViewController {

    var previousController = URLController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let count = self.navigationController?.viewControllers.count
        previousController = self.navigationController?.viewControllers[count!-2] as! URLController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func forward(_ sender: Any) {
        previousController.enterCommand(command: ".Z975F200")
    }
    
    @IBAction func right(_ sender: Any) {
        previousController.enterCommand(command: ".Z975R200")
    }
    
    @IBAction func left(_ sender: Any) {
        previousController.enterCommand(command: ".Z975L200")
    }
    
    @IBAction func back(_ sender: Any) {
        previousController.enterCommand(command: ".Z975B200")
    }
    
    @IBAction func stop(_ sender: Any) {
        previousController.enterCommand(command: ".Z975S200")
    }
    
    @IBAction func blackLine(_ sender: Any) {
        previousController.enterCommand(command: ".Z975X200")
    }
}
