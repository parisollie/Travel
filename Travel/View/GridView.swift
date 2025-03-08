//
//  Grid.swift
//  Travel
//
//  Created by Paul F on 07/03/25.
//
import SwiftUI

struct GridView: View {
    // Propiedades necesarias
    var columns: [GridItem]
    var data: [Travel]
    @Binding var show: Bool
    @Binding var selected: Travel
    @Binding var loadView: Bool
    //Paso 1.16
    var namespace: Namespace.ID
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 25) {
            // Paso 1.10
            ForEach(data) { travel in
                VStack(alignment: .leading, spacing: 10) {
                    // Paso 1.11
                    Image(travel.image)
                        .resizable()
                        .frame(height: 180)
                        .cornerRadius(15)
                        //Paso 1.15 assigning ID..
                        .onTapGesture {
                            withAnimation(.spring()) {
                                show.toggle()
                                selected = travel
                                //Paso 1.25
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    loadView.toggle()
                                }
                            }
                        }
                        .matchedGeometryEffect(id: travel.id, in: namespace)
                    
                    // Paso 1.12, El nombre de los países
                    Text(travel.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
        }
        .padding([.horizontal, .bottom])
    }
}


#Preview {
    // Crear un estado de prueba para las propiedades @Binding
    @State var show = false
    @State var selected = data[0] // Selecciona el primer elemento de los datos
    @State var loadView = false
    @Namespace var namespace
    
    return GridView(
        columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), // 2 columnas
        data: data, // Tus datos de prueba
        show: $show, // Estado de prueba para show
        selected: $selected, // Estado de prueba para selected
        loadView: $loadView, // Estado de prueba para loadView
        namespace: namespace // Namespace de prueba
    )
}
