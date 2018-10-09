//
//  doscInputView.swift
//  Documents
//
//  Created by Jacob Paul Hassler on 9/21/18.
//  Copyright © 2018 jphyr4. All rights reserved.
//

import UIKit

class docsInputView: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var TextView: UITextView!
    
    var document: docStruct?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let doc = document {
            TextView.text = doc.content ?? ""
            TextField.text = doc.name
            
            title = doc.name
        } else {
            title = ""
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func newName(_ sender: Any) {
        title = TextField.text
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = TextField.text else {
            return
        }
        
        Documents.save(title: name, content: TextView.text)
        
        navigationController?.popViewController(animated: true)
    }
}
