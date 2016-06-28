//
//  ViewController.swift
//  Nidastore
//
//  Created by Nicolás Gebauer on 20-06-16.
//  Copyright © 2016 Nicolás Gebauer. All rights reserved.
//

import UIKit
import Alamofire

struct Product {
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var products = [Product]()
    
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table.delegate = self
        table.dataSource = self
        
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        let username = "admin"
        let password = "admin"
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        let header = ["Authorization": "Basic \(base64LoginString)"]
        
        Alamofire.request(.GET, "https://nidastore.herokuapp.com/api/v1/products", headers: header)
            .response { (_, response, data, error) in
                var products = [Product]()
                print(response)
                print(data)
                let jsonSwift: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)
                
                if let jsonArray = jsonSwift as? NSArray {
                    for json in jsonArray {
                        if let id = json["id"] as? String {
                            products.append(Product(name: id.stringByReplacingOccurrencesOfString("http://nidastore.herokuapp.com/api/v1/products/", withString: "")))
                        }
                    }
                }
                
                self.showData(products)
        }
    }
    
    func showData(products: [Product]) {
        self.products = products.sort({ $0.name > $1.name })
        table.reloadData()
    }
    
    // MARK: - UITableViewDelegate methods
    
    /* To react to a row selection
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
     tableView.deselectRowAtIndexPath(indexPath, animated: false)
     }
     */
    
    /* To determine if a cell can be edited
     func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     return false
     }
     */
    
    /* To manage the edition of a cell
     func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     // tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     
     }
     */
    
    /* To support rearranging the table view.
     func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /* To support conditional rearranging of the table view.
     func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return NO if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /* To have more editing options in a cell swipe
     func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
     return nil
     }
     */
    
    // MARK: - UITableViewDataSource methods
    
    /* To return custom number of sections.
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     return 0
     }
     */
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
     }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        cell.textLabel?.text = products[indexPath.row].name
        return cell
     }
    
    /* To return custom height for row
     func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
     return 60
     }
     */
    
    /* To return custom title for section header
     func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     return "Title"
     }
     */
    
    /* To return custom title for section footer
     func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
     return "Footer"
     }
     */
    
    /* To return custom height for section header
     func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
     return 30
     }
     */
    
    /* To return custom height for section footer
     func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
     return 0
     }
     */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
