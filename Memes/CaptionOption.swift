// CaptionOptions.swift 
// Memes
// Created on 4/26/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import Foundation

enum CaptionPosition {
    case top
    case bottom
}

/// This is to be initialized with two set values, `type: CaptionOption.CaptionType` and
/// `position: CaptionPosition`, which are both enums.
/// The `emote` and `caption` properties are *computed properties,* meaning they are calculated
/// automatically based on the type and position values.
struct CaptionOption {
    enum CaptionType {
        case one
        case two
        case three
    }
    var type: CaptionType
    
    var position: CaptionPosition
    
    //MARK: computed properties
    ///Don't use. Use `emote` instead.
    var topEmote: String {
        switch type {
            case .one:
                return "1️⃣"
            case .two:
                return "2️⃣"
            case .three:
                return "3️⃣"
        }
    }
    
    ///Don't use. Use `emote` instead.
    var bottomEmote: String {
        switch type {
            case .one:
                return "🥇"
            case .two:
                return "🥈"
            case .three:
                return "🥉"
        }
    }
    
    var emote: String {
        switch position {
            case .top:	
                return topEmote
            case .bottom:
                return bottomEmote
        }
    }
        
    ///Don't use. Use `caption` instead.
    var topCaption: String {
        switch type {
            case .one:
                return "first top caption"
            case .two:
                return "second top caption"
            case .three:
                return "third top caption"
        }
    }


    ///Don't use. Use `caption` instead.
    var bottomCaption: String {
        switch type {
            case .one:
                return "first bottom caption"
            case .two:
                return "second bottom caption"
            case .three:
                return "third bottom caption"
        }
    }
    
    var caption: String {
        switch position {
            case .top:
                return topCaption
            case .bottom:
                return bottomCaption
        }
    }

}
