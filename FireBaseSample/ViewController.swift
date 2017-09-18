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

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = FIRDatabase.database().reference()
        ref.child("users").setValue("111")
        ref.observe(.value) { (snapshot) in
            print("\(snapshot.key) -> \(String(describing: snapshot.value))")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

