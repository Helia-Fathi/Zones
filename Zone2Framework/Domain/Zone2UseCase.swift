//
//  Zone2UseCase.swift
//  Zone2Framework
//
//  Created by Helia Fathi on 10/30/23.
//

import Foundation
import Combine

public protocol Zone2UseCaseType {
    func execute() -> AnyPublisher<Zone2Data, Error>
}

public class Zone2UseCase: Zone2UseCaseType {
    public let dataService: Zone2DataServiceType
    
    public init(dataService: Zone2DataServiceType) {
        self.dataService = dataService
    }
    
    public func execute() -> AnyPublisher<Zone2Data, Error> {
        return dataService.fetchData()
    }
}
