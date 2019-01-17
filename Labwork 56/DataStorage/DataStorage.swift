//
//  DataStorage.swift
//  Labwork 56
//
//  Created by Алихан Пешхоев on 16/12/2018.
//  Copyright © 2018 Алихан Пешхоев. All rights reserved.
//

import UIKit

class DataStorage: NSObject {
    
    let listPlain = [["category_id":1,
                      "list":[["id":1, "title":"Ресторан первый", "image":"image1", "description":"Описание первого ресторана", "adress":"Улица Пушкина 1", "contacts":"88005553535"],
                              ["id":2, "title":"Ресторан второй", "image":"image2", "description":"Описание второго ресторана", "adress":"Улица Пушкина 2", "contacts":"88005553536"],
                              ["id":3, "title":"Ресторан третий", "image":"image3", "description":"Описание третьего ресторана", "adress":"Улица Пушкина 3а", "contacts":"88005553537"]]],
                      
                    ["category_id":2,
                    "list":[["id":4, "title":"Музей первый", "image":"image4", "description":"Описание первого музея", "adress":"Улица Пушкина 4", "contacts":"89005553545"],
                        ["id":5, "title":"Музей второй", "image":"image5", "description":"Описание второго музея", "adress":"Улица Пушкина 143", "contacts":"8542256541"],
                        ["id":6, "title":"Музей третий", "image":"image6", "description":"Описание третьего музея", "adress":"Улица Пушкина 173", "contacts":"8542456541"],["id":7, "title":"Музей четвертый", "image":"image7", "description":"Описание четвертого музея", "adress":"Улица Пушкина 181", "contacts":"8542211141"]]],
        
                    ["category_id":3,
                    "list":[["id":8, "title":"Гостиница первая", "image":"image8", "description":"Описание первой гостиницы", "adress":"Улица Пушкина 543", "contacts":"8542256541"],
                        ["id":9, "title":"Гостиница вторая", "image":"image9", "description":"Описание второй гостиницы", "adress":"Улица Пушкина 503", "contacts":"85112256541"],
                        ["id":10, "title":"Гостиница третья", "image":"image10", "description":"Описание третьей гостиницы", "adress":"Улица Пушкина 23", "contacts":"899000235"]]]]
    
    public func getCategories() -> [[String:Any]] {
        let categories = [["id":1, "title":"Рестораны"],["id":2, "title":"Музеи"],["id":3, "title":"Гостиницы"]]
        return categories
    }
    
    public func getListForCategory(category:Int) -> [String:Any]? {
        for item in listPlain {
            if (item["category_id"] as! Int) == category {
                return item
            }
        }
        
        return nil
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
}
