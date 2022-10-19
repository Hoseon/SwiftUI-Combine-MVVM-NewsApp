//
//  ResultState.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
