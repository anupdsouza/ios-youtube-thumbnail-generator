//
//  ScreenshotView.swift
//  YTThumbnailGen
//
//  Created by Anup D'Souza on 29/09/23.
//

import SwiftUI

struct ScreenshotView: View {
    @Environment(\.displayScale) var displayScale
    var body: some View {
        ZStack {
            Color.red
            viewToScreenshot
                .onTapGesture {
                    let image = viewToScreenshot.screenshot(displayScale)
                    let imageSaver = ImageSaver()
                    imageSaver.writeToPhotoAlbum(image: image)
                }
        }
        .ignoresSafeArea()
    }
    
    var viewToScreenshot: some View {
        ZStack {
            Color.green
        }
        .frame(width: 640, height: 360)
    }
}

struct ScreenshotView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenshotView()
    }
}
