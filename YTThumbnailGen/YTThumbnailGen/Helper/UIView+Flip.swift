//
//  UIView+Flip.swift
//  YTThumbnailGen
//
//  Created by Anup D'Souza on 29/09/23.
//

import Foundation
import SwiftUI

extension View {
    func flipped(_ axis: Axis = .horizontal, anchor: UnitPoint = .center) -> some View {
        switch axis {
        case .horizontal:
            return scaleEffect(CGSize(width: -1, height: 1), anchor: anchor)
        case .vertical:
            return scaleEffect(CGSize(width: 1, height: -1), anchor: anchor)
        }
    }
}
