//
//  CacheEntry.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 3/12/24.
//

import Foundation

enum CacheEntryItem {
    case ready(Data)
    case inProgress(Task<Data, Error>)
}

final class CacheEntry: Sendable {
    let item: CacheEntryItem
    
    init(item: CacheEntryItem) {
        self.item = item
    }
}
