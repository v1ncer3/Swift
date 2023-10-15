//
//  ViewController.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 13/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viagensTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraTableView()
        view.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
    
    func configuraTableView(){
        viagensTableView.register(UINib(nibName: "TripTableViewCell", bundle: nil), forCellReuseIdentifier: "TripTableViewCell")
        
        viagensTableView.dataSource = self
        viagensTableView.delegate = self
        viagensTableView.backgroundColor = UIColor(red: 30.0/255.0, green: 59.0/255.0, blue: 119.0/255.0, alpha: 1)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sessaoDeViagens?[section].numeroDeLinhas ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TripTableViewCell") as? TripTableViewCell else {
            fatalError("error to create trip tableviewcall")
        }
        
        let viewModel = sessaoDeViagens?[indexPath.section]
        
        switch viewModel?.tipo{
        case .destaques:
            cell.configuration(viewModel?.viagens[indexPath.row])
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HomeTableViewHeader", owner: self, options: nil)?.first as? HomeTableViewHeader
        headerView?.configuraView()
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 400 : 500
    }
}
