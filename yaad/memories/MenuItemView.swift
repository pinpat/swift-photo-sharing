//
//  MenuItemView.swift
//  memories
//
//  Created by Toan Nguyen Dinh on 11/14/19.
//  Copyright © 2019 Toan Nguyen Dinh. All rights reserved.
//

import SwiftUI

struct MenuItemView: View {
    var title: String
    var body: some View {
        Text(title)
           .fontWeight(.bold)
           .font(.headline)
           .foregroundColor(.primary)
        }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemView(title: "Memory Book")
    }
}
