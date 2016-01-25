//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Xiulan Shi on 1/23/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
        "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
        
    var restaurantIsVisited = [Bool] (count: 21, repeatedValue: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
            
//        cell.thumbnailImageView.layer.cornerRadius = 30.0
//        cell.thumbnailImageView.clipsToBounds = true    //these two lines of code can make circular image ---method 2 via interface builder
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        
//        if restaurantIsVisited[indexPath.row]{
//            cell.accessoryType = .Checkmark
//        } else {
//            cell.accessoryType = .None
//        }
        //Use ternary conditional operator (?:). It's an efficiant shorthand for evaluating simple condition
        
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .Checkmark : .None

        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        // Create an option menu as an action sheet
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        // Add actions to the menu
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//
//        
//        let callActionHandler = {(action:UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//    }
//    
//        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//        
//        
////        let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: {
////            (action:UIAlertAction!) -> Void in
////            
////            let cell = tableView.cellForRowAtIndexPath(indexPath)
////            cell?.accessoryType = .Checkmark
////            self.restaurantIsVisited[indexPath.row] = true
////        })
////        
////        optionMenu.addAction(isVisitedAction)
//        
//        let isVisitedTitle = (restaurantIsVisited[indexPath.row]) ? "I've not been here" : "I've been here"
//        let isVisitedAction = UIAlertAction(title: isVisitedTitle, style: .Default, handler: {
//        (action:UIAlertAction!) -> Void in
//        
//        let cell = tableView.cellForRowAtIndexPath(indexPath)
//        self.restaurantIsVisited[indexPath.row] = (self.restaurantIsVisited[indexPath.row]) ? false : true
//        cell?.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .Checkmark : .None
//        })
//        optionMenu.addAction(isVisitedAction)
//    
//
//    // Display the menu
//    self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//    tableView.deselectRowAtIndexPath(indexPath, animated: false)
//}
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    // Override to support editing the table view.
//    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            // Delete the row from the data source
//            restaurantNames.removeAtIndex(indexPath.row)
//            restaurantLocations.removeAtIndex(indexPath.row)
//            restaurantTypes.removeAtIndex(indexPath.row)
//            restaurantIsVisited.removeAtIndex(indexPath.row)
//            restaurantImages.removeAtIndex(indexPath.row)
//        }
//        
////        tableView.reloadData()
//        //use a better way
//        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        
//        print("Total item: \(restaurantNames.count)")
//        for name in restaurantNames {
//            print(name)
//        }
//    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            self.restaurantNames.removeAtIndex(indexPath.row)
            self.restaurantLocations.removeAtIndex(indexPath.row)
            self.restaurantTypes.removeAtIndex(indexPath.row)
            self.restaurantIsVisited.removeAtIndex(indexPath.row)
            self.restaurantImages.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        // Set the button color
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
       
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // used to check the segue identifier
        if segue.identifier == "ShowRestaurantDetail" {
            
            // first retrieve the selected row by accessing tableview.indexPathForSelectedRow. the indexPath should contain the selected cell.
            if let indexPath = tableView.indexPathForSelectedRow {
                
                // Get the new view controller using segue.destinationViewController. we have to downcasting using as! here
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                
                // Pass the selected object to the new view controller.
                destinationController.restaurantImage = restaurantImages[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
                destinationController.restaurantType = restaurantTypes[indexPath.row]
            }
        
        }
    }
   

}
