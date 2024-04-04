//
//  BetsViewModel.swift
//  Bets
//
//  Created by Hugo Coutinho on 2024-04-04.
//

import Foundation
import BetsCore

class BetsViewModel {
    // MARK: - PROPERTIES -
    @Published var odds: Bets = []
    
    private var service: BetService
    
    // MARK: - CONSTRUCTOR -
    init(service: BetService) {
        self.service = service
    }
    
    public func updateOdds() async {
        odds.forEach{( $0.update() )}
        try? await service.saveBets(odds)
    }
}
