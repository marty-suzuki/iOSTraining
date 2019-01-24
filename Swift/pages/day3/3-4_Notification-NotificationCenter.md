> 参考 [mixi-inc/iOSTraining
7.4 NSNotification、NSNotificationCenter を用いた通知](https://github.com/mixi-inc/iOSTraining/wiki/7.4-NSNotification%E3%80%81NSNotificationCenter-%E3%82%92%E7%94%A8%E3%81%84%E3%81%9F%E9%80%9A%E7%9F%A5)

[Notification Class Reference](https://developer.apple.com/reference/foundation/nsnotification)

[NotificationCenter Class Reference](https://developer.apple.com/reference/foundation/nsnotificationcenter)

[Notification Programming Topics](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/Notifications/Introduction/introNotifications.html#//apple_ref/doc/uid/10000043-SW1)

[Cocoa Fundamentals Guide](https://developer.apple.com/jp/documentation/Cocoa/Conceptual/CocoaFundamentals/CommunicatingWithObjects/chapter_6_section_6.html)

3つ目の通知パターンは Notification、NotificationCenter を用いた通知です。

この通知パターンは NotificationCenter のシングルトンインスタンスによるブロードキャストな通知を実現することができます。

> ![notification](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/7.4/notification.png)
>
> [Cocoa Fundamentals Guide](https://developer.apple.com/jp/documentation/Cocoa/Conceptual/CocoaFundamentals/CommunicatingWithObjects/chapter_6_section_6.html) より引用

## 通知の実装概要
通知を実現するためには以下のステップが必要です

1. 通知を受けたいインスタンスに対して NotificationCenter にオブザーバ登録
2. NotificationCenter に通知を post
3. オブザーバ登録の解除

## 1. NotificationCenter にオブザーバ登録

```swift
//[1]オブザーバとして登録
let observer: NSObjectProtocol = NotificationCenter.default
    .addObserver(forName: Notification.Name(rawValue: "pushNotificationTapped"), //[2] 通知名
                 object: nil, //[3] sender の指定
                 queue: OperationQueue.main, //[4] 追加するQueueの指定
                 using: { notification in // do something }) //[5] ハンドラーの指定
```

### [1]オブザーバとして登録

オブザーバオブジェクトを指定します。

### [2] 通知名

指定の通知名の通知を受け取ることが可能。nil を設定するとすべてのオブジェクトから通知を受け取る。

### [3] sender の指定

指定のオブジェクトからのみ通知を受けたいときに指定。nil を設定するとすべてのオブジェクトから通知を受け取る。

### [4] 追加するQueueの指定

ハンドラを実行するQueueの指定。nil を指定すると、postされたNotificationと同じスレッドで実行される。

### [5] ハンドラーの指定

Notificationを受け取った際の処理を指定。

## 2. NotificationCenter に通知を post

通知を post する際に userInfo として任意のデータ(Dictionary)を指定することができます。通知の受取手は Notification の userInfo プロパティでこのデータにアクセスすることが可能です。

```swift
let dict = ["key" : "value"]
let name =  Notification.Name(rawValue: "pushNotificationTapped")
NotificationCenter.default.post(name: name, object: nil, userInfo: dict)
```

## 3. オブザーバ登録の解除

Notificationの監視が必要なくたった場合、監視登録を解除する必要があります。

```swift
let observer: NSObjectProtocol = NotificationCenter.default.addObserver(...)

NotificationCenter.default.removeObserver(observer)
```

## 問題

tabBarController プロジェクトを作成し、下記の仕様を満たすプログラムを作成してください。

- firstViewController で ボタンを押すと任意の文字列を持った userInfo を用いて通知を post する
- secondViewController で通知を取得し、上記の任意の文字列をラベルにセットする

![practice](https://raw.github.com/mixi-inc/iOSTraining/master/Doc/Images/7.4/practice.png)

この解答は[samples/day3/sample3-4](../../samples/day3/sample3-4)にあります。
