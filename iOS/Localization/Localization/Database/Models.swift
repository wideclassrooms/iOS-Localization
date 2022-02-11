//
//  AppData.swift
//  NDHM_HealthRecords
//
//  Created by Naveen Chauhan on 19/01/22.
//

import UIKit
import RealmSwift

// [START - DATABASE MODELS]
class LanguageVersion: Object {
        
        override static func primaryKey() -> String? {
            return "id"
        }
    
    @Persisted var id:String = UUID().uuidString
    @Persisted var name:String
    @Persisted var code:String?
    @Persisted var version : String
    @Persisted var addedOn : Date
    @Persisted var status : Int
}

class LanguageData: Object {
        
        override static func primaryKey() -> String? {
            return "id"
        }
    
    @Persisted var id:String = UUID().uuidString
    @Persisted var langVersion:String
    @Persisted var data:Data?
    @Persisted var addedOn : Date
    @Persisted var status : Int
}

class NonLocalized:Object {
    override static func primaryKey() -> String? {
        return "id"
    }

    @Persisted var id:String = UUID().uuidString
    @Persisted var screenCode:String
    @Persisted var alertCode:String?
    @Persisted var text:String
    @Persisted var addedOn : Date
    @Persisted var langVersion:String
    @Persisted var status : Int
    
}

// [END - DATABASE LAYER]

// [START APP MODELS]
struct Languages: Codable{
    let data : [Language]
    
}

struct Language : Codable {
    
    let name : String?
    let code : String?
    let version : String?
    
    

    enum CodingKeys: String, CodingKey {

       
        case name = "name"
        case code = "code"
        case version = "ver"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try values.decodeIfPresent(String.self, forKey: .name)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        version = try values.decodeIfPresent(String.self, forKey: .version)
        
    }

}

// [END APP MODELS]
