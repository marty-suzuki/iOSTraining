# Q. enumのrawValueとは？

enumのrawValueについて説明します。

```swift
enum Gender: Int {
    case man = 0
    case female = 1
}
```

というenumを定義した場合に

```swift
enum Gender: Int {
    case man = 0
    case female = 1

    init?(rawValue: Int) {
        switch rawValue {
        case 0:
            self = .man
        case 1:
            self = .female
        default:
            return nil
        }
    }
}
```

のようなinitializerが暗黙的に実装されます。
そのため

```swift
let g = Gender(rawValue: 0)
print(g) // Optional(Gender.man)
```

のように暗黙的に実装されているinitializerを使って、IntからGenderを生成することができるようになります。

ちなみに

```swift
enum Gender {
    case man
    case female
}
```

と定義した場合には、enumに対して何かしらの型が紐付いていないため、暗黙的なinitializerは生成されません。

そのため

```swift
let g = Gender.man
```

のような型でのみ初期化が可能になります。
