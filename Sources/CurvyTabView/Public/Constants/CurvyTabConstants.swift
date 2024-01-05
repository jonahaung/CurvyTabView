//
//  CurvyTabConstants.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
public enum ATSpacingMode: Hashable {
    case center
    case average
}
public struct CurvyTabConstants: Equatable {

    public var normalSize: CGSize
    public var selectWidth: CGFloat
    public var spacingMode: ATSpacingMode
    public var spacing: CGFloat
    public var shadow: CurvyTabShadowConstants
    public var activeVibration: Bool
    public var transition: AnyTransition
    public var animation: Animation?

    public init(normalSize: CGSize = CGSize(width: 50, height: 50),
                selectWidth: CGFloat = -1,
                spacingMode: ATSpacingMode = .average,
                spacing: CGFloat = 0,
                shadow: CurvyTabShadowConstants = .init(),
                activeVibration: Bool = true,
                transition: AnyTransition = .opacity,
                animation: Animation? = .easeInOut(duration: 0.28)) {
        self.normalSize = normalSize
        self.selectWidth = selectWidth
        self.spacingMode = spacingMode
        self.spacing = spacing
        self.shadow = shadow
        self.activeVibration = activeVibration
        self.transition = transition
        self.animation = animation
    }

    public static func == (lhs: CurvyTabConstants, rhs: CurvyTabConstants) -> Bool {
        lhs.normalSize == rhs.normalSize &&
        lhs.selectWidth == rhs.selectWidth &&
        lhs.spacingMode == rhs.spacingMode &&
        lhs.spacing == rhs.spacing &&
        lhs.shadow == rhs.shadow &&
        lhs.activeVibration == rhs.activeVibration &&
        lhs.animation == rhs.animation
    }
}

