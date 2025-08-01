//
//  WidgetKitProxy.swift
//  WidgetKitProxy
//

import Foundation
import WidgetKit
import Intents

@available(iOS 14.0, *)
@objc(WidgetCenterProxy)
public class WidgetCenterProxy : NSObject {
    
    @objc
    public func reloadTimeLines(ofKind: String){
        WidgetCenter.shared.reloadTimelines(ofKind: ofKind)
    }
    
    @objc
    public func reloadAllTimeLines(){
        WidgetCenter.shared.reloadAllTimelines()
    }
    
    @objc
    public func getCurrentConfigurations(completion: @escaping ([WidgetInfoProxy]) -> Void){
        WidgetCenter.shared.getCurrentConfigurations { results in
           
            do {
                let widgetConfigurations = try results.get()
                var widgetInfoArr:[WidgetInfoProxy] = []
                
                for widgetConfiguration in widgetConfigurations {
                    
                    let widgetInfo = WidgetInfoProxy()
                    widgetInfo.kind = widgetConfiguration.kind
                    widgetInfo.family = widgetConfiguration.family.rawValue
                    widgetInfo.configuration = widgetConfiguration.configuration
                    
                    widgetInfoArr.append(widgetInfo)
                }
                
                completion(widgetInfoArr)
            } catch {
                
                let widgetInfo = WidgetInfoProxy()
                widgetInfo.kind = "error"
                widgetInfo.family = 0
                widgetInfo.configuration = nil
                
                completion([widgetInfo])
            }
        }
    }
}
