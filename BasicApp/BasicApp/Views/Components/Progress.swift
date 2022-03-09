//
//  Progress.swift
//  BasicApp
//
//  Created by LeoAndo on 2022/03/09.
//

import Foundation
import SwiftUI

struct Progress : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
}
