//
//  GhibliCell.swift
//  Ghibli-VIPER-Starter
//
//  Created by Ferry Adi Wijayanto on 09/11/21.
//

import UIKit

protocol GhibliCellViewModel {
    var imageName: String { get }
    var movieTitle: String { get }
    var releaseDate: String { get }
    var description: String { get }
}

class GhibliCell: UITableViewCell {
    static let cellID = "GhibliCell"

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var releaseDateLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        descriptionLbl.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func set(viewModel: GhibliCellViewModel) {
        movieImage.loadImage(from: viewModel.imageName)
        titleLbl.text = viewModel.movieTitle
        releaseDateLbl.text = viewModel.releaseDate
        descriptionLbl.text = viewModel.description
    }
    
}
