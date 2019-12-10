# PKDocumentViewer

[![Version](https://img.shields.io/cocoapods/v/PKDocumentViewer.svg?style=flat)](https://cocoapods.org/pods/PKDocumentViewer)
[![License](https://img.shields.io/cocoapods/l/PKDocumentViewer.svg?style=flat)](https://cocoapods.org/pods/PKDocumentViewer)
[![Platform](https://img.shields.io/cocoapods/p/PKDocumentViewer.svg?style=flat)](https://cocoapods.org/pods/PKDocumentViewer)
[![codebeat badge](https://codebeat.co/badges/580517f8-efc8-4d20-89aa-900531610144)](https://codebeat.co/projects/github-com-pawanline-pkdocumentviewer-master)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13.0+
- Xcode 11.0+

## Installation

PKDocumentViewer is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PKDocumentViewer'
```


## Code Example for setup
```swift

//implement UIDocumentInteractionControllerDelegate
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
               PKDocumentViewer.shared.viewPdf(urlPath: "http://www.pdf995.com/samples/pdf.pdf", screenTitle: "Tesing Document")
    }
    
    // when a document interaction controller needs a view controller for presenting a document preview.
      
    // use this fuction for preview
       func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
          return self.navigationController ?? UIViewController()
      }
}
```




## Usage

![preview](https://github.com/pawanline/PKDocumentViewer/blob/master/Example/PKDocumentViewer/PKDocumentViewerDemo.gif)


## Author

Pawan Kumar iOS Developer, bestappledeveloper@gmail.com,https://pawankumar.cf/

## License

PKDocumentViewer is available under the MIT license. See the LICENSE file for more info.
