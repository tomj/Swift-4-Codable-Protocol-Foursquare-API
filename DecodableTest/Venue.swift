//
//  File.swift
//  DecodableTest
//
//  Created by Joey Slomowitz on 4/10/17.
//  Copyright © 2017 Joey Slomowitz. All rights reserved.
//

import Foundation


/* JSON objects that are nested inside others MUST be parsed in the following format.  Failure to do so will result in a crash.  I recommend using the 'Postman' application to properly view the JSON.
 
 Declarations of the objects must also be spelled exactly as they appear in the JSON.  This will also result in a crash if not done properly.
 */

struct JSON: Decodable {
    let response: Response
}

struct Response: Decodable {
    let groups: [Groups]
}

struct Groups: Decodable {
    let items: [Items]
}

struct Items: Decodable {
    
    let venue: Venue?
    
}

struct Venue: Decodable {
    
    let id: String?
    let name: String?
    let contact: Contact?
    let location: Location?
    let categories: [Categories]?
    let price: Price?
    let rating: Double?
    let hours: Hours?
}

struct Tips: Decodable {
    let text: String?
}

struct Contact: Decodable {
    let phone: String?
    let formattedPhone: String?
}

struct Location: Decodable {
    
    let address: String?
    let crossStreet: String?
    let lat: Double?
    let lng: Double?
    let postalCode: String?
    let cc: String?
    let city: String?
    let state: String?
    let country: String?
    let distance: Double?
    
}

struct Categories: Decodable {
    let id: String?
    let name: String?
}

struct Price: Decodable {
    let message: String?
    let currency: String?
}

struct Hours: Decodable {
    let status: String?
    let isOpen: Bool?
}


