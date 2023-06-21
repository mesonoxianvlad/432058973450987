import Foundation

public protocol AlertPresenter {
    func presentYesNoAlert(title: String, message: String, onYes: @escaping () -> (), onNo: @escaping () -> ())
}

public struct MockAlertPresenter: AlertPresenter {
    public func presentYesNoAlert(title: String, message: String, onYes: @escaping () -> (), onNo: @escaping () -> ()) {
        print("\n\n Title:\(title)\nMessage:\(message)")
    }
}
