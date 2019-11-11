//
//  DetailViewController.swift
//  MovieList
//
//  Created by Artjoms Vorona on 11/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import WebKit
import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie!
    
    var webView = WKWebView()
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var watchTrailerButton: UIButton!
    
    @IBOutlet weak var movieImage: UIImageView!
    
    @IBOutlet weak var movieWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTitleLabel.text = movie.title
        yearLabel.text = "Year: \(movie.releaseYear)"
        genreLabel.text = "Genre: \(movie.genre)"

        movieImage.image = UIImage(named: movie.imageName)
        
        descriptionLabel.text = movie.description
        
        movieWebView.isHidden = true
    }
    
    @IBAction func playButtonTapped(_ sender: UIButton) {
        movieWebView.isHidden = false
        loadVideoToWebView()
        watchTrailerButton.isHidden = true
    }
    
    func loadVideoToWebView() {
        let urlString = movie.trailerUrlString
        guard let movieUrl = URL(string: urlString) else { return  }
        movieWebView.load(URLRequest(url: movieUrl))
    }

}
