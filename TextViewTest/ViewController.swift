//
//  ViewController.swift
//  TextViewTest
//
//  Created by Assaf Tayouri - DAZN X on 13/10/2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    // The constraint height can be set to the 5 rows height
    @IBOutlet weak var textViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // https://developer.apple.com/documentation/uikit/nstextcontainer/1444531-maximumnumberoflines
        // textView.textContainer.maximumNumberOfLines = 5
        textView.delegate = self
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        view.layoutIfNeeded() // For shrinking the Text View after deleting when it was tha max height. Maybe there is a better way for updating the textView, worth the research.
        if textView.contentSize.height >= textViewHeightConstraint.constant
        {
            textView.isScrollEnabled = true
        }
        else
        {
            textView.isScrollEnabled = false
        }
    }
}

