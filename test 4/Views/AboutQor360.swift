//  Created by Jade Rigout on 10/27/21.
//

import SwiftUI

struct AboutQor360: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("redChair")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .ignoresSafeArea()
                    .overlay(TextOverlay())
                
                VStack(alignment: .leading) {
                    Text("HOW IT ALL STARTED")
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .padding([.top, .leading, .bottom])
                    
                    Text("After 30 years as a surgeon at the University of Vermont’s trauma center, Dr. Osler left the operating room and began a career as a research epidemiologist. This switch required hours of sitting at a computer, and despite trying a dozen different chairs, sitting all day caused him unrelenting back pain")
                        .font(.body)
                        .padding(.horizontal)
                }
                
                Image("Quote1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.top)
                    .frame(width: 300)
            
            }
        }
    }
}

struct TextOverlay: View {
    var gradient: LinearGradient {
        LinearGradient (
            gradient: Gradient(colors: [Color.black.opacity(0.6), Color.black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Rectangle().fill(gradient)
            VStack(alignment: .leading) {
                Text("QOR360")
                    .font(.title)
                    .bold()
                Text("more text here")
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}


struct AboutQor360_Previews: PreviewProvider {
    static var previews: some View {
        AboutQor360()
    }
}
