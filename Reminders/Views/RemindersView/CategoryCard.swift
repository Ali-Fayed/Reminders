//
//  CategoryCard.swift
//  Reminders
//
//  Created by Macbook on 02/06/2021.
//

import SwiftUI

struct CategoryCard: View {
    let cat: CategoryModel
    @State private var didTap:Bool = false
    var body: some View {
        VStack{
            Image(systemName: cat.imageName ?? "")
                .foregroundColor(didTap ? .white : .yellow)
                .padding(3)
                .onTapGesture {
                   didTap = true
                }
            Text(cat.catName ?? "")
                .fontWeight(.light)
                .font(.caption)
        }.frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(didTap ? Color.yellow : Color.white)
        .cornerRadius(40)
        //.overlay(Circle().stroke(Color.black, lineWidth: 1))
    }
}

struct CategoryCard_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCard(cat: CategoryModel(catName: "gg", imageName: "eye"))
    }
}
