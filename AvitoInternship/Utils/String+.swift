//
//  String+.swift
//  AvitoInternship
//
//  Created by urichese on 09.11.2022.
//

import Foundation
import UIKit

extension String {
    func size(_ font: UIFont) -> CGSize {
        return self.size(withAttributes: [NSAttributedString.Key.font: font])
    }
}
