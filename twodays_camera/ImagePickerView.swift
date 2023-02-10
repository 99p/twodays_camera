//
//  ImagePickerView.swift
//  twodays_camera
//
//  Created by macboy on 2023/02/10.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var isShowSheet: Bool
    @Binding var captureImage: UIImage?
    
    // Coordinatorでコントローラのdelegateを管理
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePickerView
        
        init(_ parent: ImagePickerView){
            self.parent = parent
        }
        
        // 撮影が終わったときに呼ばれるdelegateメソッド　必ず必要
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any] ){
            // 撮影した写真をcaptureImageに保存
            if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.captureImage = originalImage
            }
            
            // sheetを閉じる
            parent.isShowSheet = false
        }
        
        // キャンセルボタンを選択したときに呼ばれるdelegateメソッド　必ず必要
        func imagePickerControllerDidCancel(_ Picker: UIImagePickerController){
            // sheetを閉じる
            parent.isShowSheet = false
        }
    }
    
    // Coordinatorを生成、SwiftUIによって自動的に呼び出し
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Viewを生成するときに実行
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIImagePickerController {
        let myImagePickerController = UIImagePickerController()
        myImagePickerController.sourceType = .camera
        myImagePickerController.delegate = context.coordinator
        return myImagePickerController
    }
    
    // Viewが更新されたといに実行
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
    
}
