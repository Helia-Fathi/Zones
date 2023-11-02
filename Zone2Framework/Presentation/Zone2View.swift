//
//  Zone2View.swift
//  Zone2Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import SwiftUI
import Combine

public struct Zone2View: View {
    @ObservedObject var viewModel: Zone2ViewModel

    public init(viewModel: Zone2ViewModel) {
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

