import Foundation

public protocol RepositoryProtocol {
    
    associatedtype AssociatedModel
    
    func getAll () -> [AssociatedModel]
    
    func get ( _ id: Int ) -> AssociatedModel
    
    func update ( _ newObject: AssociatedModel ) -> Void
    
    func delete ( _ targetObject: AssociatedModel ) -> Void
    
}
