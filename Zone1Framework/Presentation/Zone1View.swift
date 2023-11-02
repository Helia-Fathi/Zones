//
//  Zone1View.swift
//  Zone1Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import SwiftUI

public struct Zone1View: View {
    @ObservedObject public var viewModel: Zone1ViewModel

    public init(viewModel: Zone1ViewModel) {
        self.viewModel = viewModel
    }
    
   public var body: some View {
        VStack {
            if let data = viewModel.data {
                Text(data.description)
            } else {
                Text("Loading...")
            }
        }
        .onAppear(perform: viewModel.loadData)
    }
}
