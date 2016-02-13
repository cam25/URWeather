//
//  WeatherDetailViewController.swift
//  UrWeather
//
//  Created by Cameron Mozie on 5/23/15.
//  Copyright (c) 2015 Cameron Mozie. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var dayInfo: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    var forecastObject: NSDictionary!;
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print(forecastObject);
        let condition:NSString = forecastObject["conditions"] as! String;
        
        print(condition);
        let img = forecastObject["icon_url"] as! NSString as String;
        
        let imageURL = NSURL(string: img);
        print(imageURL)
        let data = NSData(contentsOfURL: imageURL!);
        
       // let humidity:Int = forecastObject["avehumidity"] as! Int;
        let high:NSDictionary = forecastObject["high"] as! NSDictionary;
        let highTemp:NSString = high["fahrenheit"] as! String;
        
        
         weatherImage.image = UIImage(data: data!);

        humidityLabel.text = String("The high temp for today will be \(highTemp) degrees.");
        
        dayInfo.text = String(condition);
        
        print(highTemp);

      
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
