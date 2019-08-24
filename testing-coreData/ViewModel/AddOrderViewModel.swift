//
//  AddOrderViewModel.swift
//  testing-coreData
//
//  Created by Diego Salazar Arp on 24-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SwiftUI

class AddOrderViewModel {
    var name: String = ""
    var type: String = ""
    
    
    func saveOrder() {
        CoreDataManager.share.saveOrder(name: self.name, type: self.type)
    }
}
