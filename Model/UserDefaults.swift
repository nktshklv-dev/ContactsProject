//
//  UserDefaults.swift
//  contacts (practice #2)
//
//  Created by Nikita  on 5/11/22.
//

import Foundation


protocol SaveContactProtocol{
    func save(contacts: [ContactProtocol])
    func load() -> [ContactProtocol]
}

class SaveConact: SaveContactProtocol{
  
    
    var storage = UserDefaults.standard
    var storageKey = "StorageKey"
    enum contactOption: String{
        case name
        case phone
    }

    func save(contacts: [ContactProtocol]) {
        var arrayForStorage: [[String: String]] = [[:]]
        contacts.forEach{
            contact in var contactDict: Dictionary<String, String> = [:]
            contactDict[contactOption.name.rawValue] = contact.contactName
            contactDict[contactOption.phone.rawValue] = contact.contactPhoneNumber
            arrayForStorage.append(contactDict)
        }
        storage.set(arrayForStorage, forKey: storageKey)
    }
    
    func load() -> [ContactProtocol] {
        var arrayContacts: [ContactProtocol] = []
        let arrayFromStorage = storage.array(forKey: storageKey) as? [[String: String]] ?? []
        
        for contact in arrayFromStorage{
            guard let name = contact[contactOption.name.rawValue],
                  let phone = contact[contactOption.phone.rawValue]
            else{
                continue
            }
            arrayContacts.append(Contact(name: name, phone: phone))
        }
        return arrayContacts
        
    }
    
    
}
