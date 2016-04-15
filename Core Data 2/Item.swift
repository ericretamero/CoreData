//
//  Item.swift
//  Core Data 2
//
//  Created by usu27 on 5/4/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class Item: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var apellido: UILabel!
    @IBOutlet weak var numero: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier:
        String?){
            super.init(style: style, reuseIdentifier:
                reuseIdentifier)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

}
