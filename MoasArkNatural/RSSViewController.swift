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
    
    var blogsButtonItem : UIBarButtonItem!
    
    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var pubDateButtonItem: UIBarButtonItem!
    
    @IBAction func showPublishDate(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        blogsButtonItem = UIBarButtonItem(title: "Blogs", style: UIBarButtonItemStyle.plain, target: self, action: #selector(RSSViewController.showRSSViewController))
        
        webview.isHidden = true
        toolbar.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: Selector("handleFirstViewControllerDisplayModeChangeWithNotification:"), name: NSNotification.Name(rawValue: "PrimaryVCDisplayModeChangeModeNotification"), object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if blogURL != nil {
            let request : URLRequest = URLRequest(url: blogURL)
            webview.loadRequest(request)
            
            if webview.isHidden {
                webview.isHidden = false
                toolbar.isHidden = false
            }
            
            if self.traitCollection.verticalSizeClass == UIUserInterfaceSizeClass.compact {
                toolbar.items?.insert(self.splitViewController!.displayModeButtonItem, at: 0)
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
    
    func showRSSViewController() {
        splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleFirstViewControllerDisplayModeChangeWithNotification(notification: NSNotification){
        let displayModeObject = notification.object as? NSNumber
        let nextDisplayMode = displayModeObject?.intValue
        
        if toolbar.items?.count == 3 {
            toolbar.items?.remove(at: 0)
        }
        
        if nextDisplayMode == UISplitViewControllerDisplayMode.primaryHidden.rawValue {
            toolbar.items?.insert(blogsButtonItem, at: 0)
        }
        else {
            toolbar.items?.insert(splitViewController!.displayModeButtonItem, at: 0)
        }
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.compact {
            let firstItem = toolbar.items?[0]
            if firstItem?.title == "Blogs" {
                toolbar.items?.remove(at: 0)
            }
        }
        else if previousTraitCollection?.verticalSizeClass == UIUserInterfaceSizeClass.regular {
            if toolbar.items?.count == 3 {
                toolbar.items?.remove(at: 0)
            }
            
            if splitViewController?.displayMode == UISplitViewControllerDisplayMode.primaryHidden {
                toolbar.items?.insert(blogsButtonItem, at: 0)
            }
            else {
                toolbar.items?.insert(self.splitViewController!.displayModeButtonItem, at: 0)
            }
        }
    }
}
