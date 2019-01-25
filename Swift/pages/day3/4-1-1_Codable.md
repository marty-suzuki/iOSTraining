> 参考 [mixi-inc/iOSTraining 6.2 JSONのシリアライズとデシリアライズ](https://github.com/mixi-inc/iOSTraining/wiki/6.2-JSON%E3%81%AE%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA%E3%81%A8%E3%83%87%E3%82%B7%E3%83%AA%E3%82%A2%E3%83%A9%E3%82%A4%E3%82%BA)

WebAPIやJSONRPCを利用する際、よくフォーマットとして利用されるのがJSONです。Foundation FrameworkにもJSONのシリアライズやデシリアライズを行う機能が含まれています。この章ではその機能の利用法を説明します。

リファレンスはこちら [https://developer.apple.com/documentation/swift/codable](https://developer.apple.com/documentation/swift/codable)

# Codable

Swift4で登場した[protocol Codable](https://developer.apple.com/documentation/swift/codable)をオブジェクトに採用することで、JSONのシリアライズ、デシリアライズができます。
`Codable`は[protocol Decodable](https://developer.apple.com/documentation/swift/decodable)と[protocol Encodable](https://developer.apple.com/documentation/swift/encodable)のtypealiasです。

```swift
typealias Codable = Decodable & Encodable
```

## Decodable

`Data`を[JSONDecoder](https://developer.apple.com/documentation/foundation/jsondecoder)の`func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T`に渡すことで、`Decodalbe`を採用したオブジェクトにデシリアライズすることができます。

```swift
struct User: Decodable {
    var id: Int
    var name: String
}

let jsonData: Data = """
{
    "id": 1234,
    "name": "Bob"  
}
""".data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print(user.name) // Prints "Bob"
} catch let e {
    //
}
```

上記の場合、Userオブジェクトで定義されているproperty名とJSONのキー名が一致しているため、DecodableをUserに採用するだけでデシリアライズが可能な状態になっています。

Userオブジェクトで定義されているproperty名とJSONのキー名が一致していない場合もあります。
[protcol CodingKey](https://developer.apple.com/documentation/swift/codingkey)を利用することで、property名とJSONのキー名が一致していない場合でも対応することが可能です。以下ように実装できます。

```swift
struct User: Decodable {
    var id: Int
    var name: String

    private enum CodingKeys: String, CodingKey {
        case id
        case name = "user_name"
    }
}

let jsonData: Data = """
{
    "id": 1234,
    "user_name": "Bob"  
}
""".data(using: .utf8)!

do {
    let user = try JSONDecoder().decode(User.self, from: jsonData)
    print(user.name) // Prints "Bob"
} catch let e {
    //
}
```

CodingKeyを採用したオブジェクト名が`CodingKeys`である場合は、暗黙的に`init(from decoder: Decoder) throws`が実装された状態になりますが、別な名前をつけた場合は以下のような実装が必要になります。

```swift
struct User: Decodable {
    var id: Int
    var name: String

    private enum Keys: String, CodingKey {
        case id
        case name = "user_name"
    }

    init(from decoder: Decoder) throws {
        var container = try decoder.container(keyedBy: Keys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}
```

配列をデシリアライズしたい場合は、以下のようなに`[User].self`で型を指定することができます。

```swift
let jsonData: Data = """
[
    {
        "id": 1234,
        "name": "Bob"
    },
    {
        "id": 12345,
        "name": "Tom"
    }
]
""".data(using: .utf8)!

do {
    let users = try JSONDecoder().decode([User].self, from: jsonData)
    users.forEach {
        print($0.name)
    }
} catch let e {
    //
}
```

## Encodable

`Encodable`を採用したオブジェクトを、[JSONEncoder](https://developer.apple.com/documentation/foundation/jsonencoder)の`func encode<T: Encodable>(_ value: T) throws -> Data`に渡すことで、`Data`にシリアライズすることができます。

```swift
struct User: Encodable {
    var id: Int
    var name: String
}

let user: [User] = ...

do {
    let data = try JSONEncoder().encode(users)
    let jsonString = String(data: data, encoding: .utf8)!
    print(jsonString) // [{"id":1234,"name":"Bob"},{"id":12345,"name":"Tom"}]
}
```

# 参考

Swift4未満で利用していた[JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)について、
[4.1.2 JSONSerializationを利用したシリアライズとデシリアライズ](./4-1-2_JSONSerialization.md)で触れています。
