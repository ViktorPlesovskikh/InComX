//
//  LoginViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 12.08.2022.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {

    let session = Session.shared
    var oneTabBarVC: OneTabBarViewController?
    @IBOutlet var webWiew: WKWebView!
    
    //1. Мы должны авторизоваться и получить token
    //2. Пишем сами запросы используя токен из первого шага
//нам нужно передавать как минимум 2 параметра :
//    client_id (обязательный) — идентификатор вашего приложения.
//    redirect_uri (обязательный) — адрес, на который будет переадресован пользователь после прохождения авторизации (см. redirect_uri).
    //Id приложения вк InComX
    let idInComX = "51401281"
    //let url = "https://oauth.vk.com/authorize"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        webWiew.navigationDelegate = self
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "oauth.vk.com"
        urlComponent.path = "/authorize"
        
        urlComponent.queryItems = [
            URLQueryItem(name: "client_id", value: idInComX),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "response_type", value: "token")
        ]
        let url = urlComponent.url
        if UIApplication.shared.canOpenURL(url!) {
        let request = URLRequest(url: url!)
            webWiew.load(request)
        }
    }
    
}
    extension LoginViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment.components(separatedBy: "&")
            .map{$0.components(separatedBy: "=")}
            .reduce([String: String]()) { res, param in
                var dict = res
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params ["access_token"] {
            self.session.token = token
            oneTabBarVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "OneTabBarViewController") as?
            OneTabBarViewController
            self.view.insertSubview((oneTabBarVC?.view)!, at: 9)
        }
        decisionHandler(.cancel)
            }
        
    }
    

