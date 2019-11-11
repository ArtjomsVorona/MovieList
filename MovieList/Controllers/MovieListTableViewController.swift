//
//  MovieListTableViewController.swift
//  MovieList
//
//  Created by Artjoms Vorona on 11/11/2019.
//  Copyright © 2019 Artjoms Vorona. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {

    var movies = Movie.createMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        let movie = movies[indexPath.row]

        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = "Year: \(movie.releaseYear)" + "\nGenre: \(movie.genre)"
        cell.detailTextLabel?.numberOfLines = 0
        cell.imageView?.image = UIImage(named: movie.imageName)

        return cell
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
        let movedMovie = movies.remove(at: fromIndexPath.row)
        movies.insert(movedMovie, at: to.row)

    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
   
    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailViewController
            detailVC.movie = movies[indexPath.row]
        }
    }

}
