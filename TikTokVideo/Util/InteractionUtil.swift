//
//  InteractionUtil.swift
//  TikTokVideo
//
//  Created by Depak on 01/04/21.
//  Copyright © 2021 apple. All rights reserved.
//

import Foundation
import UIKit

struct InteractionUtil {
    
    static func pauseUserInteraction() {
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    static func resumeUserInteraction() {
        UIApplication.shared.endIgnoringInteractionEvents()
    }
}
