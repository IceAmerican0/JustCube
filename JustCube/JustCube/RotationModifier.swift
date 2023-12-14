//
//  RotationModifier.swift
//  JustCube
//
//  Created by Khai on 12/14/23.
//

import SwiftUI

struct RotationModifier: AnimatableModifier {
    enum SlideDirection {
        case enter
        case exit
    }
    
    var direction: SlideDirection
    
    var pct: Double
        
    var animatableData: Double {
        get { pct }
        set { pct = newValue }
    }
    
    func body(content: Content) -> some View {
        GeometryReader { geo in
            content
                .rotation3DEffect(
                    Angle(degrees: calcRotation()),
                    axis: (x: 0.0, y: 1.0, z: 0.0),
                    anchor: direction == .enter ? .leading : .trailing,
                    anchorZ: 0,
                    perspective: 0.1
                ).transformEffect(.init(translationX: calcTranslation(geo: geo), y: 0))
        }
    }

    func calcTranslation(geo: GeometryProxy) -> CGFloat {
        if direction == .enter {
            return geo.size.width - (CGFloat(pct) * geo.size.width)
        } else {
            return -1 * (CGFloat(pct) * geo.size.width)
        }
    }
    
    func calcRotation() -> Double {
        direction == .enter ? 90 - (pct * 90) : -1 * (pct * 90)
    }
}
