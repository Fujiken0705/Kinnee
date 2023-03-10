//
//  ViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 振動機能の追加
    let feedbackGenerator = UISelectionFeedbackGenerator()

    //　メニューの数をリストで定義
    let menuitems = [menuitem]()
    let menuname = menuitems.name

    @IBOutlet weak var myTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "HOME"
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)

        cell.textLabel?.text = menus.name[indexPath.row]
        cell.imageView?.image = UIImage(systemName: menus[indexPath.row])

        return cell
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
        let nextView = storyboard.instantiateViewController(withIdentifier: "addMenuView")
        nextView.sheetPresentationController?.detents = [.medium(), .large()]
        //ここがpushとは違う
        self.present(nextView, animated: true, completion: nil)
    }
}
