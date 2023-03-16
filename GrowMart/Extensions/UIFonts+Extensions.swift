import Foundation
import UIKit

extension UIFont {
    public enum fontStyle: String {
        case regular = "Nunito-Regular.ttf"
        case semiBold = "Nunito-SemiBold.ttf"
    }

    static func nunito(style: fontStyle = .regular, size: CGFloat) -> UIFont {
        UIFont(name: "Nunito-\(style.rawValue)", size: size)!
    }
}

