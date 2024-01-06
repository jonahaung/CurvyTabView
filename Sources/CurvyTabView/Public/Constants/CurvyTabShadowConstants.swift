//
//  CurvyTabShadowConstants.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI

public struct CurvyTabShadowConstants: Equatable {

    public var color: Color
    public var radius: CGFloat
    public var x: CGFloat
    public var y: CGFloat

    public init(color: Color = .black.opacity(0.35),
                radius: CGFloat = 3,
                x: CGFloat = 0,
                y: CGFloat = 0) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}
