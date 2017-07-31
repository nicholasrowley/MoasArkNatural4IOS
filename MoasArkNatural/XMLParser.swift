//
//  XMLParser.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 30/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

@objc protocol XMLParserDelegate{
    func parsingWasFinished()
}
class XMLParser: NSObject, XMLParser {
    
    var delegate : XMLParserDelegate?
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharcters = ""
    
    func startParsingWithContentsOfURL(rssURL: NSURL) {
        let parser = XMLParser(contentsOfURL: rssURL)
        parser.delegate = self
        parser.parse()
        
    }
    
    func parser(parser: XMLParser, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject: AnyObject]) {
        currentElement = elementName
    }
    
    func parser(parser: XMLParser, foundCharcters string: String!) {
        if (currentElement == "title" && currentElement != "Appcoda" || currentElement == "link" || currentElement == "pubDate") {
            foundCharcters += string
        }
    }
    
    func parser(parser: XMLParser, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if !foundCharcters.isEmpty {
            if elementName == "link" {
                foundCharcters = (foundCharcters as NSString).substring(from: 3) //check swift 3 correction
            }
            
            currentDataDictionary[currentElement] = foundCharcters
            
            foundCharcters = ""
            
            if currentElement == "pubDate" {
                arrParsedData.append(currentDataDictionary)
            }
        }
    }
    
    func parserDidEndDocument(parser: XMLParser) {
        delegate?.parsingWasFinished()
    }
    
    func parser(parser: XMLParser, parseErrorOccured parseError: NSError!) {
        println(parseError.description)
    }
    
    func parser(parser: XMLParser, validationErrorOccured validationError: NSError!) {
        println(validationError.description)
    }
    
    

}
