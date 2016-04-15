//
//  Contacto.swift
//  Core Data 2
//
//  Created by usu27 on 5/4/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class Contacto: NSObject {
    
    static var array:[Contacto]=[]
    
    var nombre: String!
    var apellido: String!
    var numero: String!
    
    init(nombre: String, apellido:String, numero: String){
        self.nombre = nombre
        self.apellido = apellido
        self.numero = numero
    }

}
