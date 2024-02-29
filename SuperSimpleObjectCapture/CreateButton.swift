//
//  CreateButton.swift
//  SuperSimpleObjectCapture
//
//

import SwiftUI
import RealityKit

@MainActor
struct CreateButton: View {
    let session: ObjectCaptureSession
    
    var body: some View {
        Button(action: {
            performAction()
        }, label: {
            Text(label)
                .foregroundStyle(.white)
                .padding()
                .background(.tint)
                .clipShape(Capsule())
        })
    }
    
    private var label: LocalizedStringKey {
        if session.state == .ready {
            return "Start detecting"
        } else if session.state == .detecting {
            return "Start capturing"
        } else {
            return "Undefined"
        }
    }
    
    private func performAction() {
        if session.state == .ready {
            let isDetecting = session.startDetecting()
            print(isDetecting ? "▶️Start detecting" : "😨Not start detecting")
        } else if session.state == .detecting {
            session.startCapturing()
        } else {
            print("Undefined")
        }
    }
}
