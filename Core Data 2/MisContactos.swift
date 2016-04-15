//
//  ViewController.swift
//  Core Data 2
//
//  Created by usu27 on 30/3/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit
import CoreData

class MisContactos: UIViewController {

    //asocio la tabla de la vista
    @IBOutlet weak var tabla: UITableView!
    
    //Funcion para poder acceder a la bbdd
    let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    //Tabla con la que trabajare
    let request = NSFetchRequest(entityName: "Usuario")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Actualizo la vista
        self.tabla.reloadData()

        //Context para poder trabajar con la bbdd
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        //elimino el array de objeto
        Contacto.array.removeAll()
        
        //Resultados del select
        if let results = try? context.executeFetchRequest(request) where results.count>0{
            for result in results {
                //Insertos los datos de la bbdd en el array de objetos Contacto
                Contacto.array.append(Contacto(nombre: String(result.valueForKey("nombre")!), apellido : String(result.valueForKey("apellido")!), numero : String(result.valueForKey("numero")!)))

           }
            
            //Guardo los resultados en la vista para que sean persistentes
            _ = try? context.save()
           
        }
    }

    //Calculamos la longitud del array de objetos Cliente y devolvemos la longitud
    func tableView(tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int { return Contacto.array.count }
    
    //Insertamos los datos recogidos del array a nuestros elementos de vsita
    func tableView(tableView: UITableView, cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell{
            
        //asocio la celda con la vista
        let cell: Item = tableView.dequeueReusableCellWithIdentifier("item") as! Item
            
        //asocio los elementos de la celda con los elementos del array de objetos
        cell.nombre.text = Contacto.array[indexPath.row].nombre
        cell.apellido.text = Contacto.array[indexPath.row].apellido
        cell.numero.text = Contacto.array[indexPath.row].numero
        return cell
    }
    
    //Aquí borra la tarea seleccionada y recarga la tabla
    func tableView(tableView: UITableView,
        editActionsForRowAtIndexPath indexPath: NSIndexPath) ->
        [AnyObject]?{
            
            //metodo para borrar
            let deleteAction = UITableViewRowAction(style: .Default,
                title: "Borrar", handler: {(action, indexPath) -> Void in
                    
                    
                let context: NSManagedObjectContext = self.appDel.managedObjectContext
                    
                //Consulta a la bbdd
                let results = try? context.executeFetchRequest(self.request)
                    for result in results! {
                        //elemina el resultado de la consulta con el nombre indicado en la posicion indicada en el arraylist
                        if String(result.valueForKey("nombre")!) == String(Contacto.array[indexPath.row].nombre) {
                            // Borro el objeto en la bbdd
                            context.deleteObject(result as! NSManagedObject)
                        }
                    }
                    
                    //elimino el objeto del array list
                    Contacto.array.removeAtIndex(indexPath.row)
                    _ = try? context.save()

                    //refrescamos la tabla
                    self.tabla.reloadData()
                    
            })
            
            //devolvemos el resultado de la accion
            return [deleteAction]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

