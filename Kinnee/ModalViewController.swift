//
//  ModalViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/09.
//

import UIKit

class ModalViewController : UIViewController{


    @IBOutlet weak var trainingname: UITextField!

    @IBOutlet weak var trainingrep: UITextField!

    @IBOutlet weak var trainingset: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "メニューの追加"
    }

    @IBAction func closeModal() {
        self.dismiss(animated: true, completion: nil)
    }
}
