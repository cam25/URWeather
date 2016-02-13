//
//  LocationManager.swift
//  UrWeather
//
//  Created by Cameron Mozie on 2/5/16.
//  Copyright © 2016 Cameron Mozie. All rights reserved.
//

import UIKit
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate{
    
let locationManager = CLLocationManager();
let apiKey: NSString = "8a277e134bd305b3";
var clatitude: Double
var cLongitude: Double
var geoLookupData: NSDictionary?;
var weatherArray: NSArray!;
var forecastDay : NSArray!;
var city : String!;
    
    init ( theLongitude: double_t,  theLatitude: double_t)  {
        
        cLongitude = theLongitude;
        clatitude = theLatitude
        
    }

    func startTrackingLocation () {
        
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        locationManager.requestAlwaysAuthorization();
        locationManager.startUpdatingLocation();
    }
    
    func locationWithDetails () {
        
        let getZipcode:NSURL = NSURL(string: "https://api.wunderground.com/api/\(apiKey)/forecast/q/\(self.cLongitude),\(self.clatitude).json")!;
        
        print(cLongitude)
        print(clatitude)
        let zipcodeData = NSData(contentsOfURL: getZipcode);
        
        do {
            geoLookupData = try NSJSONSerialization.JSONObjectWithData(zipcodeData!, options: NSJSONReadingOptions()) as? NSDictionary
            let location : NSDictionary = geoLookupData!.objectForKey("forecast") as! NSDictionary;
            print("GeoLookup data = \(location)");
            
            let simpleForecast : NSDictionary = location["simpleforecast"] as! NSDictionary;
            forecastDay = simpleForecast["forecastday"] as! NSArray;

            
        } catch let jsonError {
            
            print(jsonError);
            
        }
    
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationArray:NSArray = locations;
        
        let locationObject = locationArray[0] as! CLLocation;
        print("\(locationObject)")
        
    }

}
