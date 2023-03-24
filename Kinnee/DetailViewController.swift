//
//  DetailViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/16.
//
import SafariServices
import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailRepLabel: UILabel!
    @IBOutlet weak var detailSetLabel: UILabel!
    @IBOutlet weak var detailSearchButton: UIButton!
    @IBOutlet weak var setContollLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    var selectedData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func finishAlert() {

        // アラート作成
        let alert = UIAlertController(title: "1set finish！", message: "インターバル後にもう一回！", preferredStyle: .alert)

        // アラート表示
        self.present(alert, animated: true, completion: {
            // アラートを閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                alert.dismiss(animated: true, completion: nil)
            })
        })
    }

    func completeAlert() {

        // アラート作成
        let alert = UIAlertController(title: "You did it!", message: "お疲れ様でした", preferredStyle: .alert)

        // アラート表示
        self.present(alert, animated: true, completion: {
            // アラートを閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                alert.dismiss(animated: true, completion: nil)
            })
        })
    }


    @IBAction func doneButtonTapped(_ sender: Any) {        if setContollLabel.text == "0"{
        completeAlert()
        }else{
            if var controllnum = Int(setContollLabel.text ?? "") {
                // setContollLabel.textが数字の場合の処理
                controllnum -= 1
                setContollLabel.text = String(controllnum)
                finishAlert()

            } else {
                // setContollLabel.textが数字でない場合の処理
                print("error")
            }
        }

    }
}
