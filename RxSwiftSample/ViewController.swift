//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by 小坂部泰成 on 2023/03/11.
//

import UIKit
import RxSwift
import RxCocoa


class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        textField.rx.text.orEmpty
        .bind(to: label.rx.text)
        .disposed(by: disposeBag)
    }
    
    //DisposeBag()：観測状態からの解放を行う際に使う
    //.orEmpty：受け取る値をStringに限定（String?からStringに変換）
    //  .bind：受け取った値とUIパーツへの関連付けをする
    //  .disposed：観測対象から除外する

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
