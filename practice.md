# iOS プログラミング ナレッジ集
-
ここではiOS開発における知識、ノウハウを蓄積していくことを目的としています。よく行う実装、よく行う設計、効率化の知識などをここに蓄積していきたいと思います。

---


### SwiftでのSingletonの書き方
```swift
class Singleton {
    class var sharedInstance : Singleton {
        struct Static {
            static let instance : Singleton = Singleton()
        }
        return Static.instance
    }
}
```
`struct`をネストすることで実装できる。

---