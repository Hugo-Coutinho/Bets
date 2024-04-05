//
//  ServiceSpy.swift
//  BetsCoreTests
//
//  Created by Hugo Coutinho on 2024-04-05.
//

import Bets
import BetsCore

class BetsServiceErrorHandlerSpy: BetService {
    func loadBets() async throws -> [BetsCore.Bet] {
        return []
    }
    
    func saveBets(_ bets: [BetsCore.Bet]) async throws {
        
    }
}

