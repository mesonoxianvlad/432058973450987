import Foundation

public protocol AlertPresenter {
    func presentYesNoAlert(title: String, message: String, onYes: @escaping () -> (), onNo: @escaping () -> ())
}

public struct MockAlertPresenter: AlertPresenter {
    var completeWithYes = true
    
    public func presentYesNoAlert(title: String, message: String, onYes: @escaping () -> (), onNo: @escaping () -> ()) {
        print("\n\n Title:\(title)\nMessage:\(message)")
        if completeWithYes {
            onYes()
        } else {
            onNo()
        }
    }
}
