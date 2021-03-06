//
//  ViewController.swift
//  OurLadyHope
//
//  Created by Tan Do  on 3/24/18.
//  Copyright © 2018 Tan Do . All rights reserved.
//

import UIKit
import SDWebImage
import CoreLocation
import Alamofire
import SwiftyJSON
class ViewController: UIViewController, CLLocationManagerDelegate {
    var strPhoneNumber = "9098846375"
    //Constants
    let imgUrl = "https://raw.githubusercontent.com/tando89/myImagesLinks/master/ChurchImg.jpg"
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let APP_ID = "0394de9290396bfaf54d7ebe471cbd00"
    let locationManager = CLLocationManager()
    //weather data model object
    let weatherDataModel = WeatherDataModel()
    @IBOutlet weak var heroImg: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureCondition: UILabel!
    @IBOutlet weak var mAddress: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayHeroImage()
        copyText()
        
        //TODO:Set up the location manager here.
        locationManager.delegate = self
        //accuracy
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        //ask for permission
        locationManager.requestWhenInUseAuthorization()
        //get the gps location
        locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: - Networking
    /***************************************************************/
    func getWeatherData (url: String, parameters: [String : String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess {
                print("Success!")
                
                let weatherJSON : JSON = JSON(response.result.value!)
                
                print(weatherJSON)
                self.updateWeatherData(json: weatherJSON)
            } else {
                //print("Error \(response.result.error)")
                self.cityLabel.text = "Connection Errors"
            }
        }
    }
    //MARK: - JSON Parsing
    /***************************************************************/
    func updateWeatherData(json: JSON) {
        if let tempResult = json ["main"] ["temp"].double {
            weatherDataModel.tempurature = Int((tempResult - 273.15) * (9 / 5)  + 32)
            weatherDataModel.city = json["name"].stringValue
            //weatherDataModel.condition = json["weather"][0]["id"].intValue
            //weatherDataModel.weatherIconName = weatherDataModel.updateWeatherIcon(condition: weatherDataModel.condition)
            weatherDataModel.weatherDescription = json["weather"][0]["description"].stringValue
            updateUIWithWeatherData()
            
        } else {
            cityLabel.text = "Weather Unavailable"
        }
    }
    
    
    func updateUIWithWeatherData() {
        cityLabel.text = weatherDataModel.city
        temperatureLabel.text = "\(weatherDataModel.tempurature)°F"
        temperatureCondition.text = weatherDataModel.weatherDescription
        //weatherIcon.image = UIImage(named: weatherDataModel.weatherIconName)
    }
    //didUpdateLocations method when the location manager has found the location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count - 1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
            
            print("longtitude = \(location.coordinate.longitude), latitude = \(location.coordinate.latitude)")
            
            let latitude = String(location.coordinate.latitude)
            let longtitude = String(location.coordinate.longitude)
            
            let params : [String : String] = ["lat" : latitude, "lon" : longtitude, "appid" : APP_ID]
            
            getWeatherData(url : WEATHER_URL, parameters: params)
        }
    }    //didFailWithError method unable to retrieve location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        cityLabel.text = "Location Unavailable"
    }
    //display hero image
    func displayHeroImage(){
        heroImg.sd_setImage(with: URL(string: imgUrl) , placeholderImage: UIImage(named: "loadingImage.png"))
    }
    
    //make textField copiable
    func copyText() {
        mAddress.delegate = self
        mAddress.inputView = UIView() //prevent soft keyboard pops up
        mAddress.tintColor = .clear //prevent cursor pops up
    }
    
    @IBAction func mPhoneCall(_ sender: Any) {
        
        if let phoneCallURL:URL = URL(string: "tel:\(strPhoneNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                let alertController = UIAlertController(title: "Our Lady Of Hope", message: "Press Yes if you want to call our office \n (909) 884-6375?", preferredStyle: .alert)
                let yesPressed = UIAlertAction(title: "Yes", style: .default, handler: { (action) in
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                })
                let noPressed = UIAlertAction(title: "No", style: .default, handler: { (action) in
                    
                })
                alertController.addAction(yesPressed)
                alertController.addAction(noPressed)
                present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false //prevent editting
    }
}
