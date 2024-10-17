//
//  ImagePicker.swift
//  Backyard
//
//  Created by 卢冠廷 on 2024/10/17.
//
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage? // 绑定的 UIImage
    var sourceType: UIImagePickerController.SourceType // 来源类型（相机或图库）

    // 创建 UIImagePickerController 实例
    func makeUIViewController(context: Context) -> UIImagePickerController {
        print("Creating UIImagePickerController")
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        print("Source Type: \(sourceType)") // 输出选择的来源类型
        return picker
    }


    // 创建协调器
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    // 更新 UIViewController
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        // 当前无更新逻辑
    }

    // 协调器类
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        // 处理选择的图片
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            print("Image picking finished")
            if let selectedImage = info[.originalImage] as? UIImage {
                print("Image selected: \(selectedImage.size)") // 输出选中图片的尺寸
                parent.image = selectedImage
            } else {
                print("No image found in info")
            }
            picker.dismiss(animated: true)
        }


        // 处理取消操作
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Image picker canceled")
            picker.dismiss(animated: true)
        }

    }
}


