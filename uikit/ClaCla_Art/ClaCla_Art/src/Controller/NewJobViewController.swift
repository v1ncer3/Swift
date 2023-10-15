//
//  NewJobViewController.swift
//  ClaCla_Art
//
//  Created by Ignácio Júnior on 10/09/23.
//

import UIKit
import CoreData

class NewJobViewController: UIViewController{
    
    @IBOutlet weak var uuidIlustration: UITextField!
    @IBOutlet weak var valueIlustration: UITextField!
    @IBOutlet weak var typeIlustration: UITextField!
    @IBOutlet weak var clientName: UITextField!
    @IBOutlet weak var descriptionIlustration: UITextField!
    @IBOutlet weak var newJobView: UIView!
    @IBOutlet weak var imageViewJob: UIImageView!
    @IBOutlet weak var deliveryDate: UITextField!
    @IBOutlet weak var sale: UISwitch!
    var selectedJob: Job? = nil
    private var  datePicker: UIDatePicker?
    
    //var dateWasChanged = false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIJobDetails()
        addGestureKeyboard()
        tapgastureImage()
        inputTextFieldWithDatePicker()
        if(selectedJob != nil){
            insertSelectedJob()
        }
    }
    
    func insertSelectedJob(){
        clientName.text = selectedJob?.client
        uuidIlustration.text = selectedJob?.id?.uuidString
        valueIlustration.text = selectedJob?.valueRS.description
        typeIlustration.text = selectedJob?.type
        imageViewJob.image = selectedJob?.imagem
        descriptionIlustration.text = selectedJob?.ilustrationAlias
        deliveryDate.text = selectedJob?.deliveryDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        datePicker?.setDate(dateFormatter.date(from: deliveryDate.text!)!, animated:  true)
        sale.setOn(selectedJob?.sales ?? true, animated: true)
    }
    
    func tapgastureImage(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        imageViewJob.isUserInteractionEnabled = true
        imageViewJob.addGestureRecognizer(tap)
    }
    
    func inputTextFieldWithDatePicker(){
        datePicker = createDatePickerDateMode()
        datePicker?.addTarget(self, action: #selector(dateChanged(datePicker:)), for:  .valueChanged)
        
        let tappedGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(gestureRecognizer: )))
        view.addGestureRecognizer(tappedGesture)
        deliveryDate.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        if(deliveryDate.text! == "" && deliveryDate.isEditing){
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy/MM/dd"
            deliveryDate.text = formatter.string(from: datePicker!.date)
        }
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        deliveryDate.text = formatter.string(from: datePicker.date)
    }
    
    func createDatePickerDateMode() -> UIDatePicker{
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }
    
    @objc func imageTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func setupUIJobDetails(){
        newJobView.layer.cornerRadius = 5.0
        
        imageViewJob.layer.borderWidth =  1
        imageViewJob.layer.borderColor =  UIColor.black.cgColor
        imageViewJob.layer.masksToBounds =  false
        imageViewJob.layer.cornerRadius =  imageViewJob.frame.size.height/2
        imageViewJob.clipsToBounds = true
    }
    
    func addGestureKeyboard(){
        let  tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
            view.endEditing(true)
        }
    
    @IBAction func save(_ sender: Any) {
        let formIsValid = validateForm()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") 
        
        
        if(formIsValid){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            if(selectedJob == nil) {
                let entity = NSEntityDescription.entity(forEntityName: "Job", in: context)
                
                let newJob = Job(entity: entity!, insertInto: context)
                
                newJob.id = UUID()
                newJob.client = clientName.text
                newJob.ilustrationAlias = descriptionIlustration.text
                newJob.deliveryDate = deliveryDate.text
                newJob.type = typeIlustration.text
                newJob.valueRS = Double(valueIlustration.text!)!
                newJob.imagem = imageViewJob.image!
                newJob.sales = sale.isOn
                
                do{
                    try  context.save()
                    self.navigationController?.pushViewController(nextViewController, animated: true)
                    print("saved")
                }catch{
                    print(error.localizedDescription)
                }
            }else{
                let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Job")
                do{
                    let results:NSArray = try context.fetch(request) as NSArray
                    for result in results {
                        let cell = result  as! Job
                        if(cell == selectedJob){
                            
                            cell.id = UUID()
                            cell.client = clientName.text
                            cell.ilustrationAlias = descriptionIlustration.text
                            cell.deliveryDate = deliveryDate.text
                            cell.type = typeIlustration.text
                            cell.valueRS = Double(valueIlustration.text!)!
                            cell.imagem = imageViewJob.image!
                            cell.sales = sale.isOn
                            
                            try context.save()
                            
                            self.navigationController?.pushViewController(nextViewController, animated: true)
                        }
                    }
                    print("data load is done")
                }catch{
                    print("error in data load")
                }
            }
        }
        
    }
    
    func validateForm() -> Bool{
        print(validatePrice() ,
              validateDate() ,
              validateType() ,
              validatePrice(),
              validateClient() ,
              validateDescription())
        
        if(validatePrice() &&
           validateDate() &&
           validateType() &&
           validatePrice() &&
           validateClient() &&
           validateDescription()){
            return true
        }
        
        return false
    }
    
    func validateClient() -> Bool{
        if(clientName.text! != ""){
            return true
        }
        clientName.placeholder = "This field is required"
        return false
    }
    
    func validateDescription() -> Bool{
        if(descriptionIlustration.text! != ""){
            return true
        }
        descriptionIlustration.placeholder = "This field is required"
        return false
    }
    
    func validateType() -> Bool{
        if(typeIlustration.text! != ""){
            return true
        }
        typeIlustration.placeholder = "This field is required"
        return false
    }
    
    func validateDate() -> Bool{
        if(deliveryDate.text! != ""){
            return true
        }
        deliveryDate.placeholder = "This field is required"
        return false
    }
    
    func validatePrice() -> Bool{
        
        let strVal = valueIlustration.text!
        
            
            if(strVal != ""){
                let strInvalid = strVal.firstIndex(of: ",")
                
                    self.valueIlustration.text = strVal.replacingOccurrences(of: ",", with: ".")
                    return true
                
            }
            
            valueIlustration.placeholder = "This field is required"
            return false
        }
    
    
}

extension NewJobViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageViewJob.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}
