//
//  WidgetInfoProxy.swift
//  WidgetKitProxy
//

import Foundation
import WidgetKit
import Intents

@available(iOS 14.0, *)
@objc(WidgetInfoProxy)
public class WidgetInfoProxy : NSObject {
    @objc public var kind: String = ""
    @objc public var family: Int = WidgetFamily.systemSmall.rawValue
    @objc public var configuration: INIntent? = nil
}
