import AppKit   // AppKit for macOS applications
import Foundation

// Vulnerable XXE Example
class XXEViewController: NSViewController {  // Use NSViewController for macOS

    var parser: XMLParser!  // Declare the parser here, if you intend to use it
    
    func foo1() {
        var success: Bool
        // Ensure rawXml is defined or passed
        let rawXml = "<your-raw-xml-here>" // Replace with actual XML data or provide as input
        guard let rawXmlConvToData = rawXml.data(using: .utf8) else {
            print("Failed to convert rawXml to data")
            return
        }
        
        let myParser = XMLParser(data: rawXmlConvToData)
        // Vulnerability: Enabling external entity resolution
        myParser.shouldResolveExternalEntities = true
        myParser.delegate = self
        myParser.parse()
    }
    
    func foo2(xml: String) {
        guard let rawXmlConvToData = xml.data(using: .utf8) else {
            print("Failed to convert xml to data")
            return
        }
        
        parser = XMLParser(data: rawXmlConvToData)
        parser.delegate = self
        // Vulnerability: Enabling external entity resolution
        parser.shouldResolveExternalEntities = true
        parser.parse()
    }
}

