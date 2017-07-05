//
//  ItensTableViewController.swift
//  Lista de comrpas
//
//  Created by Renan Soares Germano on 30/06/17.
//  Copyright © 2017 Renan Soares Germano. All rights reserved.
//

import UIKit

class ItensTableViewController: UITableViewController {
    
    //MARK: propriedades
    var compra:Compra?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = compra!.nome
        if(compra!.total == 0.0){
            print("Entrou!")
            let rightButton = UIBarButtonItem(title: "Comprar", style: .plain, target: self, action: #selector(fazerCompra))
            navigationItem.rightBarButtonItem = rightButton
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return compra!.itens.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath) as? ItemTableViewCell else{
            fatalError("A célula não é uma intância de ItemTableViewCell")
        }

        let item = compra!.itens[indexPath.row]
        cell.fotoImage.image = item.produto.foto
        cell.nomeLabel.text = item.produto.nome
        cell.descricaoLabel.text = item.produto.descricao
        cell.quantidadeLabel.text = "\(item.quantidade)"

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    
    // MARK: Navigation
    func fazerCompra(){
        performSegue(withIdentifier: "Comprar", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch(segue.identifier ?? ""){
            case "Comprar":
                guard let comprarVC = segue.destination as? ComprarViewController else{
                    fatalError("A View de destino não é uma instância de ComprarViewController.")
                }
                comprarVC.compra = compra
            default:
                fatalError("Identificador inesperado!")
        }
    }
    
    /*
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
