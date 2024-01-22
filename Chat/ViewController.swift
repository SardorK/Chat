//
//  ViewController.swift
//  Chat
//
//  Created by User 2 on 22/01/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
    lazy var backGroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        
        return view
    }()
    
    lazy var popularLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Ehsonz"
        view.numberOfLines = 0
        view.font = .systemFont(ofSize: 40.0, weight: .bold)
        view.textColor = .white
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        view.dataSource = self
        view.delegate = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        view.backgroundColor = .white
        title = "Top Rated"
    }
    
    private func createLayout()-> UICollectionViewCompositionalLayout{
        
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        item.contentInsets.trailing = 5.0
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)), subitems: [item])
        group.contentInsets.bottom = 20.0
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        
    }
    
    func setUpSubviews(){
        
        view.addSubview(collectionView)
        view.addSubview(backGroundImage)
        view.addSubview(popularLabel)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200.0),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10.0),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10.0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10.0),
            
            backGroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backGroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            backGroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            backGroundImage.bottomAnchor.constraint(equalTo: collectionView.topAnchor,constant: -20.0),
            
            popularLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 20.0),
            popularLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -20.0),
            popularLabel.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 20.0),
            popularLabel.bottomAnchor.constraint(equalTo: backGroundImage.bottomAnchor)
        ])
//        PopularListMovieLoader().getListMovies(listType: .topRated) { result in
//            switch result {
//            case .succes(let movieList):
//                self.movies = movieList.results
//                self.collectionView.reloadData()
//            case .failure(_):
//                break
//            }
//        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as? HomeCollectionViewCell else{
            return UICollectionViewCell()
        }
        cell.backgroundColor = UIColor.black
        cell.layer.cornerRadius = 10.0
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let vc = InfoViewController()
////        let movie = movies[indexPath.row]
////        vc.movies = movie
//        vc.modalTransitionStyle = .crossDissolve
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true)
    }
    
    
    
}

extension UIImageView{
    func loadFrom (URLAddress: String){
            guard let url = URL(string: URLAddress) else {
                    return
            }
            DispatchQueue.main.async { [weak self] in
                if let imageData = try? Data(contentsOf: url){
                            if let loadedImage = UIImage (data: imageData) {
                                    self?.image = loadedImage
                }
            }
        }
    }
}



