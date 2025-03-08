//
//  Home.swift
//  Travel
//
//  Created by Paul F on 06/03/25.
//


import SwiftUI

struct Home: View {
    //Paso 1.8
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    //Paso 1.14
    @State var selected: Travel = data[0]
    @State var show = false
    @Namespace var namespace
    //Paso 1.25 to load Hero View After Animation is done....
    @State var loadView = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Paso 1.2
                HStack {
                    
                    Text("Travel")
                        .font(.system(size: 35, weight: .bold))
                        .foregroundColor(.black)
                    
                    Spacer()
               
                    
                    // Paso 1.4
                    Button(action: {}) {
                        
                        Image("menu")
                            .renderingMode(.original)
                    }
                    
                    
                }
                
                //Paso 1.6  due to top area is ignored...
                .padding([.horizontal, .top])
                
                // Paso 1.9 - Usar la nueva vista TravelGridView
                GridView(
                    columns: columns,
                    data: data,
                    show: $show,
                    selected: $selected,
                    loadView: $loadView,
                    namespace: namespace
                )
            }
            // Paso 1.5 - Actualizado para iOS 15+
            .padding(.top, safeAreaTop())
            
            //Paso 1.17 Country View....
            
            if show {
                
                VStack {
                    //Paso 1.20
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        //Paso 1.18
                        Image(selected.image)
                            .resizable()
                            .frame(height: 300)
                            .matchedGeometryEffect(id: selected.id, in: namespace)
                        //Paso 1.27
                        if loadView {
                            //Paso 1.21
                            HStack {
                                
                                Button {
                                    //Paso 1.26
                                    loadView.toggle()
                                    
                                    withAnimation(.spring()) {
                                        
                                        show.toggle()
                                    }
                                    
                                } label: {
                                    //Paso 1.22
                                    Image(systemName: "xmark")
                                        .foregroundColor(.white)
                                        .padding()
                                        .background(Color.black.opacity(0.5))
                                        .clipShape(Circle())
                                }
                                
                                Spacer()
                                
                                //Paso 1.23
                                Button {
            
                                } label: {
                                    
                                    Image(systemName: "suit.heart.fill")
                                        .foregroundColor(.red)
                                        .padding()
                                        .background(Color.white)
                                        .clipShape(Circle())
                                }
                            }
                            //Paso 1.24
                            .padding(.top, 35)
                            .padding(.horizontal)
                            
                        }
                    }
                    
                    // you will get this warning because we didn't hide the old view so don't worry about that it will work fine...
                    
                    //Paso 1.29 Detail View....
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        //Paso 1.34 loading after animation completes...
                        if loadView {
                            
                            VStack {
                                
                                HStack {
                                    //Paso 1.30
                                    Text(selected.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                //Paso 1.31
                                .padding(.top)
                                .padding(.horizontal)
                                
                                //Paso 1.32 some sample text...
                                
                                Text("SwiftUI is an innovative, exceptionally simple way to build user interfaces across all Apple platforms with the power of Swift. Build user interfaces for any Apple device using just one set of tools and APIs. With a declarative Swift syntax that’s easy to read and natural to write, SwiftUI works seamlessly with new Xcode design tools to keep your code and design perfectly in sync. Automatic support for Dynamic Type, Dark Mode, localization, and accessibility means your first line of SwiftUI code is already the most powerful UI code you’ve ever written.")
                                    .multilineTextAlignment(.leading)
                                    .padding(.top)
                                    .padding(.horizontal)
                                //Paso 1.33
                                HStack {
                                    
                                    Text("Reviews")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                //Paso 1.35
                                HStack(spacing: 0) {
                                    //Paso 1.36
                                    ForEach(1...5, id: \.self) { i in
                                        
                                        Image("r\(i)")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                            .offset(x: -CGFloat(i * 20))
                                    }
                                    
                                    Spacer(minLength: 0)
                                    
                                    Button(action: {}) {
                                        
                                        Text("View All")
                                            .fontWeight(.bold)
                                    }
                                }
                                //Paso 1.37 since first is moved -20
                                .padding(.leading, 20)
                                .padding(.top)
                                .padding(.horizontal)
                                
                                //Paso 1.38 Carousel...
                                
                                HStack {
                                    
                                    Text("Other Places")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                                .padding(.top)
                                .padding(.horizontal)
                                
                                //Paso 1.39
                                TabView {
                                    
                                    ForEach(1...6, id: \.self) { i in
                                        
                                        // ignoring the current Hero Image...
                                        
                                        if "p\(i)" != selected.image {
                                            
                                            Image("p\(i)")
                                                .resizable()
                                                .cornerRadius(15)
                                                .padding(.horizontal)
                                        }
                                    }
                                }
                                //Paso 1.40
                                .frame(height: 250)
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                                .padding(.top)
                                
                                // Button..
                                
                                Button(action: {}) {
                                    //Paos 1.41
                                    Text("Book Trip")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width: UIScreen.main.bounds.width - 150)
                                        .background(Color.blue)
                                        .cornerRadius(15)
                                }
                                .padding(.top, 25)
                                .padding(.bottom)
                            }
                            
                        }//fin load
                    }
                }
                //Paso 1.19
                .background(Color.white)
            }
        }
        //Paso 1.7
        .background(Color.white.edgesIgnoringSafeArea(.all))
        //Paso 1.28 hiding for Hero View.....
        .statusBar(hidden: show ? true : false)
    }
    
    // Función para obtener el safeAreaInsets.top (actualizado para iOS 15+)
    func safeAreaTop() -> CGFloat {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first else {
            return 0
        }
        return window.safeAreaInsets.top
    }
}
 

#Preview {
    Home()
}
