# Tech Logics iOSアプリ開発者養成ドキュメント


## イントロダクション

現在、世界は2007年のiPhoneを機にモバイルファーストの時代に突入しています。ゆえに当然モバイル開発のスキルも必要となることが増えるのは当然のことでしょう。この講座はiPhoneアプリ、すなわちiOSアプリの開発の基礎的なことを勉強し、これから本格的にiOSアプリを開発していくための導入の講座です。なお、使用する言語はAppleが2014年に発表されたSwiftで進めたいと思います。対象とする読者はプログラミング言語を学習したことがある人とします。

---

## Swift 言語

Swiftはモダンな言語要素を多く取り入れたわかりやすい言語です。基本的な文法を紹介していきます。 
### コメント
コメントの書き方はObjective-Cと同じで、// で1行コメント、/**/ で複数行コメントになります。
```swift
// これはコメント

/* 
これもコメント
これもこれもコメント
これもこれもこれもコメント
*/
```
 
### 変数 
#### 変数 
```swift
var someInt: Int
var someFloat: Float
var someBool: Bool
var someString: String
```

このように var の後に変数名を続け、コロンの後に型を書きます。また初期化した時に自動で型を推測してくれる型推論の機能もあります。
```swift
var someInt = 1 // Int型になる
var someFloat = 0.0 // Float型になる
var someBool = true // Bool型になる
var someString = "Hello, TechLogics!!" // String型になる
```
上のように型を書かなくても自動で型を推測してくれる。
#### 定数
Swiftで定数を宣言するには let を使う。
```swift
let anotherSomeInt = 1234
let anotherSomeFloat = 0.0
let anotherSomeBool = false
let anotherSomeString = "TechLogics is awesome!"
```
var と違うところは、宣言と同時に初期化しなければならないこと、そして一度初期化したら再び値の代入はできなくなるので注意する。
> [The Swift Programming Language - The Basics](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-XID_467)  

