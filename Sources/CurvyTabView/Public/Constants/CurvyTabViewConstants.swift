//
//  File.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
public enum CurvyTabViewAxisModel: Hashable {
    case top
    case bottom
}
public struct CurvyTabViewConstants: Equatable {
    public var axisMode: CurvyTabViewAxisModel
    public var screen: CurvyTabViewScreenConstants
    public var tab: CurvyTabConstants
    public init(axisMode: CurvyTabViewAxisModel = .bottom,
                screen: CurvyTabViewScreenConstants = .init(),
                tab: CurvyTabConstants = .init()) {
        self.axisMode = axisMode
        self.screen = screen
        self.tab = tab
    }
}

