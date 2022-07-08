//
//  NewsTableViewController.swift
//  InComX
//
//  Created by Виктор Плесовских on 05.07.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {

   // Создаем массив
    var news = [
        News(image: UIImage(named:"retro"), nameNews: "Услышано у Водителей", newsDescription: "«АвтоВАЗ» после ухода из России своего основного акционера – французской Renault – сможет выпускать кроссовер Renault Duster под брендом Lada. Об этом «Ведомостям» рассказали два источника в Минпромторге РФ. По словам одного из них, речь идет о выпуске кроссовера второго поколения. Он выпускался на заводе Renault в Москве, который сейчас переходит в собственность властей города, с 2021 г. у «АвтоВАЗа» есть лицензия на производство этой модели, знает собеседник. Наименование модели под брендом Lada ему неизвестно."),
        News(image: UIImage(named:"2h-media_"), nameNews: "Sakhalin Life", newsDescription: "Сегодня в Южно-Сахалинске стартовали работы по созданию транспортно-пересадочного узла в районе привокзальной площади. В связи с этим здесь изменится схема организации дорожного движения.Выезд и заезд на привокзальную площадь будет осуществляться как по Карла Маркса, так и по Коммунистическому проспекту. Движение на данных участках станет двусторонним. В настоящее время в районе пересечения этих улиц с Ленина смонтированы два новых светофора. Также в ночь на 6 июля здесь планируется нанести новую дорожную разметку. Светофоры будут введены в рабочий режим сразу, как только дорожники завершат работы по переразметке."),
        News(image: UIImage(named:"lance"), nameNews: "Ivanovo News", newsDescription: "Самые качественные автомобильные трассы находятся в Москве. В столице доля автодорог регионального или межмуниципального и местного значения на 97,5% отвечает нормативным требованиям. Второе место занял Ханты-Мансийский автономный округ - Югра. Там дорожные полотна на 87,1% соответствуют нормативным требованиям. Бронза - у Краснодарского края. В этом регионе на 84,5% автодороги отвечают нормативным требованиям.Ивановская область расположилась в рейтинге на 28 строчке и оказалась впереди своих соседей. При этом всего лишь 55,2% автодорог соответствуют нормативным требованиям."),
        News(image: UIImage(named:"Kaliningr"), nameNews: "Kaliningrad ON-LINE", newsDescription: "На Балтийской косе мужчина спас из отбойного течения двух женщин. Очевидцем случившегося стала жена спасителя, она сообщила, что люди поочередно заходили в воду, чтобы спасти купальщиц, но те не смогли справиться с течением. А её муж профессионально занимался плаванием, что и помогло всем выбраться на сушу."),
        News(image: UIImage(named:""), nameNews: "Новости Хабаровска", newsDescription: "Новое за сегодня"),
        
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250.0
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsTableViewCell", for: indexPath) as? NewsTableViewCell else {
            preconditionFailure("Error")
        }

        cell.NewsImage.image = news[indexPath.row].image
        cell.NewsName.text = news[indexPath.row].nameNews
        cell.NewsDescription.text = news[indexPath.row].newsDescription
        // Configure the cell...

        return cell
    }
}
