//
//  ViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/09.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
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

    // セルの編集

    @IBAction func showModal(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let goToAddView = storyboard.instantiateViewController(withIdentifier: "addMenuView")
        goToAddView.sheetPresentationController?.detents = [.medium(), .large()]
        self.present(goToAddView, animated: true, completion: nil)
    }
    @objc func reloadFunc(notification: NSNotification?) {
        myTableView.reloadData()
    }

}

extension HomeViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 選択されたセルの情報を取得する


        // StoryboardからDetailViewControllerをインスタンス化する
        if let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            // 画面遷移する
            self.present(detailViewController, animated: true, completion: nil)
            let menu = menuitems?[indexPath.row]
            detailViewController.detailNameLabel.text = menu?.name
            detailViewController.detailRepLabel.text = menu?.rep
            detailViewController.detailSetLabel.text = menu?.set
            detailViewController.setContollLabel.text = menu?.set
        }
    }
}
