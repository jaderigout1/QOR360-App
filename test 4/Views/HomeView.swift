//
//  HomeView.swift
//  SEED
//
//  Created by Jade Rigout on 10/26/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showProfile = false
    @State private var showAboutPage = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.init(Color(#colorLiteral(red: 0.8425752521, green: 0, blue: 0, alpha: 1)))]
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Hi Emily!")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom, 15.0)
                Group {
                    HStack {
                        Text("TODAY")
                            .font(.title2)
                            .foregroundColor(Color(red: 0.844, green: 0.0, blue: -0.001))
                            .multilineTextAlignment(.leading)
                        Divider()
                        Text(Date(), style: .date)
                            .font(.subheadline)
                    }
                }
                Spacer()
                Group {
                    VStack {
                        Text("THIS WEEK")
                            .foregroundColor(Color(red: 0.844, green: 0.0, blue: -0.001))
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {showAboutPage.toggle()})
                    {
                        Image("qor360-logo_1800x1800")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 60)
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("App Name")
                        .font(.title2)
                        .fontWeight(.medium)
                }
                ToolbarItem {
                    Button(action: {showProfile.toggle()}) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.gray)
                            .accessibilityLabel("User Profile")
                    }
                }
            }
            .sheet(isPresented: $showProfile) {
                Profile()
            }
            .sheet(isPresented: $showAboutPage){
                AboutQor360()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
