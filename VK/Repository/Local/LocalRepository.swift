import Combine
import Foundation

typealias Entity = Any

protocol LocalRepository {
    func create(city: Entity) -> AnyPublisher<Void, Error>
    func read(id: UUID) -> AnyPublisher<Entity, Error>
    func readAll() -> AnyPublisher<[Entity], Never>
    func update(audio: Entity) -> AnyPublisher<Void, Error>
    func delete(audio: Entity) -> AnyPublisher<Void, Error>
}
