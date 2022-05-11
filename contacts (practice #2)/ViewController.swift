//
//  ViewController.swift
//  contacts (practice #2)
//
//  Created by Nikita  on 5/11/22.
//

import UIKit

class ViewController: UIViewController {
    public var contacts: [ContactProtocol] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        contacts.append(Contact(name: "Grisha", phone:  "+3333333"))
        
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "MyCell"){
            cell = reusedCell
        }
        else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        updateContactCell(cell: &cell, indexPath: indexPath)
        return cell
    }
    
    func updateContactCell(cell: inout UITableViewCell, indexPath: IndexPath){
        var config = cell.defaultContentConfiguration()
        config.text = contacts[indexPath.row].contactName
        config.secondaryText = contacts[indexPath.row].contactPhoneNumber
        cell.contentConfiguration = config
    }
    
    
}

