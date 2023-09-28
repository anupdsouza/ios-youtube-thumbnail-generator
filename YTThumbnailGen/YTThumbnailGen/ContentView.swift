//
//  ContentView.swift
//  YTThumbnailGen
//
//  Created by Anup D'Souza on 28/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(uiColor: UIColor(red: 233/255.0, green: 50/255.0, blue: 35/255.0, alpha: 1))

            CircularDotsView()
                .opacity(0.5)
            HStack {
                lhsInfoView()
                Spacer()
                rhsInfoView()
            }
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder private func lhsInfoView() -> some View {
        VStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .frame(width: 300, height: 80)
                .foregroundColor(.white)
                .overlay {
                    // MARK: Video Main Title
                    Text("SWIFT BIRD LOGO")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 1)
                        .frame(width: 300)
                }
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(width: 200, height: 50)
                        .overlay {
                            // MARK: Video Top Text
                            Text("DRAW")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.yellow)
                                .background(.black)
                                .frame(width: 200)
                                .overlay(
                                    Image(systemName: "arrow.uturn.up")
                                        .font(.system(size: 70, weight: .bold, design: .serif))
                                        .scaleEffect(CGSize(width: 1, height: -1), anchor: .center)
                                        .foregroundColor(.white)
                                        .offset(x: 65, y: -50)
                                    , alignment: .topTrailing)
                        }
                        .offset(x: 20, y: -45)
                    , alignment: .topLeading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .frame(width: 200, height: 50)
                        .overlay {
                            // MARK: Video Bottom Text
                            Text("IN SWIFTUI")
                                .fontWeight(.bold)
                                .font(.title)
                                .foregroundColor(.yellow)
                                .frame(width: 200)
                                .overlay(
                                    Image(systemName: "arrow.uturn.down")
                                        .font(.system(size: 70, weight: .bold, design: .serif))
                                        .scaleEffect(CGSize(width: 1, height: -1), anchor: .center)
                                        .foregroundColor(.white)
                                        .offset(x: -65, y: 50)
                                    , alignment: .bottomLeading)
                        }
                        .offset(x: -20, y: 45)
                    , alignment: .bottomTrailing)
        }
        .italic()
        .rotationEffect(.degrees(-10))
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder private func rhsInfoView() -> some View {
        VStack {
            // MARK: RHS graphic
            Image("bitmoji-clear")
                .resizable()
                .frame(width: 300, height: 300)
        }
        .padding(.horizontal, 20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
