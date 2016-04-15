//
//  NuevoContacto.swift
//  Core Data 2
//
//  Created by usu27 on 30/3/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit
import CoreData

class NuevoContacto: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var apellido: UITextField!
    @IBOutlet weak var numero: UITextField!
    
    
    @IBAction func guardar(sender: AnyObject) {
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let nuevoUsuario = NSEntityDescription.insertNewObjectForEntityForName("Usuario", inManagedObjectContext: context)

        print(nombre.text)
        print(apellido.text)
        print(numero.text)
        print(Int(numero.text!))
        
        nuevoUsuario.setValue(nombre.text, forKey: "nombre")
        nuevoUsuario.setValue(apellido.text, forKey: "apellido")
        nuevoUsuario.setValue(Int(numero.text!), forKey: "numero")
        
        do {
            try context.save()
            //performSegueWithIdentifier("volver", sender:self)
        } catch let error{
            print(error)
        }
        performSegueWithIdentifier("volver", sender:self)
    }

        
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }


}
