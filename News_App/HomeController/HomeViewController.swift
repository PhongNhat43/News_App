//
//  ViewController.swift
//  News_App
//
//  Created by devsenior on 17/03/2023.
//

import UIKit
import Alamofire
import Kingfisher
import SideMenu

class HomeViewController: UIViewController {
    
 
    @IBOutlet weak var tableview: UITableView!
    
    @IBOutlet weak var homeSearchBar: UISearchBar!
    
    var arrayData = [News]()
    
    var searchData = [News]()
    var searchng = false
    
    var menu: SideMenuNavigationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        getDataApi()
        setupTableView()
//        getDataFromAPI()
        menu = SideMenuNavigationController(rootViewController: MenuListController())
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    @IBAction func didMenu(){
      present(menu!, animated: true)
    }
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func getDataApi(){
       guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ad732c7302a7418dabdf4bc3b98bad75") else {
           print("Khong co data tra ve")
         return
       }

        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
//            dump(response.value)
            if let data = response.value as? [String: Any]{
                let coin = data.map({ _ in News.deserialize(from: data)! })

                self.arrayData = coin
                self.tableview.reloadData()
            }
        }
    }
    
//   func getDataFromAPI()
//  {
//       if let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ad732c7302a7418dabdf4bc3b98bad75"){
//            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
////                   dump(response.value)
//               if let dict = response.value as? [String: Any]{
//                    if dict.count > 0 { // check xem co du lieu tra ve hay k
//                       if let data = dict["articles"] as? [NSDictionary] {
//                           let result = data.map({ News.deserialize(from: $0)! })
//
//                           self.arrayData = result
//                           self.tableview.reloadData()
//                       }
//
//                   } else {
//                     print("Ko co data tra ve")
//                    }
//               }
//            }
//
//       }

//    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.identifier ) as! NewsTableViewCell
            let data = arrayData[indexPath.row]
//            cell.arthorLbNNews.text = data.articles[indexPath.row].author
        cell.titleLbNews.text = data.articles[indexPath.row].title
        cell.imageNews.setImage(imageUrl: data.articles[indexPath.row].urlToImage)
            return cell
    }
   
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController
        vc?.newsContent = arrayData[indexPath.row]
        navigationController?.pushViewController(vc! , animated: true)
    }
}


class MenuListController: UITableViewController {
    var items = ["Tin Phim Ảnh", "Tin Giải trí", "Tin Thời sự", "Tin Quốc Tế", "Tin Thể Thao"]
    
    let darkColor = UIColor(red: 33/255.0, green: 33/255.0, blue: 33/255.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = darkColor
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = darkColor
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if items[indexPath.row] == "Tin Phim Ảnh" {
//            let navigationController = UINavigationController(rootViewController: MoviesViewController())
//            navigationController.pushViewController(MoviesViewController(), animated: true)
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "MoviesViewController")
            navigationController?.pushViewController(vc, animated: true)
        }
       
        
        
        
    }

}

