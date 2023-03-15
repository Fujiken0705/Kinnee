//
//  HomeTableViewCell.swift
//  Kinnee
//
//  Created by KentoFujita on 2023/03/12.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var repLabel: UILabel!
    @IBOutlet weak var setLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(item:Menudata) {
        nameLabel.text = item.name
        repLabel.text = item.rep
        setLabel.text = item.set
    }
}
