//
//  PopOverController.swift
//  basic-ar-app
//
//  Created by Marco Vazquez on 6/7/19.
//  Copyright © 2019 Marco Vazquez. All rights reserved.
//

import UIKit

class PopOverController: UITableViewController {
    
    var didTap: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

extension PopOverController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.modelList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ObjectCell", for: indexPath) as! ObjectCell
        let models = Constants.modelList[indexPath.row]
        cell.photo.image = UIImage(named: models.icon)
        cell.model.text = models.name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTap?(Constants.modelList[indexPath.row].location)
        self.dismiss(animated: true, completion: nil)
    }
}

class ObjectCell: UITableViewCell {
    @IBOutlet var photo: UIImageView!
    @IBOutlet var model: UILabel!
}
