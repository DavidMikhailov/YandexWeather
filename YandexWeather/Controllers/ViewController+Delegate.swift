//
//  ViewController+Delegate.swift
//  YandexWeather
//
//  Created by Давид Михайлов on 15.01.2021.
//

import UIKit

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !tableView.isEditing {
            lastTimeSelectedRowIndexPath = indexPath
            let city = cities.list[indexPath.row]
            let vc = DetailViewController(forCity: city)
            navigationController?.pushViewController(vc, animated: true)
        } else if tableView.indexPathsForSelectedRows != nil {
            navigationItem.leftBarButtonItem?.isEnabled = true
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if tableView.indexPathsForSelectedRows == nil {
            navigationItem.leftBarButtonItem?.isEnabled = false
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { _, _, complete in

            CitiesImpl.shared.removeCity(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            complete(true)
        }

        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
        
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        if let city = searchBar.text?.capitalized, !city.isEmpty {
            showDetailWeatherFor(city: city)
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.resignFirstResponder()
        searchBar.showsCancelButton = false
    }
    
    
}
