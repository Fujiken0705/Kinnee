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
        let newmenu = Menudata()
        newmenu.name = trainingname.text!
        newmenu.rep = trainingrep.text!
        newmenu.set = trainingset.text!
        do {let realm = try Realm()
            let item : Menudata = Menudata(value: ["name" : newmenu.name,"rep": newmenu.rep,"set": newmenu.set])
            try realm.write {
                realm.add(item,update: .modified)
            }
        } catch{
            print("エラー")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
