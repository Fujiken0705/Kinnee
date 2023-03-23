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
        let alert = UIAlertController(title: "1セット終了！", message: "インターバル後にもう一回！", preferredStyle: .alert)

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
        let alert = UIAlertController(title: "You`ve got it!", message: "お疲れ様でした", preferredStyle: .alert)

        // アラート表示
        self.present(alert, animated: true, completion: {
            // アラートを閉じる
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                alert.dismiss(animated: true, completion: nil)
            })
        })
    }


    @IBAction func doneButtonTapped(_ sender: Any) {
        if setContollLabel.text == "1"{
            completeAlert()
        }else{
            print("うまく動くかな")
        }

    }
}
