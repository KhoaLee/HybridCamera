import UIKit

open class FlashButton: ToggleButton {
   override public init(frame: CGRect) {
      super.init(frame: FlashButton.rect)
      backgroundColor = .clear
      self.setImage(#imageLiteral(resourceName: "flash"), for: .normal)
   }
}
/**
 * Constants (Size and position)
 */
extension FlashButton {
   public static var rect: CGRect {
      let btnWidth: CGFloat = 30
      let topRight: CGPoint = {
         let rect = UIScreen.main.bounds
         let margin: CGFloat = 40
         return .init(x: rect.width - btnWidth - margin, y: 0 + margin)
      }()
      return .init(x: topRight.x, y: topRight.y, width: btnWidth, height: btnWidth)
   }
}
