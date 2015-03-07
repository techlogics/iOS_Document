# Swiftコーディングガイド
-
Swiftのコーディングガイドです。

-

### 型について
基本的に値を代入して初期化する場合は型を指定せず型推論を使い、指定しないと混乱を招く可能性ある、または指定すべき時は下記のような形で指定する。

```swift
let str = "some string" // ◯
let str: String = "some string"　// ×

var strArray: [String] = [] // ×
var strArray = [String]() // ◯
```