//
//  ViewController.swift
//  ClaCla_Art
//
//  Created by Ignácio Júnior on 08/09/23.
//

import UIKit
import SwiftUI
import CoreData

var nextSchedule: Job? = nil
var lastSale: Job? = nil
var saleListHome:[Job?] = []
var scheduleListHome:[Job?] = []

class ViewController: UIViewController {
    
    //MARK - Views
    @IBOutlet weak var scheduleView: UIView!
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var saleView: UIView!
    
    //MARK - Schedules
    @IBOutlet weak var imageSchedule: UIImageView!
    @IBOutlet weak var dateSchedule: UILabel!
    @IBOutlet weak var clientSchedule: UILabel!
    @IBOutlet weak var descriptionSchedule: UILabel!
    
    //MARK - Sales
    
    @IBOutlet weak var imageSale: UIImageView!
    @IBOutlet weak var valueSale: UILabel!
    @IBOutlet weak var clientSale: UILabel!
    @IBOutlet weak var descriptionSale: UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewDidLoad() {
        setupUI()
        insertDataHome()
    }
    
    func insertDataHome(){
        loadDataToHome()
        setValueToHome()
    }
    
    func setValueToHome(){
        setValueScheduleCell()
        setValueSaleCell()
        clearData()
    }
    
    func clearData(){
        nextSchedule = nil
        lastSale = nil
        saleListHome =  []
        scheduleListHome = []
    }
    
    func setValueScheduleCell(){
        if(nextSchedule != nil){
            imageSchedule.image = nextSchedule?.imagem
            dateSchedule.text  = nextSchedule?.deliveryDate
            clientSchedule.text = nextSchedule?.client
            descriptionSchedule.text = nextSchedule?.ilustrationAlias
        }else{
            imageSale.image = UIImage(named: "duda")
            valueSale.text  = "No schedule yet"
        }
    }
    
    func setValueSaleCell(){
        if(lastSale != nil){
            imageSale.image = lastSale?.imagem
            valueSale.text = lastSale?.valueRS.description
            clientSale.text =  lastSale?.client
            descriptionSale.text = lastSale?.ilustrationAlias
        }else{
            imageSale.image = UIImage(named: "simba")
            valueSale.text  = "No sale yet"
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let jobList = segue.destination as? ScheduleVC
        if(segue.identifier == "schedule"){
            jobList?.scheduleList = true
        }else if(segue.identifier == "sale"){
            jobList?.scheduleList = false
        }
    }
    
    func setupUI(){
        //view
        navigationItem.hidesBackButton = true
        bannerView.layer.cornerRadius = 10.0
        
        //Schedule
        scheduleView.layer.cornerRadius = 10.0
        imageSchedule.layer.cornerRadius = 20.0
        
        //Sale
        saleView.layer.cornerRadius = 10.0
        imageSale.layer.cornerRadius = 20.0
    }
    
    func loadDataToHome(){
        loadSchedule()
        loadSale()
    }
    
    func sortJob(_ schedule: Bool){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        if(schedule){
            scheduleListHome = scheduleListHome.sorted { dateFormatter.date(from: $0!.deliveryDate)! < dateFormatter.date(from: ($1?.deliveryDate)!)! }
        }else{
            saleListHome = saleListHome.sorted { dateFormatter.date(from: $0!.deliveryDate)! > dateFormatter.date(from: $1!.deliveryDate)! }
        }

    }
    
    func loadSchedule(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        do{
            
            let results:NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                let cell = result  as! Job
                if(cell.sales == false){
                    scheduleListHome.append(cell)
                }
            }
            sortJob(true)
            if(!scheduleListHome.isEmpty){
                nextSchedule = scheduleListHome[0]
            }
            print("schedule load is done")
        }catch{
            print("error in schedule load")
        }
    }
    
    func loadSale(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
        do{
            
            let results:NSArray = try context.fetch(request) as NSArray
            
            for result in results {
                let cell = result  as! Job
                if(cell.sales == true){
                    saleListHome.append(cell)
                }
            }
            sortJob(false)
            if(!saleListHome.isEmpty){
                lastSale = saleListHome[0]
            }
            print("sale load is done")
        }catch{
            print("error in sale load")
        }
    }
    
    
}

