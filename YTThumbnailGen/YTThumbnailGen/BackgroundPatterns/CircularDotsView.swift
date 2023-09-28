//
//  CircularDotsView.swift
//  YTThumbnailGen
//
//  Created by Anup D'Souza on 28/09/23.
//

import SwiftUI

struct CircularDotsView: View {

    let innerRadius = CGFloat(150)
    let radiusStep = CGFloat(15)
    let innerDotSize = CGFloat(4)
    let gapRatio = CGFloat(1.5)
    let color: Color

    init(color: Color = .black) {
        self.color = color
    }

    var body: some View {
        Canvas { context, size in
            let originX = size.width / 2
            let originY = size.height / 2
            let cornerDistance = ((originX * originX) + (originY * originY)).squareRoot()
            let circumference = 2 * CGFloat.pi * innerRadius
            let nDots = Int((circumference / (innerDotSize * (gapRatio + 1))) + 0.5)
            let angleStep = (2.0 * .pi) / Double(nDots)
            let dotAngle = (innerDotSize / circumference) * 2 * .pi
            var radius = innerRadius
            while radius < cornerDistance {

                var angle = (-Double.pi / 2.0) - (dotAngle / 2.0)
                let circumference = 2 * CGFloat.pi * radius
                let dotSize = circumference / (CGFloat(nDots) * (1.0 + gapRatio))
                for _ in 0..<nDots {
                    let x = originX + (cos(angle) * radius)
                    let y = originY + (sin(angle) * radius)
                    context.fill(
                        Path(ellipseIn: CGRect(x: x, y: y, width: dotSize, height: dotSize)),
                        with: .color(color)
                    )
                    angle += angleStep
                }
                radius += radiusStep
            }
        }
    }
}

struct CircularDotsView_Previews: PreviewProvider {
    static var previews: some View {
        CircularDotsView()
    }
}
