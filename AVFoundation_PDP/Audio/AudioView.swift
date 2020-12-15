//
//  AudioView.swift
//  AVFoundation_PDP
//
//  Created by Никита Лужбин on 14.12.2020.
//  Copyright © 2020 flatstack. All rights reserved.
//

import SwiftUI

struct AudioView: View {

    @State private var progress = 0.0

    @ObservedObject var viewModel = AudioViewModel()

    var body: some View {

        NavigationView {

            VStack(spacing: 50) {

                Slider(value: Binding(get: {
                    self.progress
                }, set: { newValue in
                    self.progress = newValue
                    self.viewModel.setTime(Float(newValue))
                }), in: 0...self.viewModel.audioDuration)

                HStack(spacing: 50) {
                    Button(action: {
                        self.viewModel.pause()
                    }) {
                        Image(systemName: "pause.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }

                    Button(action: {
                        self.viewModel.stop()
                    }) {
                        Image(systemName: "stop.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }

                    Button(action: {
                        self.viewModel.play()
                    }) {
                        Image(systemName: "play.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                    }
                }
            }
            .padding()

            .navigationBarTitle("Audio", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(trailing:
                NavigationLink(destination: VideoView(), label: {
                    Text("Video")
                })
            )
        }
        .onAppear {
            self.viewModel.setupAudio()
        }
    }
}
