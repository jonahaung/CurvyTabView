//
//  TabViewPreview.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
struct TabViewPreview: View {

    @State private var selection: Int = 0
    @State private var constant = CurvyTabViewConstants(axisMode: .top, tab: .init())

    init() {}
    var body: some View {
        CurvyTabView(selection: $selection, constant: CurvyTabViewConstants(axisMode: .bottom)) { state in
        } content: {
            Text("Tab 1")
                .tabItem(tag: 0, normal: {
                    Text("Tab 1")
                }, select: {
                    Text("Tab 1")
                        .bold()
                        .foregroundColor(Color.orange)
                })
            Text("Tab 2")
                .tabItem(tag: 1, normal: {
                    Text("Tab 2")
                }, select: {
                    Text("Tab 2")
                        .bold()
                        .foregroundColor(Color.orange)
                })
            Text("Tab 3")
                .tabItem(tag: 2, normal: {
                    Text("Tab 3")
                }, select: {
                    Text("Tab 3")
                        .bold()
                        .foregroundColor(Color.orange)
                })
            Text("Tab 4")
                .tabItem(tag: 3, normal: {
                    Text("Tab 4")
                }, select: {
                    Text("Tab 4")
                        .bold()
                        .foregroundColor(Color.orange)
                })
            Text("Tab 5")
                .tabItem(tag: 4, normal: {
                    Text("Tab 5")
                }, select: {
                    Text("Tab 5")
                        .bold()
                        .foregroundColor(Color.orange)
                })
        }
    }
}

fileprivate
struct TabButton: View {

    let isSelection: Bool
    let systemName: String
    @State private var y: CGFloat = -1

    var body: some View {
        Image(systemName: systemName)
            .font(.system(size: 24))
            .padding(12)
            .foregroundColor(isSelection ? Color.white : Color.black)
            .background(isSelection ? Color.red : Color.clear)
            .clipShape(Circle())
            .offset(y: y)
            .onAppear {
                if isSelection {
                    y = -45
                    DispatchQueue.main.async {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.6)) {
                            y = 12
                        }
                    }
                }else {
                    y = 0
                }
            }
    }
}

