//
//  BetsCoordinator.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation

protocol BetsCoordinatorInput {
    func makeViewModel() -> BetsViewModel
}

class BetsCoordinator: BetsCoordinatorInput {
    
    // MARK: - CONSTRUCTOR -
    init() {}
    
    func makeViewModel() -> BetsViewModel {
        return BetsViewModel(service: RemoteBetService.instance)
    }
}
