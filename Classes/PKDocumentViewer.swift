//
//  PKDocumentViewer.swift
//  PKDocumentViewer
//
//  Created by Pawan Kumar on 02/12/19.
//

import Foundation
import UIKit

open class PKDocumentViewer: UIViewController {
    
    // MARK:- Variables
    
    open var pkDocumentInteractionController = UIDocumentInteractionController()
    
    class public var shared: PKDocumentViewer {
        struct Static {
            static let instance: PKDocumentViewer = PKDocumentViewer()
        }
        return Static.instance
    }
    

    
    
    // MARK: - Helper methods
    
  public func viewPdf(urlPath: String, screenTitle: String) {
        // open pdf for booking id
        guard let url = urlPath.toUrl else {
            print("Please pass valid url")
            return
        }
        
        self.downloadPdf(fileURL: url, screenTitle: screenTitle) { localPdf in
            if let url = localPdf {
                DispatchQueue.main.sync {
                    self.openDocument(atURL: url, screenTitle: screenTitle)
                }
            }
        }
    }
    
    public func setUpDelegates(_ vc: UIViewController)  {
        self.pkDocumentInteractionController.delegate = vc as? UIDocumentInteractionControllerDelegate
    }
    
    // method  for download pdf file
    func downloadPdf(fileURL: URL, screenTitle: String, complition: @escaping ((URL?) -> Void)) {
        // Create destination URL
        if let documentsUrl: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let destinationFileUrl = documentsUrl.appendingPathComponent("\(screenTitle).pdf")
            
            if FileManager.default.fileExists(atPath: destinationFileUrl.path) {
                try? FileManager.default.removeItem(at: destinationFileUrl)
            }
            
            let sessionConfig = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfig)
            
            let request = URLRequest(url: fileURL)
            
            let task = session.downloadTask(with: request) { tempLocalUrl, response, error in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationFileUrl)
                        complition(destinationFileUrl)
                    } catch let writeError {
                        print("Error creating a file \(destinationFileUrl) : \(writeError)")
                    }
                    
                } else {
                    print("Error took place while downloading a file. Error description: \(error?.localizedDescription ?? "N/A")")
                }
            }
            task.resume()
        } else {
            complition(nil)
        }
    }
    
    func openDocument(atURL url: URL, screenTitle: String) {
        self.pkDocumentInteractionController.url = url
        self.pkDocumentInteractionController.name = screenTitle
        self.pkDocumentInteractionController.presentPreview(animated: true)
    }
    
  
}



// MARK: - String extension
// MARK: -
extension String {
    /// EZSE: Converts String to URL
    var toUrl: URL? {
        if self.hasPrefix("file://") || self.hasPrefix("https://") || self.hasPrefix("http://") {
            return URL(string: self)
        } else {
            return URL(fileURLWithPath: self)
        }
    }
}


