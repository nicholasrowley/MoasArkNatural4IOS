//
//  RSSTableViewController.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 30/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

class RSSTableViewController: UITableViewController, CustomXMLParserDelegate {
    
    var custXmlParser : CustomXMLParser!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string: "https://moasarknaturalnz.com/feed/") //rss feed link goes here
        //https://moasarknaturalnz.com/feed/
        //http://feeds.feedburner.com/appcoda
        custXmlParser = CustomXMLParser()
        custXmlParser.customDelegate = self
        custXmlParser.startParsingWithContentsOfURL(rssURL: url!) //swift 3 may be incompatible
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return custXmlParser.arrParsedData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath) as UITableViewCell //check swift 3 change

        let currentDirectory = custXmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        
        cell.textLabel?.text = currentDirectory["title"]

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dictionary = custXmlParser.arrParsedData[indexPath.row] as Dictionary<String, String>
        let rssLink = dictionary["link"]
        
        let rssViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "idRSSViewController") as! RSSViewController //may be incompatible with swift 3
        
        rssViewController.blogURL = URL(string: rssLink!)
        
        showDetailViewController(rssViewController, sender: self)
        
    }
    
    func parsingWasFinished() {
        self.tableView.reloadData()
    }

}
