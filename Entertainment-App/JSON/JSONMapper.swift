
import Foundation

struct StaticJSONMapper{
    static func decode<T: Decodable>(file: String, type: T.Type)throws -> T{
        
        
        guard let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else{
            
            throw MappingError.failedToDecodeJSON
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        
        return try decoder.decode(T.self, from: data)
        
        
    
        
    }
}

extension StaticJSONMapper{
    enum MappingError: Error{
        case failedToDecodeJSON
    }
}
