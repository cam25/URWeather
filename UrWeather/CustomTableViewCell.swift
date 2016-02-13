//
//  CustomTableViewCell.swift
//  UrWeather
//
//  Created by Cameron Mozie on 5/23/15.
//  Copyright (c) 2015 Cameron Mozie. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var dayOfTheWeekLabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    
    func loadItems(title title: String, image:String){
        
        weatherImage.image = UIImage(named: image);
        dayOfTheWeekLabel.text = title;
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
