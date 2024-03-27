import Foundation

public protocol RepositoryProtocol {
    
    associatedtype AssociatedModel
    
    func getAll () -> [AssociatedModel]
    
}
