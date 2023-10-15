//
//  TripTableViewCell.swift
//  AluraViagens
//
//  Created by Ignácio Júnior on 23/08/23.
//

import UIKit

class TripTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet weak var backgroundViewCell: UIView!
    @IBOutlet weak var viagemImage: UIImageView!
    @IBOutlet weak var tituloViagemLabel: UILabel!
    @IBOutlet weak var subtituloViagemLabel: UILabel!
    @IBOutlet weak var diariaViagemLabel: UILabel!
    @IBOutlet weak var precoSemDescontoViagemLabel: UILabel!
    @IBOutlet weak var precoComDescontoLabel: UILabel!
    @IBOutlet weak var statusCancelamentoViagemLabel: UILabel!
    
    
    func configuration(_ viagem: Viagem?){
        viagemImage.image = UIImage(named: viagem?.asset ?? "")
        tituloViagemLabel.text = viagem?.titulo
        subtituloViagemLabel.text = viagem?.subtitulo
        precoComDescontoLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        //efeito risco
        let atributoString: NSMutableAttributedString = NSMutableAttributedString(string: "R$ \(viagem?.precoSemDesconto ?? 0)")
        
        atributoString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, atributoString.length))
        precoSemDescontoViagemLabel.attributedText = atributoString
        //fim
        
        
        if let numeroDias = viagem?.diaria, let numeroHospedes = viagem?.hospedes{
            let diarias = numeroDias == 1 ? "Diária" : "Diárias"
            let hospedes = numeroHospedes == 1 ? "Pessoa" : "Pessoas"
            
            diariaViagemLabel.text = "\(numeroDias) \(diarias) - \(numeroHospedes) \(hospedes)"
        }
        
        DispatchQueue.main.async{
            self.backgroundViewCell.addSombra()
        }
    }
}
