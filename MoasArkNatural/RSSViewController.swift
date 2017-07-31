//
//  RSSViewController.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 30/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

class RSSViewController: UIViewController {
    
    var blogURL : URL!
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    
    @IBAction func showPublishDate(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        webview.isHidden = true
        toolbar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if blogURL != nil {
            let request : NSURLRequest = NSURLRequest(URL: blogURL)
            webview.loadRequest(request)
            
            if webview.isHidden {
                webview.isHidden = false
                toolbar.isHidden = false
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
