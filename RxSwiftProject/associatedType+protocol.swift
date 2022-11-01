//
//  associatedType+protocol.swift
//  RxSwiftProject
//
//  Created by 이중원 on 2022/11/01.
//

import Foundation


protocol customViewModel {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
