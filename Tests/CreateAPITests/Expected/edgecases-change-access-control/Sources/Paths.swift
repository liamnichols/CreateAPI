// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import APIClient
import HTTPHeaders

extension Paths {
    static var pet: Pet {
        Pet(path: "/pet")
    }

    struct Pet {
        /// Path: `/pet`
        let path: String

        /// Add a new pet to the store
        func post(_ body: edgecases_change_access_control.Pet) -> Request<Void> {
            .post(path, body: body)
        }

        /// Update an existing pet
        func put(_ body: edgecases_change_access_control.Pet) -> Request<Void> {
            .put(path, body: body)
        }
    }
}

extension Paths.Pet {
    var findByStatus: FindByStatus {
        FindByStatus(path: path + "/findByStatus")
    }

    struct FindByStatus {
        /// Path: `/pet/findByStatus`
        let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        func get(status: [Status]) -> Request<[edgecases_change_access_control.Pet]> {
            .get(path, query: makeGetQuery(status))
        }

        private func makeGetQuery(_ status: [Status]) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("status", status.map(\.asQueryValue).joined(separator: ","))
            return query
        }

        enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}

extension Paths.Pet {
    var findByStatus2: FindByStatus2 {
        FindByStatus2(path: path + "/findByStatus2")
    }

    struct FindByStatus2 {
        /// Path: `/pet/findByStatus2`
        let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        func get(status: [Status]? = nil) -> Request<[edgecases_change_access_control.Pet]> {
            .get(path, query: makeGetQuery(status))
        }

        private func makeGetQuery(_ status: [Status]?) -> [(String, String?)] {
            var query: [(String, String?)] = []
            for value in status ?? [] {
                query.addQueryItem("status", value.asQueryValue)
            }
            return query
        }

        enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}

extension Paths.Pet {
    var findByTags: FindByTags {
        FindByTags(path: path + "/findByTags")
    }

    struct FindByTags {
        /// Path: `/pet/findByTags`
        let path: String

        /// Finds Pets by tags
        ///
        /// Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
        func get(tags: [String]) -> Request<[edgecases_change_access_control.Pet]> {
            .get(path, query: makeGetQuery(tags))
        }

        private func makeGetQuery(_ tags: [String]) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("tags", tags.map(\.asQueryValue).joined(separator: ","))
            return query
        }
    }
}

extension Paths.Pet {
    func petID(_ petID: Int) -> WithPetID {
        WithPetID(path: path + "/" + String(petID))
    }

    struct WithPetID {
        /// Path: `/pet/{petId}`
        let path: String

        /// Find pet by ID
        ///
        /// Returns a single pet
        var get: Request<edgecases_change_access_control.Pet> {
            .get(path)
        }

        /// Updates a pet in the store with form data
        func post(_ body: PostRequest? = nil) -> Request<Void> {
            .post(path, body: body)
        }

         struct PostRequest: Encodable {
            /// Updated name of the pet
            var name: String?
            /// Updated status of the pet
            var status: String?

            init(name: String? = nil, status: String? = nil) {
                self.name = name
                self.status = status
            }

            func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(name, forKey: "name")
                try values.encodeIfPresent(status, forKey: "status")
            }
        }

        /// Deletes a pet
        var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths.Pet.WithPetID {
    var uploadImage: UploadImage {
        UploadImage(path: path + "/uploadImage")
    }

    struct UploadImage {
        /// Path: `/pet/{petId}/uploadImage`
        let path: String

        /// Uploads an image
        func post(_ body: PostRequest? = nil) -> Request<edgecases_change_access_control.APIResponse> {
            .post(path, body: body)
        }

         struct PostRequest: Encodable {
            /// Additional data to pass to server
            var additionalMetadata: String?
            /// File to upload
            var file: String?

            init(additionalMetadata: String? = nil, file: String? = nil) {
                self.additionalMetadata = additionalMetadata
                self.file = file
            }

            func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(additionalMetadata, forKey: "additionalMetadata")
                try values.encodeIfPresent(file, forKey: "file")
            }
        }
    }
}

extension Paths {
    static var store: Store {
        Store(path: "/store")
    }

    struct Store {
        /// Path: `/store`
        let path: String
    }
}

extension Paths.Store {
    var inventory: Inventory {
        Inventory(path: path + "/inventory")
    }

