//
//  DetailViewController.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/16.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailRepLabel: UILabel!
    @IBOutlet weak var detailSetLabel: UILabel!
    @IBOutlet weak var detailSearchButton: UIButton!
    @IBOutlet weak var setContollellLabel: UILabel!
    @IBOutlet weak var setCompleteButton: UIButton!
    var selectedData: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        detailNameLabel.text = selectedData
        detailRepLabel.text = "3"
        detailSetLabel.text = "3"
    }
}
