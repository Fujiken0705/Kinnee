//
//  ModalViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/09.
//
import RealmSwift
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
        do{let realm = try Realm()
            let item:Menudata = Menudata(value: ["name" : trainingname,"rep": trainingrep,"set": trainingset])
            try realm.write {
                realm.add(item,update: .modified)
            }
        }catch{
            print("エラー")
        }
    }
}
