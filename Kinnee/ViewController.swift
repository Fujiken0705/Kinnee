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
    var menuitems: Results<Menudata>?

    @IBOutlet private weak var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "HOME"
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        do {
            let realm = try Realm()
            menuitems = realm.objects(Menudata.self)
        }catch (let error) {
            print(error)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
      super.viewDidAppear(animated)
        do {
            let realm = try Realm()
            menuitems = realm.objects(Menudata.self)
        }catch (let error) {
            print(error)
        }
      // テーブルを再描画
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
            let menuname = item?.name
            let menurep = item?.rep
            let menuset = item?.set
            // CollectionView -> 各Cellにデータを渡したい
            cell.configure(item: item)
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
