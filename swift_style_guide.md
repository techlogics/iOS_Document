# Swiftコーディングガイド
-
Swiftのコーディングガイドです。
-
### 型について
基本的に値を代入して初期化する場合は型を指定せず型推論を使い、指定しないと混乱を招く可能性ある、または指定すべき時は下記のような形で指定する。

```swift
let str = "some string" // ◯
let str: String = "some string"　// ×

let x: Int = 0 // Int, UInt, NSInteger, NSUIntergerの区別
let pi: Float = 3.14 // Float, Double, CGFloatの区別

var strArray: [String] = [] // ×
var strArray = [String]() // ◯
```

### オプショナルについて
オプショナルをアンラップする際は可能な限り`if let`構文を使い安全にアンラップする。暗黙的アンラップ(!)は避けるのが望ましい

```swift
if let foo = foo {
	// アンラップされたfoo(letの直後の)を使う
} else {
	// fooがnilだった時の処理
}

// オプショナルチェイニングを使ってアンラップする
foo?.doSomeThingIfFooIsNotNil()
// fooがnilでなければ関数が呼ばれる。nilだと呼ばれない

```