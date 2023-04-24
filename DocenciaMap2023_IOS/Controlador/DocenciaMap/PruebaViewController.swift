//
//  PruebaViewController.swift
//  AppDocencia23
//
//  Created by Ivan Gabriel on 08/04/23.
//

import UIKit

class PruebaViewController: UIViewController {
    //buscar1
        var searching = false
        var searchedCursos = [Curso]()
        let searchController = UISearchController(searchResultsController: nil)
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    let collectionViewData : [Curso] = [
        Curso(imagenEstado: "chichuahua.png",
              nombreCurso: "EVALUACIÓN FORMATIVA",
              nombreEstado: "CHIHUAHUA",
              cursoModalidad: "HOME OFFICE",
              cursoDuracion: "20 HORAS",
              cursoUrl: "WWW.GOOGLE.COM",
              cursoStatus: "PENDIENTE"),
        Curso(imagenEstado: "queretaro.png",
              nombreCurso: "DIDÁCTICA DE ELEMENTOS DE EJECUCIÓN",
              nombreEstado: "QUERETARO",
              cursoModalidad: "PRESENCIAL",
              cursoDuracion: "20 HORAS",
              cursoUrl: "WWW.GOOGLE.COM",
              cursoStatus: "PENDIENTE"),
        Curso(imagenEstado: "quintanaroo.png",
              nombreCurso: "EL PROFESOR Y LA DIDÁCTICA",
              nombreEstado: "QUINTANA, ROO",
              cursoModalidad: "HOME OFFICE",
              cursoDuracion: "120 HORAS",
              cursoUrl: "WWW.GOOGLE.COM",
              cursoStatus: "PENDIENTE"),
        Curso(imagenEstado: "veracruz.png",
              nombreCurso: "EVALUACIÓN BASADA EN OBJETIVOS",
              nombreEstado: "VERACRUZ",
              cursoModalidad: "PRESENCIAL",
              cursoDuracion: "120 HORAS",
              cursoUrl: "WWW.GOOGLE.COM",
              cursoStatus: "PENDIENTE"),
        Curso(imagenEstado: "tabasco.png",
              nombreCurso: "MOTIVACIÓN EN EL AULA",
              nombreEstado: "TABASCO",
              cursoModalidad: "PRESENCIAL",
              cursoDuracion: "120 HORAS",
              cursoUrl: "WWW.GOOGLE.COM",
              cursoStatus: "PENDIENTE")    ] //Cierra arreglo
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuBtn.target = revealViewController()
                sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createFlowLayout()
        configureSearchController()
    }
    
    
    //buscar2
    private func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.hidesSearchBarWhenScrolling = false
        self.navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.placeholder = "CURSO|ESTADO|MODALIDAD|INSTITUCIÒN"
        searchController.searchBar.backgroundColor = .white
        
    }
    
    private func createFlowLayout() -> UICollectionViewCompositionalLayout {
      let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(380),
                                           heightDimension: .absolute(190))
      let item = NSCollectionLayoutItem(layoutSize: itemSize)
      item.contentInsets = NSDirectionalEdgeInsets(top: 10.0, leading: 10.0, bottom: 10.0, trailing: 10.0)

      let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                             heightDimension: .fractionalHeight(0.3))
      let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

      let section = NSCollectionLayoutSection(group: group)

      let layout = UICollectionViewCompositionalLayout(section: section)
      return layout
    }

}
extension PruebaViewController: UICollectionViewDelegate,UICollectionViewDataSource,UISearchResultsUpdating,UISearchBarDelegate {
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if searching{
          return searchedCursos.count
      }else{
          return collectionViewData.count
      }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
   
      
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "custom cell", for: indexPath) as? CustomCollectionViewCell else {
      fatalError()
       }
    
      
      if searching{
          cell.imageView.image = UIImage(named: searchedCursos[indexPath.row].imagenEstado)
          cell.label.text = searchedCursos[indexPath.row].nombreCurso
          cell.label2.text = searchedCursos[indexPath.row].nombreEstado
          cell.label3.text = searchedCursos[indexPath.row].cursoModalidad
          cell.label4.text = searchedCursos[indexPath.row].cursoDuracion
          cell.label5.text = searchedCursos[indexPath.row].cursoUrl
          cell.label6.text = searchedCursos[indexPath.row].cursoStatus
      }else{
          cell.imageView.image = UIImage(named: collectionViewData[indexPath.row].imagenEstado)
          cell.label.text = collectionViewData[indexPath.row].nombreCurso
          cell.label2.text = collectionViewData[indexPath.row].nombreEstado
          cell.label3.text = collectionViewData[indexPath.row].cursoModalidad
          cell.label4.text = collectionViewData[indexPath.row].cursoDuracion
          cell.label5.text = collectionViewData[indexPath.row].cursoUrl
          cell.label6.text = collectionViewData[indexPath.row].cursoStatus
      }
    
      cell.layer.borderColor = UIColor.black.cgColor
      cell.layer.borderWidth = 2
    return cell
  }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty{
            searching = true
            searchedCursos.removeAll()
            
            for curso in collectionViewData{
                if curso.nombreCurso.lowercased().contains(searchText.lowercased())
                    || curso.nombreEstado.lowercased().contains(searchText.lowercased())
                    || curso.cursoModalidad.lowercased().contains(searchText.lowercased()){
                    searchedCursos.append(curso)
                }
            }
            
        }else{
            searching = false
            searchedCursos.removeAll()
            searchedCursos = collectionViewData
        }
        
        collectionView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searching = false
            searchedCursos.removeAll()
            collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if searching{
            print("Diste clic cuso1")
        }else{
            print("Clic en el curso else")
        }
    }
}
