//
//  ScheduleVC.swift
//  ClaCla_Art
//
//  Created by Ignácio Júnior on 13/09/23.
//

import UIKit
import CoreData
import SwiftUI

var jobs = [Job]()

class ScheduleVC: UIViewController {
   
    
    var scheduleList = true

    @IBOutlet weak var tableView: JobTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUISchedule()
        setDelegateOnClass()
        loadDataFromCoreData()
        
    }
    
    func setupUISchedule(){
        tableView.layer.cornerRadius = 5.0
    }
    
    func setDelegateOnClass(){
        tableView.delegate = self
        tableView.dataSource = self
    }

    func loadDataFromCoreData(){
        if(scheduleList){
            loadSchedule()
        }else{
            loadSale()
        }
        sortJob()
    }
    
    func sortJob(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        if(scheduleList){
             jobs = jobs.sorted { dateFormatter.date(from: $0.deliveryDate)! < dateFormatter.date(from: $1.deliveryDate)! }
        }else{
             jobs = jobs.sorted { dateFormatter.date(from: $0.deliveryDate)! > dateFormatter.date(from: $1.deliveryDate)! }
        }
    }
    
    func loadSchedule(){
        jobs = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        do{
            
            let results:NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                let cell = result  as! Job
                if(cell.sales == false){
                    jobs.append(cell)
                }
            }
            
            print("schedule load is done")
        }catch{
            print("error in schedule load")
        }
    }
    
    func loadSale(){
        jobs = []
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        do{
            
            let results:NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                let cell = result  as! Job
                if(cell.sales == true){
                    jobs.append(cell)
                }
            }
            
            print("sale load is done")
        }catch{
            print("error in sale load")
        }
    }
    
}

extension ScheduleVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let jobCustom = jobs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! JobCell
        
        cell.clienteName.text = jobCustom.client
        cell.descriptionIlustration.text = jobCustom.ilustrationAlias
        cell.valueIlustration.text = String(jobCustom.valueRS)
        cell.deliveryIlustration.text = jobCustom.deliveryDate
        cell.typeIlustration.text = jobCustom.type
        cell.imageViewCellJob.image = jobCustom.imagem
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            
            tableView.beginUpdates()
            deleteJobCell(indexPath.row)
            jobs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            callHomeViewController()
            
        }
    }
    
    func callHomeViewController(){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController")
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func deleteJobCell(_ index: Int){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        _ = NSEntityDescription.entity(forEntityName: "Job", in: context)
        
        do{
            context.delete(jobs[index])
            try context.save()
            print("deleted")
        }catch{
            print("error delete")
        }
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "editJob"){
            let jobDetail = segue.destination as? NewJobViewController
            let indexCell = tableView.indexPathForSelectedRow![1]
            let selectedCell : Job!
            selectedCell = jobs[indexCell]
            jobDetail!.selectedJob = selectedCell
        }
    }
}
