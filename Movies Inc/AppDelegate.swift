//
//  AppDelegate.swift
//  Movies Inc
//
//  Created by Ahmed on 8/12/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        setupWindow()
        setupObservers()
        statuesBarStyle()
        
          
        return true
    }
    func statuesBarStyle(){
        let statusBar = UIView(frame: (UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame)!)
                  statusBar.backgroundColor = ColorPalette.blue
                  UIApplication.shared.keyWindow?.addSubview(statusBar)
              
    }

    
    func setupAppearance() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = ColorPalette.blue
        navigationBarAppearance.tintColor = ColorPalette.black
        navigationBarAppearance.isTranslucent = true
        navigationBarAppearance.shadowImage = UIImage()
        navigationBarAppearance.backgroundColor = ColorPalette.blue
        navigationBarAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : ColorPalette.black]
        navigationBarAppearance.setBackgroundImage(UIImage(), for: .default)
        
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barTintColor = ColorPalette.blue
        tabBarAppearance.tintColor = ColorPalette.black
        tabBarAppearance.isTranslucent = true
        tabBarAppearance.shadowImage = UIImage()
        tabBarAppearance.backgroundColor = ColorPalette.blue
        
        UISearchBar.appearance().backgroundColor = ColorPalette.blue
    }
    
    func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.tintColor = ColorPalette.black
        
        let movieApi = MovieApi()
        
        let popularViewController = PopularViewController(movieApi: movieApi)
        popularViewController.tabBarItem = UITabBarItem(title: "Popular", image: #imageLiteral(resourceName: "list_icon"), tag: 0)
        let popularNavigationController = UINavigationController(rootViewController: popularViewController)
        
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: #imageLiteral(resourceName: "favorite_empty_icon"), tag: 1)
        let favoritesNavigationController = UINavigationController(rootViewController: favoritesViewController)
        
        let rootViewController = RootViewController(popularNavigationController: popularNavigationController, favoritesNavigationController: favoritesNavigationController)
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func setupObservers() {
        NotificationCenter.default.addObserver(forName: .onMovieFavorited, object: nil, queue: nil) { (notification) in
            if let movie = notification.userInfo?["movie"] as? Movie {
                var cachedMovies = Movie.getCachedMovies()
                
                if let isFavorite = movie.isFavorite, isFavorite {
                    cachedMovies.append(movie)
                } else {
                    if let index = cachedMovies.index(where: { $0 == movie }) {
                        cachedMovies.remove(at: index)
                    }
                }
                
                Movie.saveCachedMovies(cachedMovies)
            }
        }
    }
}

