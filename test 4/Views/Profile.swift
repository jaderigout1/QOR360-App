//
//  Profile.swift
//  SEED
//
//  Created by Jade Rigout on 10/22/21.
//

import SwiftUI

struct Profile: View {
    @State var name = ""
    @State var age = ""
    @State var heightFt = ""
    @State var heightIn = ""
    @State var weight = ""
    @State var gender = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("puppyPortrait")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .clipShape(Circle())
                Text(name)
                    .padding(.top, -45)
            
                VStack(alignment: .leading) {
                    Text("Edit Information")
                        .font(.title3)
                        .fontWeight(.medium)
                        .padding(.vertical, 15)
                    Group {
                        HStack {
                            Text("Name")
                                .fontWeight(.medium)
                                .padding(.vertical, 1.5)
                            TextField("Name", text: $name)
                        }
                        Divider()
                    }
                    Group {
                        HStack {
                            Text("Age")
                                .fontWeight(.medium)
                                .padding(.vertical, 1.5)
                            Picker("Age", selection: $age){
                                ForEach(0..<100) {
                                    Text("\($0)")
                                }
                            }
                        }
                        Divider()
                    }
                    Group {
                        HStack {
                            Text("Height")
                                .fontWeight(.medium)
                                .padding(.vertical, 1.5)
                            Picker("feet", selection: $heightFt){
                                ForEach(0..<10) {
                                    Text("\($0) ft")
                                }
                            }
                            Picker("inches", selection: $heightIn){
                                ForEach(0..<13) {
                                    Text("\($0) in")
                                }
                            }
                        }
                        Divider()
                    }
                    Group {
                        HStack {
                            Text("Weight")
                                .fontWeight(.medium)
                                .padding(.vertical, 1.5)
                            TextField("0", text: $weight)
                                .frame(width: 40.0)
                            Text("lbs")
                        }
                        Divider()
                    }
                    Group {
                        HStack {
                            Text("Gender")
                                .fontWeight(.medium)
                                .padding(.vertical, 1.5)
                            Picker("Gender", selection: $gender){
                                Text("Male").tag("Male")
                                Text("Female").tag("Female")
                                Text("Other").tag("Other")
                            }
                        }
                        Divider()
                    }
                }
                .padding(.leading, 20.0)
                Spacer()
            }
            .navigationTitle("My Profile")
            .accentColor(.black)
        }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
