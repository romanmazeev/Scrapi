//
//  squareRecipe.swift
//  Scrapi
//
//  Created by Christian Riccio on 19/11/21.
//

import Foundation
import SwiftUI

struct CardView: View {
    
    var name: String
//    var time: String
    var imagePath: String
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0.3) {
            Image(imagePath)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.horizontal, 10)
                .clipShape(Circle())
            HStack {
            
                Text(name).font(.title).bold()
                    .foregroundColor(.white)
                HStack {
                    Text("15m").font(.title2).foregroundColor(.black)
                        .padding(.horizontal)
                    Image(systemName: "heart").foregroundColor(.black).font(.title).padding(.all)
                }
                
                }
        }.frame(maxWidth: .infinity, alignment: .center)
//            .background(Color.secondary)
//            .padding(.horizontal)
//        .shadow(color: Color.green.opacity(0.3), radius:0)
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color.green).padding(.horizontal))
        
    }
}


struct Preview_CardView: PreviewProvider {
    static var previews: some View {
        CardView(name: "peppe", imagePath: "asparagus")
    }
}
