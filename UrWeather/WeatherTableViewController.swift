//
//  WeatherTableViewController.swift
//  UrWeather
//
//  Created by Cameron Mozie on 5/20/15.
//  Copyright (c) 2015 Cameron Mozie. All rights reserved.
//

import UIKit
import CoreLocation


class WeatherTableViewController: UITableViewController,CLLocationManagerDelegate {
    
    var forecastDay : NSArray!;
    var location: NSDictionary!;
    let locationManager = CLLocationManager();
    var imageArray: NSMutableArray!;
    var forecastObject:NSDictionary!;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userLocation = self.locationManager.location;
        imageArray = NSMutableArray();

       let latitude = userLocation!.coordinate.latitude;
       let longitude = userLocation!.coordinate.longitude;

        let locationManagerClass = LocationManager(theLongitude: latitude,theLatitude: longitude);
        locationManagerClass.startTrackingLocation();
        locationManagerClass.locationWithDetails();
        forecastDay = locationManagerClass.forecastDay
        self.navigationController?.navigationBar.topItem?.title = "CityStatehere...";
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return forecastDay.count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
    let cell = tableView.dequeueReusableCellWithIdentifier("WeatherCell", forIndexPath: indexPath) as UITableViewCell
        // Configure the cell...
         forecastObject = forecastDay[indexPath.row] as! NSDictionary;
        
        let conditions = forecastObject["conditions"] as! NSString as String;
        let date = forecastObject["date"] as! NSDictionary;
        let day = date["weekday"] as! NSString as String;
        let img = forecastObject["icon_url"] as! NSString as String;
        
        imageArray.addObject(img);
        print(imageArray);
   
        cell.textLabel!.text = day;
        cell.detailTextLabel!.text = conditions;
        return cell;
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let destinationVC:WeatherDetailViewController = segue.destinationViewController as! WeatherDetailViewController;
       
        let indexPath = tableView.indexPathForSelectedRow;
        
        destinationVC.forecastObject = forecastDay[indexPath!.row] as! NSDictionary;
        
        
        
        
    }


}
