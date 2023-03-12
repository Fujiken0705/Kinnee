//
//  ViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/09.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 振動機能の追加
    let feedbackGenerator = UISelectionFeedbackGenerator()

    //　メニューの数をリストで定義
    var menuitems: Results<Menudata>!

    @IBOutlet private weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "HOME"
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
    }

    // TableViewのセルの数を登録したメニューの数にする
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuitems?.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? HomeTableViewCell {
            return cell
        }else {
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // 振動
            feedbackGenerator.selectionChanged()

        case 1:
            // 振動
            feedbackGenerator.selectionChanged()

        default:
            break
        }
    }

    @IBAction func showModal(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let goToAddView = storyboard.instantiateViewController(withIdentifier: "addMenuView")
        goToAddView.sheetPresentationController?.detents = [.medium(), .large()]
        self.present(goToAddView, animated: true, completion: nil)
    }
}
