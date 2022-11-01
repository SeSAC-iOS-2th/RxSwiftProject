//
//  InputOuputViewModel.swift
//  RxSwiftProject
//
//  Created by 이중원 on 2022/11/01.
//

import Foundation
import RxSwift
import RxCocoa

class InputOutputViewModel: customViewModel {
    
    struct Input {
        let tap: ControlEvent<Void>
        let text: ControlProperty<String?>
    }
    
    struct Output {
        let resultText: Observable<Bool>
        let generalText: BehaviorRelay<String>
        let sceneTransition: ControlEvent<Void>
    }
    
    func transform(input: Input) -> Output {
        let validText = BehaviorRelay<String>(value: "글자를 입력해주세요.")
        
        let resultText = input.text
            .orEmpty
            .map { $0.count >= 8 }
            .share(replay: 1, scope: .whileConnected)
        
        return Output(resultText: resultText, generalText: validText, sceneTransition: input.tap)
    }
}
