//
//  CurvyTabState.swift
//
//
//  Created by Aung Ko Min on 6/1/24.
//

import SwiftUI
public struct CurvyTabState {

    public var constant: CurvyTabViewConstants
    public var itemCount: Int
    public var previousIndex: Int
    public var currentIndex: Int
    public var size: CGSize
    public var safeAreaInsets: EdgeInsets
    public init(constant: CurvyTabViewConstants = .init(),
                itemCount: Int = 0,
                previousIndex: Int = 0,
                currentIndex: Int = 0,
                size: CGSize = .zero,
                safeAreaInsets: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) {
        self.constant = constant
        self.itemCount = itemCount
        self.previousIndex = previousIndex
        self.currentIndex = currentIndex
        self.size = size
        self.safeAreaInsets = safeAreaInsets
    }
    public func getCurrentX() -> CGFloat {
        let tabConstant = constant.tab
        var leadingPadding: CGFloat = 0

        let btnWidth: CGFloat = constant.tab.normalSize.width
        let selectBtnWidth: CGFloat = constant.tab.selectWidth > 0 ? constant.tab.selectWidth : btnWidth
        let btnAllWidth: CGFloat = constant.tab.normalSize.width * CGFloat(itemCount - 1) + selectBtnWidth

        let spaceAllWidth: CGFloat = size.width - btnAllWidth
        var spaceWidth: CGFloat = spaceAllWidth / CGFloat(itemCount + 1)

        if tabConstant.spacingMode == .center {
            spaceWidth = tabConstant.spacing
            let gap = size.width - (constant.tab.normalSize.width * CGFloat(itemCount) + (tabConstant.spacing * CGFloat(itemCount + 1)))
            leadingPadding = (gap * 0.5)
        }else {
            leadingPadding = (selectBtnWidth * 0.5 - btnWidth * 0.5)
        }
        return leadingPadding + ((spaceWidth + btnWidth) * CGFloat(currentIndex + 1) - btnWidth * 0.5) - selectBtnWidth * 0.5
    }
    public func getCurrentDeltaX() -> CGFloat {
        let selectBtnWidth: CGFloat = constant.tab.selectWidth > 0 ? constant.tab.selectWidth : constant.tab.normalSize.width
        return getCurrentX() / size.width + (selectBtnWidth * 0.5 / size.width)
    }
}

