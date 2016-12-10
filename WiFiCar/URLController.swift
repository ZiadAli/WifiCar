//
//  ViewController.swift
//  WiFiCar
//
//  Created by Ziad Ali on 11/24/16.
//  Copyright © 2016 ZiadCorp. All rights reserved.
//

import UIKit

class URLController: UIViewController {
    
    @IBOutlet var ipField: UITextField!
    var ipAddress = "192.168.1.27"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setIpAddress(ip:String) {
        ipAddress = ip
    }
    
    @IBAction func openPage(_ sender: Any) {
        openURL()
    }

    func openURL() {
        let url = URL(string: "http://\(ipAddress)/output_demo.html")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    func enterCommand(command:String) {
        let url = URL(string: "http://\(ipAddress)/output.cgi?text=\(command)&submit=Submit")
        do {
            let _ = try String(contentsOf: url!, encoding: .ascii)
            //print("HTML : \(myHTMLString)")
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    @IBAction func setURL(_ sender: Any) {
        ipAddress = ipField.text!
        print("IP: \(ipAddress)")
    }
}