### オプショナル型
Swiftの特徴としてこのオプショナル型というものがあります。Swiftにはnilという型がある。オプショナルはこのnilそして通常の値を両方を持つことができます。
```swift
// オプショナル型の変数を宣言
var name: String?
var number: Int? = 100
```
オプショナル型はそのままでは通常の値として扱うことは出来ません。そのためアンラップをしてあげることが必要となります。アンラップするには!をつけることでできます。この方法でアンラップする場合、nil出ないことを保証する必要があります、もしnilの変数をアンラップするとエラーになります。
```swift
name!	// これはエラー
number!	// 無事アンラップされる
```
####オプショナルChaining
```swift
class SomeClass {
	func someFunction() -> String {
		return "Hello"
	}
}

var someInstance: SomeClass = SomeClass()

someInstance.someFunction() // これはエラー
someInstance?.someFunction() // OK
```
これを使えばnilの場合は無視して、nil出なかったらメソッドを実行することができます。
>[The Swift Programming Language - Optional](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/OptionalChaining.html#//apple_ref/doc/uid/TP40014097-CH21-XID_368)

### 演算子
変数が使えるようになったら次は、変数で計算しましょう。基本的な算術演算子をここでは紹介したいと思います。
```swift
var plus = 1 + 2		// 3
var minus = 3 - 4 		// -1
var multi = 5 * 6 		// 30
var divide = 10 / 5 	// 2
```
また日常生活ではあまり使いませんが、プログラミングではよく使う、余りを求める剰余演算(モジュロ演算)もあります。
```swift
var divide1 = 6 / 3 	// 2
var mod1 = 6 % 3 		// 0
var divide2 = 7 / 3 	// 2
var mod2 = 7 % 3 		// 1 
```
代入演算子もあります。
```swift
var x = 0
x += 1 // x = x + 1と同値
x -= 2 // x = x - 2と同値
x *= 3 // x = x * 3と同値
x /= 4 // x = x / 4と同値
```
> [The Swift Programming Language - Basic Operators](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/BasicOperators.html#//apple_ref/doc/uid/TP40014097-CH6-XID_108)

### 文字列
文字列の型は String 型で " で囲むことで作れます。
```swift
// 明示的に型を指定して宣言
var name: String = "Bob"

// もちろん型推論も働く
var city = "Tokyo"

// 日本語の文字列も大丈夫
var 名前 = "ボブ"

```
文字列を連結させたいときはプラスの演算子を使う。
```swift
var 姓 = "朝日 "
var 名 = "太郎"
var 姓名 = 姓 + 名 // 朝日 太郎 になる
```
空の文字列を作成することもできる。その場合はダブルクオーテーションの中を空にするか、以下の方法で初期化する。
```swift
var emptyString = String()

// または""
var anotherEmptyString = ""

// 空の文字列に文字を足す
emptyString += "A"
emptyString += "B"
emptyString += "C" // ABC になる
```
エスケープするには \ を使うことでできる。
```swift
var string = String()
string += "\"Swift\"" // "Swift"
```
改行は \n タブは \t バックスラッシュは \\ でエスケープできる。
```swift
var string = String()
string += "\"Swift\"\n is \t awesome" // 改行とタブを挿入
```
#### 文字列の補完
文字列の中に変数を挿入するには次のようにします。
```swift
var string = String()
for i in 1...9 {
	string += "\(i)"
}

string // 123456789
```
計算も同様にできます。
```swift
var sum = 0
for i in 1...9 {
	println("\(sum) + \(i) = \(sum + i)")
	sum += i
}
```
#### NSString と NSMutableString
さて、ここからは iPhone アプリを開発するためのフレームワーク Cocoa Touch について話していきたいと思います。Cocoa Touch の Foundation フレームワークのNSString、NSMutableString というクラスを使うことで、文字列に対して様々な操作をすることができるようになります。  
NSString と NSMutableStringの違いは、前者は変更不可で後者が変更可能なものです。var と let みたいな感じ。
```swift
var apple = "Apple"
var length = countElements(apple) // 5
```
一文字づつ取り出したいときは
```swift
var apple = "Apple"
for char in apple {
	char // 順に"A", "p", "p", "l", "e"が取り出せる
}
```
>[The Swift Programming Language - String and Characters](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/StringsAndCharacters.html#//apple_ref/doc/uid/TP40014097-CH7-XID_431)

### コレクション
#### 配列
```swift
var fruit = ["apple", "grape", "orange"] // String型の配列
var 午年 = [2014, 2002, 1990] // Int型の配列
var roomNumber = [101, 201, 301, "Staff Only"] // 違う型を一つに配列には入れられない

// 明示的に型を書くこともできる
var country: [String] = ["Japan", "China", "Kerea"]

// 空の配列を作るには2つのやり方がある
var emptyArray = [String]()
var anotherEmptyArray: [Int] = Array()
```
配列の要素数を数えるには
```swift
var animals = ["cat", "dog" ,"snake"]
var numberOfAnimals = animal.count // 3
```
配列のインデックスを指定するには
```swift
var animals = ["cat", "dog", "snake"]
var cat = animals[0] // cat
var snale = animals[2] // snake

// 配列の要素を順に取り出す
for animal in animals {
	// animalにanimalsの要素が入る
}
```
いろいろな配列操作をしてみよう
```swift
var animals = ["cat", "dog", "snake"]

// 要素を入れ替える
animals[0] = "cow"

// 要素を追加する
animals.append("bird")

// 要素を指定したインデックスに挿入する
animals.insert("sheep", atIndex: 1)

// 指定したインデックスの要素を削除する
animals.removeAtIndex(0)

// 最後の要素を削除する
animals.removeLast()

// すべての要素を削除する
animals.removeAll()
```

#### 辞書
辞書も配列と同じように作ることができます。
```swift
// 住所を表す辞書
var address = ["都道府県": "東京都", "市区町村": "葛飾区"]

// キーを指定して都道府県を取得
var prefecture = address["都道府県"] // "東京都"になる
 
// キーを指定して市区町村を取得
var city = address["市区町村"] // "葛飾区"になる
```
キーと値が違う辞書
```swift
// キーが Int で、値が String
var unit = [100: "hundred", 1000: "thousand", 1000000: "million"]
```
また配列と同じで複数の型のキーや複数の型の値はエラーになってしまう。  
次は空の辞書の宣言方法です。
```swift
var dict:<Int, String> = Dictionary()
var anotherDict = Dictionary<String, String>()
```
辞書の操作も配列とほぼ同じで
```swift
var display = ["iPhone 3G": "Not Retina", "iPhone 4": "Retina"]

// 辞書に追加
display["iPhone 6"] = "Retina"

// 辞書の置き換え
display["iPhone 6"] = "Retina HD"

// 個数を調べる ※ペアの数
var numberOfDevice = display.count // 3

// 辞書の値の削除は nil を代入
display["iPhone 6"] = nil
```
辞書に含まれているキーと値のペアを全て取り出すには
```swift
var display = ["iPhone 3G": "Not Retina", "iPhone 4": "Retina"]

for (device, displayType) in display {
	// deviceにキーが、displayTypeに値が代入される
}
```
また、キーと値を別々に取り出したいときには
```swift
var display = ["iPhone 3G": "Not Retina", "iPhone 4": "Retina"]

// キーだけの時
for key in display.keys {
	// keyにキーが代入される
}

// 値だけの時
for type in display.values {
	// typeに値が代入される
}
```
この時に注意して欲しいのがfor文を使って取り出した時、順番は保障されないということ。もし順番を機にするなら配列を使う方がいいです。
そして文字列の時と同様に配列と辞書にもCocoaのクラスがあります。配列は NSArrayで辞書は NSDictionaryです。
>[The Swift Programming Language - Collection Types](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-XID_167)

### 制御文
Swiftの制御構文は基本的に他言語とあまり変わりありません。
#### if文
```swift
var isSwiftAwesome = true

if isSwiftAwesome {
	// 実行される
} else {
	// false の時実行される
}
```
さらに条件を追加することもできます。
```swift
var heLikesApple = true
var sheLikesApple = false

if heLikesApple {
	println("He likes Apple")
} else if (sheLikesApple) {
	println("She likes Apple")
} else {
	// 上記のどちらでもない時に実行される
}
```
#### switch文
switch文は条件が複数ある時に使用します。
```swift
var month = 3

switch month {
case 1:
	// monthが1のとき実行される
case 2:
	// monthが2のとき実行される
case 3:
	// monthが3のとき実行される
default:
	// それ以外のとき実行される
}
```
#### while文
while文は条件が真の間はずっと実行されます。
```swift
var count = 0

// countが5以下の間実行される
while count < 5 {
	println("count is \(count)")
	count++
}
```
while文は条件が変わらない限りずっと処理し続けてしまうので条件を変えてあげるか、処理を中断させないとダメです。
```swift
var count = 0

// countが3のとき終了させる
while count < 5 {
	println("count is \(count)")
	
	// ここでcountをチェックし3なら終了
	if count == 3 {
		break
	}
	
	count++
```
#### for-in文
for in は指定した範囲内で繰り返しをしてくれるものです。
```swift
// 1 ~ 10まで繰り返す
for i in 1...10 {
	println(i)
}
```
1...10 の ... は範囲演算子と呼ばれていて、この例だと1から10までの範囲を返してくれます。範囲には配列や辞書を指定することも可能です。
```swift
// 配列を使ってfor in 

var fruits = ["apple", "orange", "grape"]

for fruit in fruits {
	println("\(fruit)")
}
```
>[The Swift Programming Language - Control Flow](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-XID_190)

### 関数
関数の定義は次のようにします。
```swift
func square(x: Int) -> Int {
	// 引数の2乗を返す
	return x * x
}
```
この関数の名前は square で x という Int 型の引数を取る。処理は引数を2乗して返す関数である。　　
関数を呼び出すときには関数名を使う。
```swift
func square(x: Int) -> Int {
	// 引数の2乗を返す
	return x * x
}

// squareの呼び出し
var y = square(3) // yは9になる
```
引数を複数とりたい場合はカンマで区切ります。
```swift
func distance(dx: Double, dy: Double) -> Double {
	// 距離を計算する
	return sqrt(dx * dx + dy * dy)
}

var d: Double = distance(10, 20)
```
sqrt関数はルートを求めることができます。次は複数の返り値がある関数を作ってみましょう。
```swift
func addName(name: String) -> (pay: String, watch: String) {
	// 引数にpay,watchをつけて返す
	return (name + "Pay", name + "WATCH")
}

// 関数の呼び出し
var productName = addName("Apple")

// 返り値を取得
productName.pay // ApplePay
productName.watch // AppleWATCH
```
ドットで使って値を取得することができます。これはタプルと呼ばれる型です。
>[The Swift Programming Language - Functions](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Functions.html#//apple_ref/doc/uid/TP40014097-CH10-XID_243)

#### クロージャ
クロージャはSwiftの特徴の一つです。ブロックや、無名関数、ラムダ式などと呼ばれます。クロージャを使用する場面としては、ネットワークの処理が挙げられます。例えば、データをダウンロードする際、そのダウンロードが終わったときに改めて次の処理をしなければいけない、そんな時に使われるのがクロージャです。  
データをダウンロードする例を紹介しておきます。
```swift
// ダウンロードの開始
 var downloadTask = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { data, response, error in 
 	// ダウンロード後の処理
 	...
 	})
```
この例のdataTaskWithURLがデータをダウンロードするメソッドで、最初の引数としてデータのURLを渡します。そしてその後の第2引数で渡しているのがクロージャです。urlの後のcompletionHandler:という名前の後にdata、response、errorが続いています、これらがクロージャに渡された引数で、その後ろのinの後がクロージャの処理を記述を書くところです。  
では、クロージャの文法をみていきましょう。簡単なクロージャの例を作ってみます。
```swift
func downloadData(handler: (String, Int, Bool) -> Int) {
}
```
この関数を詳しく見ていきましょう。まず、名前はdownloadDataで引数は1つです。次に引数の名前は、handlerで引数の型に当たるところに、(String, Int, Bool) -> Intと書いてあります。  
では、次にこの関数を呼び出してみましょう。
```swift
// 関数の定義
func downloadData(handler: (String, Int, Bool) -> Int) {
	
	var arg1 = "Hello"
	var arg2 = 1234
	var arg3 = true
	
	// handlerを呼び出す、これがクロージャ
	handler(arg1, arg2, arg3)
}

// 関数を呼び出す、そして引数にクロージャを渡す
downloadData({ (arg1, arg2, arg3) -> Int in 

	println(arg1)
	println(arg2)
	println(arg3)
	
	return 1
})
```
呼び出し部分に注目すると、関数の引数として(arg1, arg2, arg3) -> Int in があります。これがクロージャの書き出しとなり、中括弧がクロージャの本体です。そしてinの後ろに処理を書きます。クロージャの文法をまとめると、  
```swift
{ (引数名) -> 返り値型 in 
	// 処理
}
```
クロージャをうまく使い、美しく効率的なプログラムを書きましょう。
>[The Swift Programming Language - Closures](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Closures.html#//apple_ref/doc/uid/TP40014097-CH11-XID_151)

### クラスと構造体
いよいよクラスと構造体です。ここが終わったらアプリを実際に作っていくのでもう少しだけ頑張りましょう。矩形を例に挙げて説明していきたいと思います。座標系を次のようにします。
![座標系](https://www.evernote.com/shard/s324/sh/a3cd1667-ca48-4bf6-8da4-24f46f631394/1dc9933a42ac78c7a96ce6c2644d2043/res/d0fff410-9390-4ed5-b1bb-0cbb0bc65a81/skitch.png)
まず、矩形を作るには4つの値を用意しなければなりません。まずこれらを定義してみましょう。
```swift
// Rectという構造体の定義
struct Rect {
	var x: Float = 0
	var y: Float = 0
	var width: Float = 0
	var height: Float = 0
}

// インスタンスの作成
var rect = Rect()
```
rectという変数にインスタンスを格納することでプロパティである各変数を使うことができるようになります。インスタンスを複数作れば複数の矩形を定義することができるようになります。次にプロパティに値を設定してみましょう。
```swift
// 値を指定してインスタンスを作成する
var rect = Rect(x: 0, y: 0, width: 100, height:100)

// プロパティに直接代入する
rect.width = 100.0
rect.height = 100.0
```
プロパティへのアクセスは . で行うことができます。次に矩形の各点の座標を取得してみましょう。
例えば、左上の座標はx、右上の座標はx+widthなどですね。構造体の中に関数を定義して好きな時に取得できるようにしてみましょう。またこの関数をメソッドと呼びます。
```swift
struct Rect {
	var x: Float = 0
	var y: Float = 0
	var width: Float = 0
	var height: Float = 0
	
	// 右上のxを取得するメソッド
	func MaxX() -> Float {
		return x + width
	}
}

var rect = Rect()

// maxXメソッドを呼び出す
var maxX = rect.maxX()
```
メソッドにアクセスするときもプロパティと同様で . でアクセスします。  
クラスの説明に入ります。クラスと構造体はとても似ています。
```swift
// classを定義
class Rect {
	var x: Float = 0
	var y: Float = 0
	var width: Float = 0
	var height: Float = 0
	
	// 右上のxを取得するメソッド
	func MaxX() -> Float {
		return x + width
	}
}

var rect = Rect()

// maxXメソッドを呼び出す
var maxX = rect.maxX()
```
structの部分をclassに変えるだけでクラスは定義できます。クラスと構造体の大きな違いは、クラスは参照型で構造体は値型であることです。  
クラスの場合参照型なので、クラスのインスタンスを確保して変数に代入するときインスタンスそのものではなく参照が代入されます、すなわち変数をコピーしても参照のコピーになります。  
一方で構造体はインスタンスを確保すると変数はそのインスタンスそのものを表しているので、つまりコピーすると全く新しいインスタンスを作成してプロパティなどの値も新しいインスタンスのコピーします。
#### プロパティ
プロパティには大きく分けて、保持プロパティと算出プロパティの2つがあります。保持プロパティはクラスと構造体の中で、変数の形で宣言されているもので上の構造体、クラスの例で宣言していたものです。算出プロパティは値を格納するための変数を持たないもので、メソッドのように見えます。上の例ででた構造体に真ん中の座標を求める算出プロパティを追加してみましょう。
```swift
struct Rect {
	var x: Float = 0
	var y: Float = 0
	var width: Float = 0
	var height: Float = 0
	
	// 右上のxを取得するメソッド
	func MaxX() -> Float {
		return x + width
	}
	
	var centerX: Float {
		get {
			return x + width / 2
		}
		
		set (centerX){
			x = centerX - width / 2
		}
	}
}
```
このget、setが算出プロパティの実装です。
#### メソッド
メソッドにも2つ種類があります。インスタンスメソッドとクラスメソッドです。インスタンスメソッドはインスタンスに対して操作を行うものにたいし、クラスメソッドはインスタンスとは関係ないゆえインスタンスを作成しなくても呼び出すことができます。構造体の場合はメソッドを定義する前にstaticと付け加えればクラスメソッドを定義することができます。またクラスの場合はメソッドを定義する前にclassと付け加えれば定義することができます。
```swift
// 構造体の場合
static func exampleFunction() -> Int {
	...
}

// クラスの場合
class func anotherFunction() -> Bool {
	...
}
```
それぞれのインスタンスメソッド、クラスメソッドはともに . で呼び出すことができます。
#### 継承
iOS開発においては用意されているクラスを継承しサブクラスを作ることが始まりとなります。例えばUIButtonクラスというボタンのパーツはUIViewというクラスのサブクラスになっています。ここではCocoa Touchフレームワークを例に挙げて説明していきたいと思います。今回はUIViewControllerクラスを継承してみましょう。  
```swift
// UIViewControllerを継承したSomeViewControllerクラスを作る
class SomeViewController: UIViewController {

}
```
次にUIViewControllerクラスに定義されているviewDidLoadというメソッドをオーバーライドしてみたいと思います。メソッドの前にoverrideと記述します。
```swift
// UIViewControllerを継承したSomeViewControllerクラスを作る
class SomeViewController: UIViewController {
	// 上書きする
	override func viewDidLoad() {
		// スーパークラスのviewDidLoadを呼び出している
		super.viewDidLoad()
		
		// サブクラスの処理を書く
	}
}
```
Cocoa Touchではメソッドをオーバーライドしたら、原則その中でスーパークラスのメソッドを呼び出すことになっています。スーパークラスにアクセスするためにはsuperとつけます。
>[The Swift Programming Language - Classes and Structures](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-XID_134)

## チュートリアル アプリを作ろう



### プロジェクト作成

---

## 課題

課題では、iPhone アプリを作ってもらいます。一からアプリを作成し、できれば実機で動作させましょう。

### 課題


### 自由課題

創意工夫をしてよりよいアプリにしてください。


---
### デバッグの方法

iOS開発のデバッグの方法を紹介します。

#### `NSLog`
#### `println`
これでコンソールに出力されます。

#### デバッガーとBreak Point

Break Pointを設定することで実行中のプログラムを特定の位置で止めることができ、XcodeからBreak Pointを操作できます。
![Break Point](https://www.evernote.com/shard/s324/sh/a00915b6-af19-4b0b-bae6-69d5bd95a4b8/92fda355a0d4243c/res/f59ddf16-27e3-4879-9de7-8f422d098a5f/debug.png)


#### 静的解析

Xcodeのメニューから `Run -> Analyze` を実行することで、静的解析が行われ、問題が起こり得る場所を事前に教えてくれます。

### 参考

#### ドキュメント

- [Apple Developer Center](http://developer.apple.com/ios/)
  - 公式ドキュメント
- [日本語ドキュメント](https://developer.apple.com/jp/devcenter/ios/library/japanese.html)
  - 公式ドキュメントの公式日本語訳。

