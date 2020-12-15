//
//  VideoView.swift
//  AVFoundation_PDP
//
//  Created by Никита Лужбин on 14.12.2020.
//  Copyright © 2020 flatstack. All rights reserved.
//

import SwiftUI

struct VideoView: View {

    var body: some View {

        Text("Video")
            .navigationBarTitle("Video", displayMode: .inline)
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
