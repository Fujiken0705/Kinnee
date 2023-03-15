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

    let realm = try? Realm()

    //　メニューの数をリストで定義
    var menuitems: Results<Menudata>?

    @IBOutlet private weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "HOME"
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        NotificationCenter.default.addObserver(self, selector: #selector(reloadFunc(notification:)), name: .tableReloadNotification, object: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        // Realmから最新のデータを取得する
        let realm = try? Realm()
        // Realmからデータを取得
        menuitems = realm?.objects(Menudata.self)

        // TableViewを更新
        myTableView.reloadData()
        }

    // TableViewのセルの数を登録したメニューの数にする
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let menuItemsCount = menuitems?.count {
            return menuItemsCount
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? HomeTableViewCell {
            // セルに表示するデータを取得
            let item = menuitems?[indexPath.item]
            // TableView -> 各Cellにデータを渡したい
            cell.configure(item: item!)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 80
     }
    // TableViewのセルを削除
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let item = menuitems?[indexPath.row] else { return print("aaa") }
            try? realm?.write {
                realm?.delete(item)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        switch indexPath.row {
//        case 0:
//            // 振動
//            feedbackGenerator.selectionChanged()
//
//        case 1:
//            // 振動
//            feedbackGenerator.selectionChanged()
//
//        default:
//            break
//        }
//    }

    @IBAction func showModal(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let goToAddView = storyboard.instantiateViewController(withIdentifier: "addMenuView")
        goToAddView.sheetPresentationController?.detents = [.medium(), .large()]
        self.present(goToAddView, animated: true, completion: nil)
    }
    @objc func reloadFunc(notification: NSNotification?) {
        myTableView.reloadData()
    }

    // セルの並び替えを実装する
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var menuitems: List<Menudata>?
        let realm = try? Realm()
        try? realm?.write {
            menuitems?.move(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
    }
}
