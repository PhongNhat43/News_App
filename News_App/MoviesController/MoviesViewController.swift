//
//  MoviesViewController.swift
//  News_App
//
//  Created by devsenior on 20/03/2023.
//

import UIKit

import UIKit
import Alamofire
import Kingfisher
import SideMenu

class MoviesViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arrayData = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataApi()
        setupTableView()
//        getDataFromAPI()

    }
    
    
    func setupTableView() {
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func getDataApi(){
       guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-02-20&sortBy=publishedAt&apiKey=ad732c7302a7418dabdf4bc3b98bad75") else {
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

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier ) as! MoviesTableViewCell
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

        let vc = storyboard?.instantiateViewController(withIdentifier: "MoviesContentViewController") as? MoviesContentViewController
        vc?.newsContent = arrayData[indexPath.row]
        navigationController?.pushViewController(vc! , animated: true)
    }
}




