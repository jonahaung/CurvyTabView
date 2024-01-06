//
//  CurvyTabViewScreenConstants.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
public enum ATTransitionMode: Hashable {
    case slide(CGFloat)
    case scale(CGFloat)
    case opacity
    case none
}
public struct CurvyTabViewScreenConstants: Equatable {
    public var activeSafeArea: Bool
    public var transitionMode: ATTransitionMode
    public var animation: Animation?
    public init(activeSafeArea: Bool = true,
                transitionMode: ATTransitionMode = .opacity,
                animation: Animation? = .easeInOut(duration: 0.28)) {
        self.activeSafeArea = activeSafeArea
        self.transitionMode = transitionMode
        self.animation = animation
    }
}
