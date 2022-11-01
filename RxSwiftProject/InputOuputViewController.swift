//
//  InputOuputViewController.swift
//  RxSwiftProject
//
//  Created by 이중원 on 2022/11/01.
//

import UIKit
import RxCocoa
import RxSwift

class InputOuputViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    let disposeBag = DisposeBag()
    let ViewModel = InputOutputViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bind()
    }
    
    func bind() {
        let input = InputOutputViewModel.Input(tap: button.rx.tap, text: textField.rx.text)
        let output = ViewModel.transform(input: input)
        
        output.resultText
            .bind(to: button.rx.isEnabled, label.rx.isHighlighted)
            .disposed(by: disposeBag)
        
        output.generalText
            .asDriver()
            .drive(label.rx.text)
            .disposed(by: disposeBag)
        
        output.sceneTransition
            .subscribe { _ in
                
            }
            .disposed(by: disposeBag)
        
    }
    
}
