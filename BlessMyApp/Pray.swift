//
//  Pray.swift
//  BlessMyApp
//
//  Created by @Osuka42 on 19/02/16.
//  Copyright © 2016 Digital Castle. All rights reserved.
//

import Foundation

class Pray {
    
    let delayTime = 0.85
    var prayer: [String] = []
    
    let languajes: [String] = ["en", "es", "fin", "fr", "de"]
    
    func setLanguaje(lang: String) -> [String] {
        switch lang {
        case "es", "spa", "spanish":  // Spanish
            return ["Padre nuestro, que estás en el cielo", "Santificado sea tu nombre", "Venga nosotros tu reino", "Hágase tu voluntad en la tierra como en el cielo", "Danos hoy nuestro pan de cada día", "Perdona nuestras ofensas", "Como también nosotros perdonamos a los que nos ofenden", "No nos dejes caer en la tentación", "Y líbranos del mal", "", "Amén"]
            
        case "fin", "fi", "finnish": // Finnish
            return ["Isä meidän, joka olet taivaissa!", "Pyhitetty olkoon sinun nimesi; tulkoon sinun valtakuntasi;", "tapahtukoon sinun tahtosi myös maan päällä niinkuin taivaassa;", "anna meille tänä päivänä meidän jokapäiväinen leipämme;", "ja anna meille meidän velkamme anteeksi,", "niinkuin mekin annamme anteeksi meidän velallisillemme;", "äläkä saata meitä kiusaukseen; vaan päästä meidät pahasta.", "", "Aamen."]
            
        case "fr", "fre", "fra", "french": // French
            return ["Notre Père qui es aux cieux,", "Que ton nom soit sanctifié,", "Que ton règne vienne,", "Que ta volonté soit faite,", "Sur la terre comme au ciel.", "Donne-nous aujourd'hui", "Notre pain de ce jour.", "Pardonne-nous nos offenses,", "Comme nous pardonnons aussi", "À ceux qui nous ont offensés.", "À ceux qui nous ont offensés.", "Mais délivre-nous du mal.", "", "Amen."]
            
        case "de", "deu", "ger", "german": // German
            return ["Vater unser im Himmel,", "Geheiligt werde dein Name.", "Dein Reich komme.", "Dein Wille geschehe, wie im Himmel so auf Erden.", "Unser tägliches Brot gib uns heute.", "Und vergib uns unsere Schuld,", "wie auch wir vergeben unsern Schuldigern.", "Und führe uns nicht in Versuchung,", "sondern erlöse uns von dem Bösen.", "Denn Dein ist das Reich und die Kraft und die Herrlichkeit in Ewigkeit.", "", "Amen."]
            
        default:    // Default languaje is English
            return ["Our Father, who art in heaven,", "Hallowed be thy Name. Thy kingdom come.", "Thy will be done, On earth as it is in heaven.", "Give us this day our daily bread. And forgive us our trespasses,", "As we forgive those who trespass against us. And lead us not into temptation,", "But deliver us from evil.", "For thine is the kingdom, and the power, and the glory, for ever and ever.", "", "Amen"]
        }
    }
    
    
    init () {
        self.prayer = self.setLanguaje("en")
        self.start()
    }
    
    init (var lang: String) {
        if(lang == "random") {
            let random = Int(arc4random_uniform(UInt32(self.languajes.count)))
            lang = self.languajes[random]
        }
        self.prayer = self.setLanguaje(lang.lowercaseString)
        self.start()
    }
    
    func start() {
        
        let delay = self.delayTime * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            if(self.prayer.count > 0) {
                print(self.prayer[0])
                self.prayer.removeAtIndex(0)
                self.start()
            }
        }
    }
    
}