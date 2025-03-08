//
//  ContentView.swift
//  Travel
//
//  Created by Paul F on 06/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //Paso 1.1
            Home()
                .edgesIgnoringSafeArea(.top)
        }
    }
}

#Preview {
    ContentView()
}
