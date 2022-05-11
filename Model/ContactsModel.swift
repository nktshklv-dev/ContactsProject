//
//  ContactsModel.swift
//  contacts (practice #2)
//
//  Created by Nikita  on 5/11/22.
//

import Foundation

protocol ContactProtocol{
    var contactName: String {get set}
    var contactPhoneNumber: String {get set}
}

class Contact: ContactProtocol{
    var contactName: String
    
    var contactPhoneNumber: String
    
    init(name: String, phone: String){
        contactName = name
        contactPhoneNumber = phone
    }
    
    
}
