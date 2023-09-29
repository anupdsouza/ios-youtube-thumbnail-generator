//
//  ContentView.swift
//  YTThumbnailGen
//
//  Created by Anup D'Souza on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.displayScale) var displayScale
    
    var body: some View {
        ZStack {
            designView
                .onTapGesture {
                    let image = designView.screenshot(displayScale)
                    let imageSaver = ImageSaver()
                    imageSaver.writeToPhotoAlbum(image: image)
                }
        }
        .ignoresSafeArea()
    }
    
    private var designView: some View {
        ZStack {
            Color(uiColor: UIColor(red: 233/255.0, green: 50/255.0, blue: 35/255.0, alpha: 1))
            
            CircularDotsView()
                .opacity(0.5)
            
            elementsView
                .fixedSize()
        }
    }
    
    private var elementsView: some View {
        /// fixed size view at 16:9 aspect ratio for YT thumbnails
        HStack {
            lhsInfoView(mainTitle: "SWIFT BIRD LOGO", topTitle: "DRAW", bottomTitle: "IN SWIFTUI")
                .border(.green, width: 1)
            rhsInfoView("bitmoji")
                .border(.green, width: 1)
        }
        .frame(width: 640, height: 360)
    }
    
    @ViewBuilder private func lhsInfoView(mainTitle mainText: String,
                                          topTitle topText: String,
                                          bottomTitle bottomText: String) -> some View {
        VStack {
            // MARK: Main Text
            titleTextView(mainText)
                .overlay(alignment: .topLeading, content: {
                    
                    // MARK: Top Text
                    overlayTextView(topText)
                        .offset(x: 20, y: -35)
                        .overlay(
                            overlayArrowView("arrow.uturn.up")
                                .offset(x: 55, y: -55)
                            , alignment: .topTrailing)
                })
                .overlay(alignment: .bottomTrailing, content: {
                    
                    // MARK: Bottom Text
                    overlayTextView(bottomText)
                        .offset(x: -20, y: 35)
                        .overlay(
                            overlayArrowView("arrow.uturn.down")
                                .offset(x: -55, y: 55)
                            , alignment: .bottomLeading)
                })
        }
        .frame(width: 300, height: 300)
        .fixedSize()
        .italic()
        .rotationEffect(.degrees(-10))
    }
    
    @ViewBuilder private func titleTextView(_ text: String) -> some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 240, height: 80)
            .foregroundColor(.white)
            .overlay {
                Text(text)
                    .font(.title2.bold())
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 1)
            }
    }
    
    @ViewBuilder private func overlayTextView(_ text: String) -> some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .frame(width: 150, height: 40)
            .fixedSize()
            .overlay {
                Text(text)
                    .font(.title3.bold())
                    .multilineTextAlignment(.center)
                    .padding(5)
                    .foregroundColor(.yellow)
            }
    }
    
    @ViewBuilder private func overlayArrowView(_ arrowImageName: String) -> some View {
        Image(systemName: arrowImageName)
            .font(.system(size: 40, weight: .bold, design: .serif))
            .flipped(.vertical, anchor: .center)
            .foregroundColor(.white)
            .fixedSize()
    }
    
    @ViewBuilder private func rhsInfoView(_ imageName: String) -> some View {
        VStack {
            // MARK: RHS graphic
            Image(imageName)
                .resizable()
                .padding()
        }
        .frame(width: 300, height: 300)
        .fixedSize()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
