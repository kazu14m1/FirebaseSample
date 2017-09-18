//
//  ViewController.swift
//  FireBaseSample
//
//  Created by Kazuki MIHARA on 2017/08/06.
//  Copyright © 2017年 Kazuki MIHARA. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var messageField: UITextField!
    @IBOutlet weak var chatView: UITextView!
    @IBAction func tapButton(_ sender: Any) {
        guard let name = nameField.text, let message = messageField.text else {
            return
        }

        let data = ["name": name, "message": message]
        ref.child("chat").childByAutoId().setValue(data)
        messageField.text = ""
        return
    }

    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child("chat").observe(.childAdded, with: { (snapshot) in
            guard let value = snapshot.value as? [String: String] else {
                return
            }
            if let name = value["name"], let message = value["message"] {
                let text = String(describing: self.chatView.text ?? "")
                self.chatView.text = text == "" ? "\(name) : \(message)" : "\(text)\n\(name) : \(message)"
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        ref.removeAllObservers()
    }
}
