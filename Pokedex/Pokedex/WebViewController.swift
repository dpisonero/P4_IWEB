//
//  WebViewController.swift
//  Pokedex
//
//  Created by user145055 on 11/4/18.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit

import WebKit

class WebViewController: UIViewController {
    
    var race: Race?
    
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // URL a mostrar
        var str = "http://es.pokemon.wikia.com"
        if race != nil {
            // Poner nombre de la raza como titulo de la Navigation Bar
            title = race!.name
            // Añadir la raza al URL escapando caracteres conflictivos
            if let path = "wiki/\(race!.name)"
                .addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                str = "\(str)/\(path)"
            }
        } else {
            // Poner Pokedex como titulo de la Navigation Bar
            title = "Pokedex"
        }
        if let url = URL(string:str) {
            print(str)
            let req = URLRequest(url: url)
            webView.load(req)
        }
    }
    
    @IBAction func undo(_ sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
