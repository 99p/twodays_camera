//
//  ActivityView.swift
//  twodays_camera
//
//  Created by macboy on 2023/02/10.
//

import SwiftUI

struct ActivityView: UIViewControllerRepresentable {
    
    // UIActivityViewController(シェア機能)でシェアする写真
    let shareItems: [Any]
    
    // 表示するViewを生成するときに実行
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
        
    }
}
