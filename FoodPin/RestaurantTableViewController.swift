//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Xiulan Shi on 1/23/16.
//  Copyright © 2016 Xiulan Shi. All rights reserved.
//

import UIKit
import CoreData

class RestaurantTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var fetchResultsController: NSFetchedResultsController!
    
    @IBAction func unwindToHomeScreen(segue: UIStoryboardSegue) {
        
    }
    
    var restaurants:[Restaurant] = []
    /*
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phoneNumber: "232-923423", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", phoneNumber: "348-233423", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "354-243523", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "453-333423", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", phoneNumber: "983-284334", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", phoneNumber: "232-434222", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", phoneNumber: "234-834322", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", phoneNumber: "982-434343", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "412-414 George St Sydney New South Wales", phoneNumber: "734-232323", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Shop 1 61 York St Sydney New South Wales", phoneNumber: "872-734343", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "95 1st Ave New York, NY 10003", phoneNumber: "343-233221", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", phoneNumber: "985-723623", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "445 Graham Ave Brooklyn, NY 11211", phoneNumber: "455-232345", image: "grahamavenuemeats.jpg", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "413 Graham Ave Brooklyn, NY 11211", phoneNumber: "434-232322", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "18 Bedford Ave Brooklyn, NY 11222", phoneNumber: "343-234553", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", phoneNumber: "342-455433", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", phoneNumber: "643-332323", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "54 Frith Street London W1D 4SL United Kingdom", phoneNumber: "542-343434", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "10 Seymour Place London W1H 7ND United Kingdom", phoneNumber: "722-232323", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "2 Regency Street London SW1P 4BZ United Kingdom", phoneNumber: "343-988834", image: "royaloak.jpg", isVisited: false),
        Restaurant(name: "Thai Cafe", type: "Thai", location: "22 Charlwood Street London SW1V 2DY Pimlico", phoneNumber: "432-344050", image: "thaicafe.jpg", isVisited: false)
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove the title of the back button
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //create NSFetchRequest object with the Restaurant entity
        let fetchRequest = NSFetchRequest(entityName: "Restaurant")
        
        // specify the sort order using NSSortDescriptor object, it descripted how the fetched objects are sorted
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            
            //creat fetch request, initialize a fetched result controller
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
            
            // specify its delegate for monitoring data changes
            fetchResultsController.delegate = self
            
            do { // call performFetch to execute the fetch request
                try fetchResultsController.performFetch()
                //get the restaurant object by access the fetchedObjects property, the property returns an array of anyobject, so we have to cast it to [Restaurant]
                restaurants = fetchResultsController.fetchedObjects as! [Restaurant]
            } catch {
                print(error)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
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
        return restaurants.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurants[indexPath.row].name
        cell.locationLabel.text = restaurants[indexPath.row].location
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.thumbnailImageView.image = UIImage(data: restaurants[indexPath.row].image!)
        
        if let isVisited = restaurants[indexPath.row].isVisited?.boolValue {
        cell.accessoryType = isVisited ? .Checkmark : .None
        }
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
//
//
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            restaurants.removeAtIndex(indexPath.row)
        }
        
//        tableView.reloadData()
        //use a better way
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
    }
    
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // Social Sharing Button
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            if let imageToShare = UIImage(data: self.restaurants[indexPath.row].image!) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        // Delete button
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete",handler: { (action, indexPath) -> Void in
            
            // Delete the row from the data source
            
            if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
                
                let restaurantToDelete = self.fetchResultsController.objectAtIndexPath(indexPath) as! Restaurant
                managedObjectContext.deleteObject(restaurantToDelete)
                
                do {
                    try managedObjectContext.save()
                } catch {
                    print(error)
                }
            }
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
                destinationController.restaurant = restaurants[indexPath.row]
            }
        
        }
    }
    
    // this method is called when the fetched results controller is about to start processing the content change
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    // when there is any content change inthe managed context, the second method is called.
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        // determin the type of operation and proceed with the corresponding operation
        switch type {
        case .Insert:
            if let _newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([_newIndexPath], withRowAnimation: .Fade)
            }
        case .Update:
            if let _indexPath = indexPath {
                tableView.reloadRowsAtIndexPaths([_indexPath], withRowAnimation: .Fade)
            }
        default:
            tableView.reloadData()
        }
        // because the objects are changed, we sync them with the restaurant array at the end of the method
        restaurants = controller.fetchedObjects as! [Restaurant]
    }// after the controller completes the change, it call didChange. It will tell the table view that we've completed the update and it will animate the change correspondingly.
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
   

}
