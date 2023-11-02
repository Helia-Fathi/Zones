//
//  ContentView.swift
//  Zones
//
//  Created by Helia Fathi on 10/30/23.
//

import SwiftUI
import Zone1Framework
import Zone2Framework
import Zone3

struct ContentView: View {
    
    var zone1DataService: Zone1DataServiceType
    var zone1UseCase: Zone1UseCaseType
    var zone1ViewModel: Zone1ViewModel
    
    var zone2DataService: Zone2DataServiceType
    var zone2UseCase: Zone2UseCaseType
    var zone2ViewModel: Zone2ViewModel
    
    @ObservedObject var zone3ViewModel: Zone3ViewModel = Zone3ViewModel()

    init() {
        zone1DataService = Zone1DataService.self as! Zone1DataServiceType
        zone1UseCase = Zone1UseCase(dataService: zone1DataService)
        zone1ViewModel = Zone1ViewModel(useCase: zone1UseCase)
        
        zone2DataService = Zone2DataService.self as! Zone2DataServiceType
        zone2UseCase = Zone2UseCase(dataService: zone2DataService)
        zone2ViewModel = Zone2ViewModel(useCase: zone2UseCase)
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Zone1View(viewModel: zone1ViewModel)
            Divider()
            Zone2View(viewModel: zone2ViewModel)
            Divider()
            Zone3View(viewModel: zone3ViewModel)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
