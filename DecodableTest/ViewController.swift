//
//  ViewController.swift
//  DecodableTest
//
//  Created by Joey Slomowitz on 4/10/17.
//  Copyright © 2017 Joey Slomowitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vegeSlot: UITableView!
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        /* Replace "MY_CLIENT_ID" and "MY_CLIENT_SECRET"  your unique foursquare Client ID and Client Secret into the URL.

         This is the very best endpoint I found for returning nearby vegan restaurants but there are many others for other types of results.
         Refer to https://developer.foursquare.com
         */
        
        guard let url = URL(string: "https://api.foursquare.com/v2/venues/explore?client_id=MY_CLIENT_ID&client_secret=MY_CLIENT_SECRET&v=20170503&query=vegan&venuePhotos=1&limit=13&ll=40.7183,-73.9584&radius=3000") else { return }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                
                let jsonStuff = try JSONDecoder().decode(JSON.self, from: data)
                
                let groups = jsonStuff.response.groups
                for group in groups {
                    let items = group.items
                    for item in items {
                        let venues = item.venue
                        if let venue = venues {
                            print(venue.name!)
                        }
                    }
                }
            } catch {
                print(error, error.localizedDescription, "JSON processing failed")
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

