//
//  DetailViewController.swift
//  ImageIndexApp
//
//  Created by Kota Ninomiya on 2019/09/16.
//  Copyright © 2019 Kota Ninomiya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // 詳細画像名
    @IBOutlet weak var detailImageView: UIImageView!
    /// 一覧画面から受け取る画像情報
    var detailImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // detailImageがnilなら処理をキャンセル
        guard let image = detailImage else {
            return
        }
        
        // 詳細画像を表示する
        detailImageView.image = image
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
