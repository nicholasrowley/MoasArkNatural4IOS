//
//  CustomXMLParser.swift
//  MoasArkNatural
//
//  Created by Nicholas Rowley on 31/07/17.
//  Copyright © 2017 One Life Group (NZ) Limited. All rights reserved.
//

import UIKit

@objc protocol CustomXMLParserDelegate{
    func parsingWasFinished()
}

class CustomXMLParser: NSObject, XMLParserDelegate {
    
    var customDelegate : CustomXMLParserDelegate?
    
    var arrParsedData = [Dictionary<String, String>]()
    
    var currentDataDictionary = Dictionary<String, String>()
    
    var currentElement = ""
    
    var foundCharcters = ""
    
    func startParsingWithContentsOfURL(rssURL: URL) { //swift 3 requires NSURL as URL
        let parser = XMLParser(contentsOf: rssURL)
        parser!.delegate = self
        parser!.parse()
    
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
    currentElement = elementName
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
    if (currentElement == "title" && currentElement != "Appcoda" || currentElement == "link" || currentElement == "pubDate") {
    foundCharcters += string
    }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
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
    
    func parserDidEndDocument(_ parser: XMLParser) {
        customDelegate!.parsingWasFinished()
    }
    
    func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError.localizedDescription)
    }
    
    func parser(_ parser: XMLParser, validationErrorOccurred validationError: Error) {
        print(validationError.localizedDescription)
    }
}
