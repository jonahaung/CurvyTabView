//
//  CurvyTabViewModel.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI

class CurvyTabViewModel<SelectionValue: Hashable>: ObservableObject {
    @Binding var selection: SelectionValue
    let constant: CurvyTabViewConstants
    init(selection: Binding<SelectionValue>, constant: CurvyTabViewConstants) {
        _selection = selection
        self.constant = constant
    }
}

