//
//  UISliderTest.swift
//  BoxOffice
//
//  Created by 1 on 2022/10/22.
//

import UIKit

class UISliderTest: UISlider {

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
           let width = self.frame.size.width
           let tapPoint = touch.location(in: self)
           let fPercent = tapPoint.x/width
           let nNewValue = self.maximumValue * Float(fPercent)
           if nNewValue != self.value {
               self.value = nNewValue
           }
           return true
       }

}
