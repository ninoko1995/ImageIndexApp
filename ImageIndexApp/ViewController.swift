//
//  ViewController.swift
//  ImageIndexApp
//
//  Created by Kota Ninomiya on 2019/09/13.
//  Copyright © 2019 Kota Ninomiya. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource ,  UICollectionViewDelegateFlowLayout{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // How many cells in one section.
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // How many sections are there.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15;
    }
    
    // What is there  in the cells
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // セルの取得
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath)
//        // セルの背景色を赤色に変更
//        cell.backgroundColor = UIColor.red
//        return cell
//    }
//
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // セルの取得 (as! MyCollectionViewCell)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        
        // セルのインデックスを取得
        let columnIndex = indexPath.row
        // 画像名を作成
        let imageName = "image" + String(columnIndex + 1)
        // MyCollectionViewCellのimageに画像を設定
        cell.cellImage.image = UIImage(named: imageName)
        
        return cell
    }
    
    /**
     セルのサイズを設定する
     */
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横幅はコレクションビューのサイズの3分の1、さらにマージン分の引く
        let width = collectionView.frame.size.width / 3 - 2
        // 縦幅は横幅と同じ
        let height = width
        // サイズを示すCGSizeクラスとして返す
        return CGSize(width: width, height: height)
    }
    
    @IBAction func returnToMain(segue:UIStoryboardSegue) {
    }
    
    /// 遷移直前に実行される関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先が詳細画面の場合のみ処理を続行する
        if segue.destination is DetailViewController {
            // 遷移先のDetailImageViewを取得
            let detailImageView = segue.destination as! DetailViewController
            // タップされたセルを取得
            let tappedCell = sender as! MyCollectionViewCell
            // セル内で参照している画像が存在しない場合は処理をキャンセル
            guard let myImage = tappedCell.cellImage.image else {
                return
            }
            // 詳細画面の画像として、セルで参照している画像を渡す
            detailImageView.detailImage = myImage
        }
    }
    


}

