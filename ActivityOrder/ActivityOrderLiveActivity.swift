//
//  ActivityOrderLiveActivity.swift
//  ActivityOrder
//
//  Created by Fani on 17/10/23.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct ActivityOrderAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct ActivityOrderLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ActivityOrderAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack(spacing:0) {
                Group {
                    HStack {
                        
                        Image(systemName: "globe.americas").resizable(resizingMode: .stretch).foregroundColor(Color.white).frame(
                            width: 50, height: 50
                        ).padding(.trailing, 8)
                        
                        Text("1").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white)
                        Spacer()
                        Text(":").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white)
                        Spacer()
                        Text("0").font(.largeTitle).fontWeight(.bold).foregroundColor(Color.white).padding(.trailing, 8)
                        Image(systemName: "sunset.circle").resizable(resizingMode: .stretch).foregroundColor(Color.white).frame(
                            width: 50, height: 50
                        )
                    }.padding(.horizontal, 40).padding(.vertical, 16.0)
                }.frame(maxWidth: .infinity).background(Color.black).padding(.zero)
               
                Group {
                    HStack {
                        Text("Hello").foregroundColor(Color.white)
                    }.padding(.bottom, 16).padding(.horizontal, 40).padding(.top, 16)
                }
                .frame(maxWidth: .infinity) .background(Color(hue: 0.337, saturation: 0.839, brightness: 0.286, opacity: 0.859))
            }
           
            .activitySystemActionForegroundColor(Color.white)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct ActivityOrderLiveActivity_Previews: PreviewProvider {
    static let attributes = ActivityOrderAttributes(name: "Me")
    static let contentState = ActivityOrderAttributes.ContentState(value: 3)

    static var previews: some View {
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.compact))
            .previewDisplayName("Island Compact")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
            .previewDisplayName("Island Expanded")
        attributes
            .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
            .previewDisplayName("Minimal")
        attributes
            .previewContext(contentState, viewKind: .content)
            .previewDisplayName("Notification")
    }
}
