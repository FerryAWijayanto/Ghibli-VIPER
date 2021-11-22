//
//  Extension+UIImageView.swift
//  Ghibli-VIPER
//
//  Created by Ferry Adi Wijayanto on 21/11/21.
//

import UIKit.UIImageView

extension UIImageView {
    func loadImage(from urlString: String) {
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
}
