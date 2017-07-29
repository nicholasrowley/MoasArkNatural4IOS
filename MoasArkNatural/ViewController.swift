//
//  ViewController.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 24/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var homeToolbar: UIToolbar!
    @IBOutlet weak var placeholderLabel: UILabel!
    var phNumber = 0
    
    @IBOutlet weak var imageButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation bar
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "Logo"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(logoOnTap(_:)), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
        
        
        //Create items for the toolbar
        let notificationsBarItem = UIBarButtonItem(title: "Notifications", style: UIBarButtonItemStyle.plain, target: self, action: #selector(notificationsAction))
        
        let danceOrExBarItem = UIBarButtonItem(title: "Dance or Exercise video gallery", style: UIBarButtonItemStyle.plain, target: self, action: #selector(danceOrExAction))
        
        let foodBarItem = UIBarButtonItem(title: "Food video gallery", style: UIBarButtonItemStyle.plain, target: self, action: #selector(foodAction))
        
        //Add to items collection in order
        homeToolbar.items?.append(notificationsBarItem)
        homeToolbar.items?.append(danceOrExBarItem)
        homeToolbar.items?.append(foodBarItem)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //All toolbar onTap functions
    func logoOnTap(_ sender: UIBarButtonItem)
    {
        
    }
    
    func notificationsAction(barButtonItem: UIBarButtonItem) {
        placeholderLabel.text = "Notifications action \(phNumber)"
        phNumber += 1
    }
    
    func danceOrExAction(barButtonItem: UIBarButtonItem) {
        placeholderLabel.text = "Dance or Exercise video gallery action \(phNumber)"
        phNumber += 1
    }
    
    func foodAction(barButtonItem: UIBarButtonItem) {
        placeholderLabel.text = "Food video gallery action \(phNumber)"
        phNumber += 1
    }

    //TODO will delete at some point
    @IBAction func itemAction(_ sender: UIBarButtonItem) {
        placeholderLabel.text = "Start action \(phNumber)"
        phNumber += 1
    }
    
    @IBAction func goToMoasArkShop(_ sender: UIButton) {
        //go to moas ark shop
        let url = URL(string: "https://moasarknaturalnz.com/en_NZ/shop/")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func refreshAction(_ sender: UIBarButtonItem) {
        placeholderLabel.text = "Refresh action \(phNumber)"
        phNumber += 1
    }
    
    
    @IBAction func searchAction(_ sender: UIBarButtonItem) {
        placeholderLabel.text = "Search action \(phNumber)"
        phNumber += 1
    }
    

}

