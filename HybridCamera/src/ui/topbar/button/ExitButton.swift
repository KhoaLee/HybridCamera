import UIKit

open class ExitButton: ClickButton {
   override public init(frame: CGRect) {
      let rect = ExitButton.rect
      super.init(frame: rect)
      self.backgroundColor = .clear
      self.setImage(#imageLiteral(resourceName: "cancel"), for: .normal)
   }
   /**
    * Boilerplate
    */
   @available(*, unavailable)
   public required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * Constants
 */
extension ExitButton {
   /**
    * Metrics of Exit button (Not using AutoLayout)
    */
   public static var rect: CGRect {
      let btnWidth: CGFloat = 30
      let topLeft: CGPoint = {
         let margin: CGFloat = 40
         return .init(x: margin, y: margin)
      }()
      return .init(x:topLeft.x, y:topLeft.y, width:btnWidth, height:btnWidth)
   }
}
