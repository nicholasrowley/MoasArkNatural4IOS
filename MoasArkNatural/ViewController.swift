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
        
        //Create items for the toolbar
        let item1 = UIBarButtonItem(title: "Start", style: UIBarButtonItemStyle.plain,
                                    target: self, action: #selector(startAction))
        
        let toolbarLogoImage = UIImage(named: "Logo")
        let toolbarLogo = UIBarButtonItem(image: toolbarLogoImage?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action:  #selector(logoOnTap))
        
        //Add to items collection
        homeToolbar.items?.append(item1)
        homeToolbar.items?.insert(toolbarLogo, at: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startAction(barButtonItem: UIBarButtonItem) {
        placeholderLabel.text = "Start action \(phNumber)"
        phNumber += 1
    }
    
    func logoOnTap(_ sender: UIBarButtonItem)
    {
        
    }

    @IBAction func itemAction(_ sender: UIBarButtonItem) {
        placeholderLabel.text = "Start action \(phNumber)"
        phNumber += 1
    }
    

}

