//
//  ViewController.swift
//  HanoAlert
//
//  Created by Glsme on 12/21/2022.
//  Copyright (c) 2022 Glsme. All rights reserved.
//

import UIKit
import HanoAlert

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func HanoAlertOneButtonTapped(_ sender: UIButton) {
        HanoAlert(title: "타이틀", message: "메시지", confirm: "확인", font: nil, buttonStyle: .oneButton, completionHandler: nil)
            .showAlert(view)
    }
    
    @IBAction func HanoAlertTwoButtonTapped(_ sender: UIButton) {
        HanoAlert(title: "타이틀", message: "메시지", confirm: "확인", cancel: "취소", font: nil, buttonStyle: .twoButton, completionHandler: nil)
            .showAlert(view)
    }
}

