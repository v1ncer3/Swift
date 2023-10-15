//
//  Job.swift
//  ClaCla_Art
//
//  Created by Ignácio Júnior on 11/09/23.
//

import CoreData
import UIKit

@objc(Job)

class Job: NSManagedObject{
    @NSManaged var id: UUID!
    @NSManaged var client: String!
    @NSManaged var ilustrationAlias: String!
    @NSManaged var deliveryDate: String!
    @NSManaged var type: String!
    @NSManaged var valueRS: Double
    @NSManaged var imagem: UIImage
    @NSManaged var sales: Bool
    
}
