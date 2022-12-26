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
        HanoAlert(title: "타이틀", message: "메시지", confirm: "확인", buttonStyle: .oneButton, completionHandler: nil)
            .showAlert(view)
    }
    
    @IBAction func HanoAlertTwoButtonTapped(_ sender: UIButton) {
        HanoAlert(title: "타이틀", message: "안녕하세요\nHano입니다.\n잘부탁드립니다람쥐", confirm: "확인", cancel: "취소", confirmColor: .red, buttonStyle: .twoButton, completionHandler: { [weak self] in
            guard let self = self else { return }
            self.view.backgroundColor = .lightGray
        })
            .showAlert(view)
    }
}

