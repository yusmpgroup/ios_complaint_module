//
//  JJComplainViewController.swift
//  JoyJet
//
//  Created by Jurayev Nodir on 31.01.2022.
//

import UIKit

class JJComplainViewController: BaseViewController {
    var parameter: Any?
    
    let router = JJComplainRouter()
    let viewModel = JJComplainViewModel()
    
    @IBOutlet weak var textView: JJTextView!
    @IBOutlet weak var confirmButton: JJButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearence()
    }
    
    func setupAppearence() {
//        confirmButton.isUserInteractionEnabled = false
        textView.placeholder = "NewPublication.comment".localized
    }
    
    @IBAction func onBack(_ sender: Any) {
        router.route(to: .back, from: self)
    }

    @IBAction func onConfirm(_ sender: Any) {
        hud.show(in: view)
        viewModel.sendComplaint(textView.text) { [weak self] in
            guard let `self` = self else { return }
            self.hud.dismiss(animated: true)
            self.router.route(to: .next, from: self)
        } onError: { [weak self] error in
            self?.hud.dismiss(animated: true)
        }

    }
}

extension JJComplainViewController: UITextViewDelegate {
//    func textViewDidChange(_ textView: UITextView) {
//        confirmButton.isUserInteractionEnabled = textView.text.count >= 15
//    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = textView.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        // add their new text to the existing text
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)

        // make sure the result is under 16 characters
        return updatedText.count <= 300
    }
}

