//
//  ImageInfoView.swift
//  sarina
//
//  Created by Kah Shiuh Tang on 7/24/24.
//

import SwiftUI

struct ImageInfoView: View {
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    print("DEBUG: Show profile")
                } label : {
                    Image(systemName:"arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            
            Text("Actor | Comedian")
        }.foregroundStyle(.white)
            .padding()
            .background(
                LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    ImageInfoView(user: MockData.users[1])
}
