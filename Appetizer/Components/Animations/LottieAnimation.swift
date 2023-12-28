//
//  LottieAnimation.swift
//  Appetizer
//
//  Created by ꧁☆༒☬MoʜɩtToɱɘʀ☬༒☆꧂ on 27/12/23.
//

import SwiftUI
import Lottie

struct APLottieView: UIViewRepresentable {
    var lottieJsonFileName: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()
    var completion: (() -> Void)?

    // MARK: Create Animation View
    func makeUIView(context: UIViewRepresentableContext<APLottieView>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.animation = LottieAnimation.named(lottieJsonFileName)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode
        animationView.play { _ in
            completion?()
        }
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        NSLayoutConstraint.activate([
                                        animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
                                        animationView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<APLottieView>) {}
}
