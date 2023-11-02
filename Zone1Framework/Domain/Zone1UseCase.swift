//
//  Zone1UseCase.swift
//  Zone1Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Combine

public protocol Zone1UseCaseType {
    func execute() -> AnyPublisher<Zone1Data, Error>
}

public class Zone1UseCase: Zone1UseCaseType {
    public let dataService: Zone1DataServiceType
    
    public init(dataService: Zone1DataServiceType) {
        self.dataService = dataService
    }
    
    public func execute() -> AnyPublisher<Zone1Data, Error> {
        return dataService.fetchData()
    }
}
