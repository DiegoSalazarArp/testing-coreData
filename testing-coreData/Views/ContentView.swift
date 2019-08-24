//
//  ContentView.swift
//  testing-coreData
//
//  Created by Diego Salazar Arp on 24-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var orderListVM: OrderListViewModel
    @State  private var isPresented: Bool = false
 
    
    init() {
        
        self.orderListVM = OrderListViewModel()
        
    }
    private func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let orderVM = self.orderListVM.orders[index]
            self.orderListVM.deleteOrder(orderVM)
            
        }
    }
    
    var body: some View {
        
        NavigationView {
        List {
            ForEach(self.orderListVM.orders, id: \.name) { order in
                HStack {
                    Image(order.type)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                    Text(order.name)
                        .font(.largeTitle)
                        .padding([.leading], 10)
                    
                }
                
            }.onDelete(perform: delete)
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            print("Ondismiss")
            self.orderListVM.fetchAllOrders()
        }, content:  {
            AddOrderView(isPresented: self.$isPresented)
        })
        .navigationBarTitle("Pedidos")
        .navigationBarItems(trailing: Button("Agregar nuevo pedido") {
            self.isPresented = true
            
        })
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
