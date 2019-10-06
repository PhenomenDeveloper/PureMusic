//
//  Nib.swift
//  PureMusic
//
//  Created by Lev Kolesnikov on 15/09/2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as! T
    }
}

