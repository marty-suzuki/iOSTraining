> 参考 [mixi-inc/iOSTraining 7.2 NSFileManager](https://github.com/mixi-inc/iOSTraining/wiki/7.2-NSFileManager)

[File System Programming Guide](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672)

[ファイルシステムプロ グラミングガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/FileSystemProgrammingGuide.pdf)

[NSFileManager Class Reference](https://developer.apple.com/reference/foundation/nsfilemanager)

## iOS のファイルシステム

> ![filesystem_in_iOS](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/7.2/filesystem_in_iOS.png)

> [ファイルシステムプロ グラミングガイド](https://developer.apple.com/jp/devcenter/ios/library/documentation/FileSystemProgrammingGuide.pdf) から引用

| path | 説明 |
|-----|----|
| <Application_Home>/Documents/ | ユーザが作り出したデータをファイルとして保存したい場合ここに保存してください。iTunes によってバックアップされます。 |
| <Application_Home>/Library/Caches| システムが再度取得可能なデータをキャッシュしておきたい場合はここに保存してください。iTunes によってバックアップされません。|
| <Application_Home>/tmp/ | 一時的に保存しておきたいデータがればここに保存してください。必要がなくなった際にはその都度削除するようにしてください。iTunes にはバックアップされません。|

## Document ディレクトリパス取得

```swift
let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
print(urls.first)
```

console log

```
Optional(file:///Users/Username/Library/Developer/CoreSimulator/Devices/CE1017AE-5E14-488C-B0B3-B364453B0413/data/Containers/Data/Application/F47D5EB7-5271-4528-85D6-A7E85B9D13B8/Documents/)
```

URL ベースのパスが取得できます。シュミレータだと Mac のファイルシステムパスが表示されます。

この URL に保存したいファイル名を追加して新たな URL を生成すれば保存が可能です。

## データの保存

```swift
let data: Data = ...
let fileUrl: URL ...

FileManager.default.createFile(atPath: fileUrl.path, contents: data, attributes: nil)
```

## データの読み込み

```swift
if FileManager.default.fileExists(atPath: fileUrl.path) { //[1] ファイルパスが存在するかどうかを確認
    let data = FileManager.default.contents(atPath: fileUrl.path)
    print(data)
} else {
    print("not exist")
}
```

## ファイルの削除

```swift
guard let fileUrl = fileURL(), FileManager.default.fileExists(atPath: fileUrl.path) else {
    print("not exist")
    return
}
do {
    try FileManager.default.removeItem(atPath: fileUrl.path)
} catch {
    print("failed")
}
```

## Codableを組み合わせて利用

[4.1.1 Codableを利用したシリアライズとデシリアライズ](./4-1-1_Codable.md)で説明しているCodableを使うことで、オブジェクトをシリアライズ・デシリアライズして保存・読み込みを簡単に実現できるようになります。

```swift
struct User: Codable {
    let id: Int
    let name: String
}
```

### 保存

```swift
let fileURL: URL = ...
let user = User(id: 1234, name: "Biff")

do {
    // UserをData型に変換
    let data = try JSONEncoder().encode(user)

    // ファイルが存在したる場合は削除
    if FileManager.default.fileExists(atPath: fileURL.path) {
        try FileManager.default.removeItem(at: fileURL)
    }

    // ファイルを保存
    FileManager.default.createFile(atPath: fileURL.path, contents: data, attributes: nil)
    print("success")
} catch let e {
    print("failed \(e)")
}
```

### 読み込み

```swift
let fileURL: URL = ...

// ファイルが存在するかの確認
guard FileManager.default.fileExists(atPath: fileURL.path) else {
    print("not exist")
    return
}

// URLからデータを取得
guard let data = FileManager.default.contents(atPath: fileURL.path).first else {
    return
}

do {
    // DataをUser型に変換
    let user = try JSONDecoder().decode(User.self, from: data)
    print(user.id) // 1234
    print(user.name) // Biff
} catch let e {
    print("failed \(e)")
}
```

## 問題

下図の画面を作成して、以下の仕様を満たすプログラムを作成してください。

- save ボタンを押すと textField のテキストが保存される。
- プロセスを切って再度プログラムを起動して read ボタンを押すと textField に保存したテキストが表示される
- delete ボタンで保存されたテキストを削除する

![practice](./images/3_2/image1.png)
