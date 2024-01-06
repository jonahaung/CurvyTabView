//
//  CurvyTabItemModifier.swift
//  
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI

struct CurvyTabItemPreferenceKey: PreferenceKey {
    typealias Value = [CurvyTabItem]
    static var defaultValue: [CurvyTabItem] = []
    static func reduce(value: inout [CurvyTabItem], nextValue: () -> [CurvyTabItem]) {
        value.append(contentsOf: nextValue())
    }
}

struct CurvyTabItemModifier<SelectionValue: Hashable, N: View, S: View>: ViewModifier {

    @EnvironmentObject var viewModel: CurvyTabViewModel<SelectionValue>
    @EnvironmentObject var stateViewModel: CurvyTabStateViewModel<SelectionValue>
    var tag: SelectionValue
    var normal: N
    var select: S
    private var transition: AnyTransition {
        switch viewModel.constant.screen.transitionMode {
            case .slide(let x): return .asymmetric(insertion: .offset(x: (stateViewModel.previousIndex < stateViewModel.indexOfTag(viewModel.selection) ? x : -x)).combined(with: .opacity), removal: .opacity)
            case .scale(let scale): return .asymmetric(insertion: .scale(scale: stateViewModel.previousSelection == nil ? 1 : scale).combined(with: .opacity), removal: .opacity)
            case .opacity: return .opacity
            case .none: return .identity
        }
    }

    func body(content: Content) -> some View {
        let item = CurvyTabItem(tag: tag, normal: AnyView(normal), select: AnyView(select))
        ZStack {
            if tag == viewModel.selection {
                content
                    .transition(transition)
                    .onAppear {
                        self.stateViewModel.previousSelection = tag
                    }
            } else {
                EmptyView()
            }
        }
        .animation(viewModel.constant.screen.animation ?? .none, value: viewModel.selection)
        .preference(key: CurvyTabItemPreferenceKey.self, value: [item])
    }
}

