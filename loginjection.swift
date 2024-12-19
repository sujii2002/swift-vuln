import AppKit // Use AppKit for macOS
import WebKit
import Foundation

// Vulnerable log injection example
class LogViewController: NSViewController {  // Use NSViewController for macOS

    func foo6(webView: WKWebView, navigationAction: WKNavigationAction) {
        // Get the URL from the navigation action
        let urlStr = navigationAction.request.url?.absoluteString
        
        // Break down the URL into its components (query, host)
        let components = URLComponents(url: URL(string: urlStr!)!, resolvingAgainstBaseURL: false)
        
        // Vulnerable log injection (could leak sensitive data if URL contains PII or other sensitive information)
        NSLog("Query value = %@", components?.query ?? "N/A")
        NSLog("Host value = %@", components?.host ?? "N/A")
    }
}

