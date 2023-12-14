//
//  AnyTransition+.swift
//  JustCube
//
//  Created by Khai on 12/14/23.
//

import SwiftUI

extension AnyTransition {
    static var cubeRotation: AnyTransition {
        get {
            AnyTransition.asymmetric(
                insertion: AnyTransition.modifier(
                    active: RotationModifier(direction: .enter, pct: 0),
                    identity: RotationModifier(direction: .enter, pct: 1)
                ),
                removal: AnyTransition.modifier(
                    active: RotationModifier(direction: .exit, pct: 1),
                    identity: RotationModifier(direction: .exit, pct: 0)
            ))
        }
    }
}
