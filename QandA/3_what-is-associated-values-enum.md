# Q. enumの.some（Associated Values）とは？

enumのAssociated Values（.someのほう）について説明します。

例えば、プロフィールで使いたい要素をenum化したとします。
例として、 名前・年齢・自己紹介があるとしましょう。

これを通常のenumで定義した場合

```swift
enum Profile {
    case name
    case age
    case introduction
}
```

のようにになるかと思います。

この要素に対して、値をもたせたくなる場合があります。その場合にAssociated Valuesを利用すると

```swift
enum Profile {
    case name(String)
    case age(Int)
    case introduction(String)
}
```

のように定義ができます。
実際に利用する場合は

```swift
let p1 = Profile.name("会津太郎")
let p2 = Profile.age(26)
let p3 = Profile.introduction("Welcome to Tsuruga castle!")
```

ように変数（定数）化ができ

```swift
switch p1 {
case let .name(value):
    print(value) // 会津太郎
case let .age(value):
    print(value) // p1の場合は、ageの列挙子を利用してないのでこの分岐に入らない
case let .introduction(value):
    print(value) // p1の場合は、introductionの列挙子を利用していないのでこの分岐に入らない
}
```

のようにenumの列挙子に対してAssociated Valueとして紐づけた値を取得することができます。
ちなみにswitch-caseだけでなく

```swift
if case let .age(value) = p2 {
    print(value) // 26
}
```

のように、if（guardでも可）で任意の1つの列挙子に対してAssociated Valueを取り出すことも可能です。
