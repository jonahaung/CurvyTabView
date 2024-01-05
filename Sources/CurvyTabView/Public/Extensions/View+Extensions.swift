//
//  View+Extensions.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI

public extension View {
    func tabItem<SelectionValue: Hashable,
                 N: View,
                 S: View>(tag: SelectionValue,
                          @ViewBuilder normal: @escaping () -> N,
                          @ViewBuilder select: @escaping () -> S) -> some View {
        modifier(CurvyTabItemModifier(tag: tag,
                                      normal: normal(),
                                      select: select()))
    }
}

