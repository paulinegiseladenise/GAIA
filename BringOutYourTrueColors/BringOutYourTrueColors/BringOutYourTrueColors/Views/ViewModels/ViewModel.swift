//
//  ViewModel.swift
//  BringOutYourTrueColors
//
//  Created by Pauline Broängen on 2023-02-20.
//

import Foundation
import SwiftUI

struct ViewModel {
    
    var options = [
        ["Gröna, blågröna, gulgröna, bruna", "Blåa, gråa, svarta", "Blandad"],
        ["Rött, gyllenblont, brunt", "Grått, askblont, kall brunt, svart", "Skiftande"],
        ["Guld", "Silver", "Båda"]
    ]
    
    var selections: [Int?] = [nil, nil, nil]
    var selectionsMade = 0
    
    var results = ["Dina färger är varma",
                   "Dina färger är kalla",
                   "Dina färger är neutrala"]
    
    var allSelectionsMade: Bool {
        return selections.compactMap { $0 }.count == options.count
    }
    
    
    func selectOption(at Index: Int, optionIndex: Int) -> ViewModel {
        var newSelections = self.selections
        newSelections[Index] = optionIndex
        var newViewModel = ViewModel(selections: newSelections)
        newViewModel.selectionsMade = selectionsMade + 1
        return newViewModel
    }
    
    func optionSelected(optionIndex: Int, at index: Int) -> Bool {
        return selections[index] == optionIndex
    }
    
    func calculateResult() -> String? {
        guard allSelectionsMade else {
            return nil
        }
        let counts =
        selections.reduce(into: [0, 0, 0]) { counts, selection in
            if let selection = selection {
                counts[selection] += 1
            }
        }
        let maxCount = counts.max()!
        let resultIndex = counts.firstIndex(of: maxCount)!
        return results[resultIndex]
    }
    
    func resetTest() -> ViewModel {
        return ViewModel()
    }
}


