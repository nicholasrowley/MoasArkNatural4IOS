//
//  XMLParser.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 30/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

class XMLParser: NSObject, XMLParser {
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = XMLParser(contentsOfURL: rssURL)
        parser.delegate = self
        parser.parse()
        
    }

}
