//
//  CurvyTabCurveShape.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
public struct CurvyTabCurveShape: Shape {
    let radius: CGFloat
    var depth: CGFloat
    var position: CGFloat
    public var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get {
            AnimatablePair(depth, position)
        }
        set {
            depth = max(min(newValue.first, 1), -1)
            position = max(min(newValue.second, 1), 0)
        }
    }
    public init(radius: CGFloat, depth: CGFloat, position: CGFloat) {
        self.radius = radius
        self.depth = depth
        self.position = position
    }

    public func path(in rect: CGRect) -> Path {
        var path = Path()

        let delta = 1 + (1 - abs(depth))
        let half = rect.width * position
        let curvePoint: CGPoint = CGPoint(x: radius / 1.74, y: (radius / 3.5) * depth)
        let edgeX: CGFloat = radius / ((2.85 - 0.36 * abs(depth)) - delta)

        path.move(to: CGPoint(x: half - radius , y: 0))
        path.addQuadCurve(to: CGPoint(x: half - curvePoint.x, y: curvePoint.y),
                          control: CGPoint(x: half - edgeX , y: 0))
        path.addCurve(to: CGPoint(x: half + curvePoint.x, y: curvePoint.y),
                      control1: CGPoint(x: half - radius / (delta * (3 + (1 - depth))), y: (radius / delta) * depth),
                      control2: CGPoint(x: half + radius / (delta * (3 + (1 - depth))), y: (radius / delta) * depth))
        path.addQuadCurve(to: CGPoint(x: half + radius, y: 0),
                          control: CGPoint(x: half + edgeX, y: 0))
        path.addLine(to: CGPoint(x: rect.width , y: 0))
        path.addLine(to: CGPoint(x: rect.width , y: rect.height))
        path.addLine(to: CGPoint(x: 0 , y: rect.height))
        path.addLine(to: CGPoint(x: 0 , y: 0))
        path.closeSubpath()
        return path
    }
}

struct ATCurveShape_Previews: PreviewProvider {
    static var previews: some View {
        CurvyTabCurveShape(radius: 60, depth: 0.8, position: 0.5)
            .stroke()
            .frame(width: 220, height: 60)
    }
}

