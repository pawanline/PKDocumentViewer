//
//  ViewController.swift
//  PKDocumentViewer
//
//  Created by Pawan Kumar iOS Developer on 12/02/2019.
//  Copyright (c) 2019 Pawan Kumar iOS Developer. All rights reserved.
//

import UIKit
import PKDocumentViewer

class ViewController: UIViewController,UIDocumentInteractionControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup delegates
          PKDocumentViewer.shared.setUpDelegates(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func viewPDFButtonTapped(_ sender: Any) {
        // Call to view pdf
               PKDocumentViewer.shared.viewPdf(urlPath: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf", screenTitle: "Tesing Document")
    }
    // when a document interaction controller needs a view controller for presenting a document preview.
      
    // use this fuction for preview
       func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
          return self.navigationController ?? UIViewController()
      }


}

