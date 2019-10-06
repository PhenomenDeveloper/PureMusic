//
//   CMTime + Extension.swift
//  PureMusic
//
//  Created by Lev Kolesnikov on 15/09/2019.
//  Copyright © 2019 Lev Kolesnikov. All rights reserved.
//

import AVKit

extension CMTime {
    
    func toDisplayString() -> String {
        guard !CMTimeGetSeconds(self).isNaN else { return "" }
        let totalSeconds = Int(CMTimeGetSeconds(self))
        let minutes = totalSeconds / 60
        //      % - Остаток от деления
        let seconds = totalSeconds % 60
        let timeFormatString = String(format: "%02d:%02d", minutes, seconds)
        return timeFormatString
    }
    
}
