//
//  CurvyTabStateViewModel.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI

class CurvyTabStateViewModel<SelectionValue: Hashable>: ObservableObject {
    var previousSelection: SelectionValue? = nil
    var tags: [SelectionValue] = []
    var previousIndex: Int {
        return indexOfTag(previousSelection)
    }
    func indexOfTag(_ tag: SelectionValue?) -> Int {
        return tags.firstIndex(where: {$0 == tag}) ?? 0
    }
}

