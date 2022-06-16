//
//  UnderlineTextViewViewController.swift
//  RAGTextField_Example
//
//  Created by Huy Nguyen on 15/06/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import RAGTextField

class UnderlineTextViewViewController: UIViewController, UITextViewDelegate {

    @IBOutlet private weak var offsetTextView: RAGTextView! {
        didSet {
            offsetTextView.placeholderMode = .scalesWhenEditing
            setUp(offsetTextView, color: ColorPalette.savanna.withAlphaComponent(0.1))
        }
    }

    @IBOutlet weak var underlineTextView: RAGTextView! {
        didSet {
            underlineTextView.delegate = self
            let bgView = UnderlineView(frame: .zero)
            bgView.textView = underlineTextView
            bgView.backgroundLineColor = ColorPalette.stone
            bgView.foregroundLineColor = ColorPalette.bramble
            bgView.foregroundLineWidth = 2.0
            bgView.expandDuration = 0.2
            bgView.expandMode = .expandsInUserInterfaceDirection
            bgView.backgroundColor = ColorPalette.chalk
            if #available(iOS 11, *) {
                bgView.layer.cornerRadius = 8.0
                bgView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
            }
            underlineTextView.tintColor = ColorPalette.flame
            underlineTextView.textColor = ColorPalette.bramble
            underlineTextView.tintColor = ColorPalette.bramble
            underlineTextView.textBackgroundView = bgView
            underlineTextView.textPadding = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
            underlineTextView.textPaddingMode = .textAndPlaceholderAndHint
            underlineTextView.scaledPlaceholderOffset = 0.0
            underlineTextView.placeholderMode = .scalesWhenEditing
            underlineTextView.placeholderScaleWhenEditing = 0.8
            underlineTextView.placeholderColor = ColorPalette.midnight.withAlphaComponent(0.66)
            underlineTextView.transformedPlaceholderColor = underlineTextView.tintColor
//            underlineTextView.hintColor = ColorPalette.sky
//            underlineTextView.hintFont = UIFont.systemFont(ofSize: 11.0)
//            underlineTextView.hintOffset = 3.0
//            underlineTextView.hint = "Natural mode supported as well"
        }
    }

    private func setUp(_ textView: RAGTextView, color: UIColor = ColorPalette.chalk) {

        textView.delegate = self
//        textView.textColor = ColorPalette.midnight
//        textView.tintColor = ColorPalette.midnight
        textView.textBackgroundView = makeTextBackgroundView(color: color)
        textView.textPadding = UIEdgeInsets(top: 4.0, left: 4.0, bottom: 4.0, right: 4.0)
        textView.textPaddingMode = .textAndPlaceholderAndHint
        textView.scaledPlaceholderOffset = 2.0
        textView.placeholderScaleWhenEditing = 0.8
        textView.placeholderColor = ColorPalette.stone
    }

    private func makeTextBackgroundView(color: UIColor) -> UIView {
        let view = UnderlineView(frame: .zero)
        view.layer.cornerRadius = 4.0
        view.backgroundColor = color
        return view
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Underlined TextView"

        setPlaceholderOffset(at: 1)

        super.viewDidLoad()
    }

    private func setPlaceholderOffset(at index: Int) {

        _ = offsetTextView.resignFirstResponder()

        let offset: CGFloat = [0.0, 8.0, 16.0][index]
        offsetTextView.scaledPlaceholderOffset = offset

        let value = "Offset by \(Int(offset))pt"
        offsetTextView.text = value
    }
}
