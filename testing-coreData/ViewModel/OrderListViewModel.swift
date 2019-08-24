//
//  OrderListViewModel.swift
//  testing-coreData
//
//  Created by Diego Salazar Arp on 24-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import SwiftUI

class OrderListViewModel: ObservableObject {
    @Published
    var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
        
    func deleteOrder(_ orderVM: OrderViewModel) {
        CoreDataManager.share.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
    
        func fetchAllOrders() {
            self.orders = CoreDataManager.share.getAllOrder().map(OrderViewModel.init)
            print(self.orders)
        }
        
    }


class OrderViewModel {
    
    var name: String = ""
    var type: String = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
}
