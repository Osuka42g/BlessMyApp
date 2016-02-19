//
//  Pray.swift
//  BlessMyApp
//
//  Created by @Osuka42 on 19/02/16.
//  Copyright © 2016 Digital Castle. All rights reserved.
//

import Foundation

class Pray {
    
    var lang: String = "es"
    
    
    var prayer: [String] = ["Pare nuestro, que estás en el cielo", "Santificado sea tu nombre", "Venga nosotros tu reino", "Hágase tu voluntad en la tierra como en el cielo", "Danos hoy nuestro pan de cada día", "Perdona nuestras ofensas", "Como también nosotros perdonamos a los que nos ofenden", "No nos dejes caer en la tentación", "Y líbranos del mal", "Amén"]

    init () {
        self.start()
    }
    
    func start() {
        
        let delay = 0.85 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            print(self.prayer[0])
            self.prayer.removeAtIndex(0)
            if(self.prayer.count > 0) {
                self.start()
            }
        }
    }
    
}