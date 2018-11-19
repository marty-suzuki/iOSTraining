# Q. getter/setterとは？

getter / setterというのは
プロパティー（変数）を取得したり、代入する時に
暗黙的(≒使っているつもりはないが使われている)に呼ばれる処理のことをさします。

何も追加実装しなければそのプロパティの代入と取得だけになります。

これはオブジェクト指向のカプセル化という考え方をベースに理解していくのがいいです。

```swift
class Dog {
  // name を変更するスコープをprivateにする
  private var name: String
  init(name: String) { self.name = name }

  // nameを変更するメソッドを後悔
  func setName(name: String) { self.name = name }
}

var myDog = Dog(name: "choco")
myDog.setName(name: "cocoa") // メソッドつかって更新する
```

ほとんどの言語だと、こうしないといけないんですが、
Swiftはプロパティにgetter/setterを定義して、代入文が使えるようになってるんです。

```swift
class Dog {
  private var _name: String
  var name: String
  {
    set {
       // _nameに変数を設定する戦略を書く
    }
    get {
       // _nameに変数を取得するする戦略を書く
    }
  }
}

var myDog = Dog(name: "choco")
myDog.name = "cocoa" // setterをつかって更新する
```