    struct Inventory {
        /// Path: `/store/inventory`
        let path: String

        /// Returns pet inventories by status
        ///
        /// Returns a map of status codes to quantities
        var get: Request<[String: Int]> {
            .get(path)
        }
    }
}

extension Paths.Store {
    var order: Order {
        Order(path: path + "/order")
    }

    struct Order {
        /// Path: `/store/order`
        let path: String

        /// Place an order for a pet
        func post(_ body: edgecases_change_access_control.Order) -> Request<edgecases_change_access_control.Order> {
            .post(path, body: body)
        }
    }
}

extension Paths.Store.Order {
    func orderID(_ orderID: Int) -> WithOrderID {
        WithOrderID(path: path + "/" + String(orderID))
    }

    struct WithOrderID {
        /// Path: `/store/order/{order_id}`
        let path: String

        /// Find purchase order by ID
        ///
        /// For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions
        var get: Request<edgecases_change_access_control.Order> {
            .get(path)
        }

        /// Delete purchase order by ID
        ///
        /// For valid response try integer IDs with value < 1000. Anything above 1000 or nonintegers will generate API errors
        var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths {
    static var user: User {
        User(path: "/user")
    }

    struct User {
        /// Path: `/user`
        let path: String

        /// Create user
        ///
        /// This can only be done by the logged in user.
        func post(_ body: edgecases_change_access_control.User) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    var createWithArray: CreateWithArray {
        CreateWithArray(path: path + "/createWithArray")
    }

    struct CreateWithArray {
        /// Path: `/user/createWithArray`
        let path: String

        /// Creates list of users with given input array
        func post(_ body: [edgecases_change_access_control.User]) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    var createWithList: CreateWithList {
        CreateWithList(path: path + "/createWithList")
    }

    struct CreateWithList {
        /// Path: `/user/createWithList`
        let path: String

        /// Creates list of users with given input array
        func post(_ body: [edgecases_change_access_control.User]) -> Request<Void> {
            .post(path, body: body)
        }
    }
}

extension Paths.User {
    var login: Login {
        Login(path: path + "/login")
    }

    struct Login {
        /// Path: `/user/login`
        let path: String

        /// Logs user into the system
        func get(username: String, password: String) -> Request<String> {
            .get(path, query: makeGetQuery(username, password))
        }

        enum GetResponseHeaders {
            /// Calls per hour allowed by the user
            @available(*, deprecated, message: "Deprecated")
            static let rateLimit = HTTPHeader<Int>(field: "X-Rate-Limit")
            /// Date in UTC when toekn expires
            static let expiresAfter = HTTPHeader<Date>(field: "X-Expires-After")
        }

        private func makeGetQuery(_ username: String, _ password: String) -> [(String, String?)] {
            var query: [(String, String?)] = []
            query.addQueryItem("username", username.asQueryValue)
            query.addQueryItem("password", password.asQueryValue)
            return query
        }
    }
}

extension Paths.User {
    var logout: Logout {
        Logout(path: path + "/logout")
    }

    struct Logout {
        /// Path: `/user/logout`
        let path: String

        /// Logs out current logged in user session
        var get: Request<Void> {
            .get(path)
        }
    }
}

extension Paths.User {
    func username(_ username: String) -> WithUsername {
        WithUsername(path: path + "/" + username)
    }

    struct WithUsername {
        /// Path: `/user/{username}`
        let path: String

        /// Get user by user name
        var get: Request<edgecases_change_access_control.User> {
            .get(path)
        }

        /// Updated user
        ///
        /// This can only be done by the logged in user.
        func put(_ body: edgecases_change_access_control.User) -> Request<Void> {
            .put(path, body: body)
        }

        /// Delete user
        ///
        /// This can only be done by the logged in user.
        var delete: Request<Void> {
            .delete(path)
        }
    }
}

extension Paths {
    static var fake: Fake {
        Fake(path: "/fake")
    }

    struct Fake {
        /// Path: `/fake`
        let path: String

        /// To test enum parameters
        func get(parameters: GetParameters? = nil) -> Request<Void> {
            .get(path, query: parameters?.asQuery())
        }

         struct GetParameters {
            var enumQueryStringArray: [EnumQueryStringArray]?
            var enumQueryString: EnumQueryString?
            var enumQueryInteger: Int?

            enum EnumQueryStringArray: String, Codable, CaseIterable {
                case greaterThan = ">"
                case dollar = "$"
            }

            enum EnumQueryString: String, Codable, CaseIterable {
                case abc = "_abc"
                case minusefg = "-efg"
                case xyz = "(xyz)"
            }

            init(enumQueryStringArray: [EnumQueryStringArray]? = nil, enumQueryString: EnumQueryString? = nil, enumQueryInteger: Int? = nil) {
                self.enumQueryStringArray = enumQueryStringArray
                self.enumQueryString = enumQueryString
                self.enumQueryInteger = enumQueryInteger
            }

            func asQuery() -> [(String, String?)] {
                var query: [(String, String?)] = []
                for value in enumQueryStringArray ?? [] {
                    query.addQueryItem("enum_query_string_array", value.asQueryValue)
                }
                query.addQueryItem("enum_query_string", enumQueryString?.asQueryValue)
                query.addQueryItem("enum_query_integer", enumQueryInteger?.asQueryValue)
                return query
            }
        }

        /// Fake endpoint for testing various parameters

        func post(_ body: PostRequest? = nil) -> Request<Void> {
            .post(path, body: body)
        }

         struct PostRequest: Encodable {
            /// None
            var integer: Int?
            /// None
            var int32: Int?
            /// None
            var int64: Int?
            /// None
            var number: Double
            /// None
            var float: Double?
            /// None
            var double: Double
            /// None
            var string: String?
            /// None
            var patternWithoutDelimiter: String
            /// None
            var byte: String
            /// None
            var binary: String?
            /// None
            var date: String?
            /// None
            var dateTime: Date?
            /// None
            var password: String?
            /// None
            var callback: String?

            init(integer: Int? = nil, int32: Int? = nil, int64: Int? = nil, number: Double, float: Double? = nil, double: Double, string: String? = nil, patternWithoutDelimiter: String, byte: String, binary: String? = nil, date: String? = nil, dateTime: Date? = nil, password: String? = nil, callback: String? = nil) {
                self.integer = integer
                self.int32 = int32
                self.int64 = int64
                self.number = number
                self.float = float
                self.double = double
                self.string = string
                self.patternWithoutDelimiter = patternWithoutDelimiter
                self.byte = byte
                self.binary = binary
                self.date = date
                self.dateTime = dateTime
                self.password = password
                self.callback = callback
            }

            func encode(to encoder: Encoder) throws {
                var values = encoder.container(keyedBy: StringCodingKey.self)
                try values.encodeIfPresent(integer, forKey: "integer")
                try values.encodeIfPresent(int32, forKey: "int32")
                try values.encodeIfPresent(int64, forKey: "int64")
                try values.encode(number, forKey: "number")
                try values.encodeIfPresent(float, forKey: "float")
                try values.encode(double, forKey: "double")
                try values.encodeIfPresent(string, forKey: "string")
                try values.encode(patternWithoutDelimiter, forKey: "pattern_without_delimiter")
                try values.encode(byte, forKey: "byte")
                try values.encodeIfPresent(binary, forKey: "binary")
                try values.encodeIfPresent(date, forKey: "date")
                try values.encodeIfPresent(dateTime, forKey: "dateTime")
                try values.encodeIfPresent(password, forKey: "password")
                try values.encodeIfPresent(callback, forKey: "callback")
            }
        }

        /// To test "client" model
        func patch(_ body: edgecases_change_access_control.Client) -> Request<edgecases_change_access_control.Client> {
            .patch(path, body: body)
        }
    }
}

enum Paths {}

extension Bool {
    var asQueryValue: String {
        self ? "true" : "false"
    }
}

extension Date {
    var asQueryValue: String {
        ISO8601DateFormatter().string(from: self)
    }
}

extension Double {
    var asQueryValue: String {
        String(self)
    }
}

extension Int {
    var asQueryValue: String {
        String(self)
    }
}

extension String {
    var asQueryValue: String {
        self
    }
}

extension URL {
    var asQueryValue: String {
        absoluteString
    }
}

extension RawRepresentable where RawValue == String {
    var asQueryValue: String {
        rawValue
    }
}

extension Array where Element == (String, String?) {
    mutating func addQueryItem(_ name: String, _ value: String?) {
        guard let value = value, !value.isEmpty else { return }
        append((name, value))
    }
}
