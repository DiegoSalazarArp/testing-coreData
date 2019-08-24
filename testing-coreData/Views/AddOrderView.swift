//
//  AddOrderView.swift
//  testing-coreData
//
//  Created by Diego Salazar Arp on 24-08-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct AddOrderView: View {
    @Binding var isPresented: Bool
    @State var addOrderVM = AddOrderViewModel()
    
    var body: some View {
        NavigationView {
            Group {
                
                VStack{
                    TextField("Ingrese nombre", text: $addOrderVM.name)
                    
                    Picker(selection: self.$addOrderVM.type, label: Text(""))
                    {
                        Text("Cappuccino").tag("cap")
                        Text("Regular").tag("reg")
                        Text("Expresso").tag("exp")
                    }.pickerStyle(SegmentedPickerStyle())
                    Button("Confirmar pedido") {
                        self.addOrderVM.saveOrder()
                        //self.isPresented = false
                    }.padding(8)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }.padding()
            .navigationBarTitle("Tipos de Cafes")
        }
        
    }
}

#if DEBUG
struct AddOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddOrderView(isPresented: .constant(false))
    }
}
#endif
