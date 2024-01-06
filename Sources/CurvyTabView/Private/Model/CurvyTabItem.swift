//
//  CurvyTabItem.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
struct CurvyTabItem: Identifiable {
    let id = UUID()
    let tag: Any
    let normal: AnyView
    let select: AnyView
    init<V: View>(tag: Any, normal: V, select: V) {
        self.tag = tag
        self.normal = AnyView(normal)
        self.select = AnyView(select)
    }
}
