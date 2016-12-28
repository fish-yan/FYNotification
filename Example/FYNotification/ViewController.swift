//
//  ViewController.swift
//  FYNotification
//
//  Created by fish-yan on 12/28/2016.
//  Copyright (c) 2016 fish-yan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func action(_ sender: Any) {
        FYNotificationView.show(status: .success, message: "操作成功", duration: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

