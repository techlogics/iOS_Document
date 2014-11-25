# 楽しい iOS アプリ作成


## イントロダクション

現在、世界は2007年のiPhoneを機にモバイルファーストの時代に突入しています。ゆえに当然モバイル開発のスキルも必要となることが増えるのは当然のことでしょう。この講座はiPhoneアプリ、すなわちiOSアプリの開発の基礎的なことを勉強し、これから本格的にiOSアプリを開発していくための導入の講座です。なお、使用する言語はAppleが2014年に発表されたSwiftで進めたいと思います。

---

## Swift 言語

Swiftはモダンな言語要素を多く取り入れたわかりやすい言語です。基本的な文法を紹介していきます。  
###変数  
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
上のように型を書かなくても自動で型を推測してくれる。そしてSwiftで定数を宣言するには let を使う。
```Swift
let anotherSomeInt = 1234
let anotherSomeFloat = 0.0
let anotherSomeBool = false
let anotherSomeString = "TechLogics is awesome!"
```
var と違うところは、宣言と同時に初期化しなければならないこと、そして一度初期化したら再び値の代入はできなくなるので注意する。
> [The Swift Programming Language - The Basics](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-XID_467)
>

制御文についても C 言語で使われるものが使えます。

```objc
void hello() {
    print("Hello");
}

BOOL flag = YES;
if (flag) {
    hello();
}

for (NSUInteger i = 0; i < 10; i++) {
    hello();
}
```

このように C 言語の機能が一通り使えます。しかし iOS に含まれるライブラリの多くは Objective-C を前提として作られています。C 言語はそれが必要とされる場面でのみ使うことになります。ここからはプログラミング言語としての Objective-C を見ていきます。

### 基本的なオブジェクト

まず基本的なオブジェクトを紹介します。`NSObject *object;` はオブジェクトへの参照です。新しいインスタンスを作るには `NSObject *object = [[NSObject alloc] init];` とします。

#### 基底クラス

```objc
NSObject *object = [[NSObject alloc] init];
id another = [[NSObject alloc] init];
```

基底クラスは `NSObject` または `NSProxy` ですが、普段は `NSObject` だけ気にしていたらよいです。`NSObject` または `NSProxy` のポインタを表す `id` 型というのもよく出てきます。`id` 型は任意のオブジェクトを表すとき使われます。

> [NSObject Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSObject_Class/Reference/Reference.html)
>
> [NSObject Protocol Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Protocols/NSObject_Protocol/Reference/NSObject.html)

#### 文字列

```objc
NSString *message = @"Hello";
NSLog(@"%@ world", message);
```

文字列は `NSString` または `NSMutableString` を使います。`@""` で囲うリテラルが使えます。

> [NSString Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSString_Class/Reference/NSString.html)
>
> [NSMutableString Class Reference](https://developer.apple.com/library/ios/documentation/CoreFoundation/Reference/CFMutableStringRef/Reference/reference.html)

#### 数値

```objc
NSNumber *times = @(24);
NSLog(@"%@ times", times);
NSInteger timesInt = [times integerValue];
```

数値は `NSNumber` で、様々な大きさの整数や浮動小数点数、真偽値などを格納できます。リテラル表記では `@()` で囲います。ポインタや構造体を格納するための `NSValue` というのもあり、たまに使われます。

> [NSNumber Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSNumber_Class/Reference/Reference.html)

#### 配列

```objc
NSArray *messages = @[@"Hello", @"Good morning", @"Goog afternoon"];
NSLog(@"%@", messages);
NSString *firstMessage = messages[0];
NSLog(@"%@", firstMessage);
```

配列には `NSArray` または `NSMutableArray`。`@[]` というリテラルがあります。

> [NSArray Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSArray_Class/NSArray.html)
>
> [NSMutableArray Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSMutableArray_Class/Reference/Reference.html)

#### 辞書

```objc
NSDictionary *messagesToFriends = @{
    @"Tom" : @"Nice to meet you.",
    @"Steve" : @"RIP",
    @"Sam" : @"Hi.",
};
NSString *friend = @"Steve";
NSString *message = messagesToFriends[friend];
NSLog(@"%@ %@", message, friend);
```

辞書は `NSDictionary` または `NSMutableDictionary`。リテラルは `@{}` です。

> [NSDictionary Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSDictionary_Class/NSDictionary.html)
>
> [NSMutableDictionary Class Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/Classes/NSMutableDictionary_Class/Reference/Reference.html)



　

> #### コラム - iOS / OS X のフレームワーク
>
> iOS / OS X アプリ開発においては、OS の提供する標準フレームワークを上手に使うことが肝要です。ここまで紹介してきた基本的なオブジェクト群は、`Foundation.framework` に内包されています。これは iOS でも OS X でも同じように使うことができます (残念ながら一部異なります)。フレームワークは `#import <Foundation/Foundation.h>` のようにインポートします。
>
> この `Foundation.framework` のほかに、iOS では `UIKit.framework`、OS X では `AppKit.framework` という、主に UI などと関係するフレームワークを使います。これらはプラットフォームに特化したもので互換性はありません。`Foundation` と `AppKit` または `UIKit` を合わせて、それぞれ `Cocoa` / `Cocoa touch` と呼んでいます。
>
> iOS / OS X には他にも様々なフレームワークがあり、これらをうまく活用することで、すばらしいアプリを簡単につくることさえ可能です。しかしまずはこの `Cocoa` を使いこなすことこそ、最高のアプリの最初の一歩となります。

　

> #### コラム - Toll Free Bridge
>
> `Foundation.framework` にはもう一つ秘密があります。`Foundation` に存在するいくつかのクラスは、`CoreFoundation.framework` という、C++ で実装された対応するクラスと相互に変換可能です。例えば `NSString` と `CFString` は相互に変換できます。しかもこのとき、変換のためのコストがかかりません。これを **Toll Free Bridge** と呼んでいます。
>
> なぜこのようなことになるかというと、`NSString` と `CFString` が実質的に同じものであるからです。このため、キャストするだけで変換することができます。
> ```objc
> NSString *string = @"string";
> CFStringRef cf_string = (__bridge CFStringRef)string;
> ```
> (`__bridge` というのはメモリ管理の上で必要となるアノテーションです。)
> またこの逆の変換も可能です。
>
> `CF` で始まる `CoreFoundation.framework` のクラスは、iOS や OS X の中でも C++ のインターフェースを持つフレームワークと共に使われます。また、`CFString` にしか存在しないメソッドなどもありますから、敢えて `CFString` として操作することが便利な場面もあります。

　

> [Foundation Framework Reference](https://developer.apple.com/library/ios/documentation/Cocoa/Reference/Foundation/ObjC_classic/_index.html)
>
> [UIKit Framework Reference](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIKit_Framework/_index.html)



### クラス


#### クラスの実装



#### メソッド



#### プロパティ



> #### コラム - 動的 Objective-C
>
> Objective-C はコンパイルによってマシン語が生成される、コンパイラ言語の形を取っています。以前はコンパイラとして GCC の Apple によるフォークが使われていました (いまの GCC にも Objective-C をコンパイルする機能があります)。しかし現在では LLVM と Clang が使われるようになり、この新しいコンパイラによって近年 Objective-C は目覚ましい進化を遂げました。例えば ARC (Automatic Reference Count) と呼ばれる機能は、GC なしにプログラマをメモリ管理の煩わしさから解放することに成功しました。コンパイラがその静的解析機能によって事前に参照カウントを変更するコードを生成し、自動的に挿入してくれています。
>
> このようなコンパイラによって生成されたバイナリは、iOS や OS X のランタイム上で動作します。このため、Objective-C は完全なネイティブコードにコンパイルされるにもかかわらず、実際には動的なシステム上で動作します。言語機能としての実行時のクラス拡張などのほか、ランタイム関数を呼び出すことで親クラスを差し替えることすらできます。
>
> Cocoa は最大限にその動的特性の恩恵を受けたフレームワークと言えます。そのひとつは target-action パラダイムと呼ばれる仕組みです。例えばボタンが押されたときの動作を設定するために、`addTarget:action:forControlEvents:` というメソッドを用います。ボタンが押されたというイベント (定数) が起きたとき、ターゲット (オブジェクト) に対してアクション (メソッド) を呼び出す、ということを指定することができます。このアクションというのは、セレクタという `SEL` クラスのオブジェクトになっています。セレクタは `@selector(anyMethod:)` という構文でつくることができます。メソッドがセレクタオブジェクトで指定できることで、例えばターゲットオブジェクトがそのセレクタに応答するかを確認して、応答しないときボタンを `disable` にする、というような仕組みを簡単に作ることができます。
>
> 動的特性を多分に持つ Objective-C とそれを用いた Cocoa では、フレームワークレベルでそれが活かされています。もちろん動的であるが故の問題もありますが、しかしそれ以上に、その柔軟さが生み出すしなやかなプログラミングにはこころ惹かれるものがあります。



> #### コラム - `NSFastEnumeration` Protocol
>
> `for...in` 構文は、`NSFastEnumeration` Protocol で実現されます。このプロトコルに準拠したクラスのオブジェクトは、`for...in` による高速列挙が行えます。
>
> 興味深いことに、`NSEnumerator` クラスというものが存在し、`NSFastEnumeration` プロトコルに準拠しています。`NSArray` の `objectEnumerator` や `reverseObjectEnumerator` メソッドを呼ぶと、この `NSEnumerator` オブジェクトが返ります。これを `for...in` することもできるので、`reverseObjectEnumerator` で返ってくる `NSEnumerator` を使えば、逆順に `for...in` できることになります。
>
> ```objc
> NSArray *array = @[@"a", @"b", @"c"];
> for (id obj in [array reverseEnumerator]) {
>     NSLog(@"%@", obj);
> }
```

---



## チュートリアル アプリを作ろう



### プロジェクト作成

---

## 課題

課題では、iPhone アプリを作ってもらいます。JavaScript の課題で作っているはずの JSON API をなるべく使い回して構いません。一からアプリを作成し、できれば実機で動作させましょう。

### 課題

iPhone アプリで記事一覧を表示できるようにしてください。表示には `UITableView` を使ってみましょう。また個別の記事を選択したとき、個別記事画面に遷移するようにしてください。

### オプション課題

iPhone アプリから記事を投稿できるようにしましょう。必要に応じて API も作成してください。

### 自由課題

創意工夫をしてよりよいアプリにしてください。

- 記事一覧がページングするように
  - API から一度に取得する記事が多いと、特にスマートフォンのネットワーク環境では問題になりがち
  - 一度に20件くらいずつ取得し、それを `UITableView` でうまく継ぎ足すようにする
- 既存の記事を編集できるようにする
  - 開いた記事をそのまま編集し、サーバーに反映させる
- より使いやすい UI にする
- おもしろい機能を追加する
- など

---

## おまけ

### Objective-C 追補

#### プロトコル

あるクラスが一連のメソッドに応答することを約束するために、プロトコルというのがあります。

```objc
@protocol Flyable

- (void)up;
- (void)down;

@optional

- (void)rotate;

@end
```

プロトコルの宣言は上記のように行います。この `Flyable` プロトコルは、上昇、下降ができることを約束させ、またオプションですが、旋回できるかもしれないことを表します。このプロトコルに準拠するには少なくとも `up` と `down` メソッドを実装する必要があります。プロトコルに準拠したことを表明するときはヘッダーファイルに書き加えます。

```objc
@interface Helicopter : NSObject <Flyable>

..

@end
```

`<>` の中にカンマ区切りで対応するプロトコルの名前を記載します。

プロトコルの利用例として delegate があります。iOS でブラウザ画面を提供する `UIWebView` は `UIWebViewDelegate` というプロトコルを持ち、これに対応するオブジェクトを delegate に登録しておくことで、WebView の状態が変わったときそれを知ることができます。

```objc
@interface MyClass : NSObject <UIWebViewDelegate>
```

このように宣言し

```ojbc
MyClass *obj = [[MyClass alloc] init];
UIWebView *webView = [[UIWebView alloc] init];
webView.delegate = obj;
```

のように `delegate` プロパティに設定します。`delegate` プロパティは `weak` になっていることが多いので、気をつける必要があります。

```
– webView:shouldStartLoadWithRequest:navigationType:
– webViewDidStartLoad:
– webViewDidFinishLoad:
– webView:didFailLoadWithError:
```

あとは `MyClass` が上記のメソッドを実装することで、`UIWebView` の状態が変化したときそれを知り、必要に応じて何らかの処理を行うことができます。

#### カテゴリ

既にあるクラスに、新しくメソッドを増やしたいとき、カテゴリという機能を使うことができます。

```objc
#import <Foundation/Foundation.h>

@interface NSDateFormatter (MySQL)

+ (instancetype)MySQLDateFormatter;

@end
```

```objc
#import "NSDateFormatter+MySQL.h"

@implementation NSDateFormatter (MySQL)

+ (instancetype)MySQLDateFormatter
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    formatter.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return formatter;
}

@end
```

これらのヘッダーと実装ファイルをそれぞれ `NSDateFormatter+MySQL.h` `NSDateFormatter+MySQL.m` とすると、`[NSDateFormatter MySQLDateFormatter];` として呼び出すことができます。`(MySQL)` というのがカテゴリの名前になります。`NSDateFormatter` は日付を表す `NSDate` と `NSString` を相互にやり取りするときに用いる標準的なクラスですが、こういう風に拡張することができます。

これは既にあるクラスの拡張に便利なほか、外部から隠したいインターフェースを実現するときにも用いられます。

```objc
#import "Human.h"

@interface Human ()

@property (nonatomic) NSNumber *weight;

@end

@implementation Human
..
```

このように実装ファイルで無名のカテゴリを宣言することで、ヘッダーには載せずに `@interface` の一部を宣言できます。外から知られたくないプロパティを作るときなどに利用されています。

### イディオム

ここからは使うことになりそうな、いくつかの典型的なイディオムを紹介します。
##### KVO ([Key Value Observation](https://developer.apple.com/library/ios/#documentation/Cocoa/Reference/Foundation/Protocols/NSKeyValueObserving_Protocol/Reference/Reference.html))

他のオブジェクトのプロパティの値を監視したいとき、KVO という仕組みを使うことができます。

```objc
Human *human = [[Human alloc] init];
[human addObserver:self forKeyPath:@"lastName" options:NSKeyValueObservingOptionNew context:nil];
```

このようにすることで、他のオブジェクトのプロパティを監視します。`keyPath` というのは、KVC (Key Value Coding) からくる概念で、`keyPath` に指定された文字列から一定のルールで呼び出されるメソッドが決定されます。今回のような場合では特に意識しなくてもアクセッサが呼ばれるので、ここで詳しくは説明しません。必要に応じてドキュメントを参照してください。

```objc
[[self mutableArrayValueForKey:@"bookmarks"]
        insertObjects:newBookmarks atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, newBookmarks.count)]];
```

このように `mutableArrayValueForKey:` を使うことで、`NSMutableArray` 型のプロパティの内容の変更についても通知を発火させることができます。

[日本語ドキュメント](https://developer.apple.com/jp/devcenter/ios/library/japanese.html)の『キー値監視プログラミングガイド』が詳細に解説しています。

```objc
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"lastName"] && object == human) {
        // ここで処理
    }
}
```

変更を受け取りたい側はこのように `observeValueForKayPath:ofObject:change:context:` メソッドを実装します。詳細はドキュメントを参照してください。

KVO を効果的に利用することで、モデルの変更をビュー、またはコントローラーが一方的に監視することが可能になります。これによってモデルと他のオブジェクトの結合を弱くでき、モデルが自分の仕事に集中できます。

### View Controller のライフサイクル

[View Controller Programming Guide for iOS](https://developer.apple.com/library/ios/#featuredarticles/ViewControllerPGforiPhoneOS/Introduction/Introduction.html) 参照してください。

- [Resource Management in View Controllers](https://developer.apple.com/library/ios/#featuredarticles/ViewControllerPGforiPhoneOS/ViewLoadingandUnloading/ViewLoadingandUnloading.html)
- [Responding to Display-Related Notifications](https://developer.apple.com/library/ios/#featuredarticles/ViewControllerPGforiPhoneOS/RespondingtoDisplay-Notifications/RespondingtoDisplay-Notifications.html)

この辺りです。[日本語ドキュメント](https://developer.apple.com/jp/devcenter/ios/library/japanese.html)では「iOS View Controller プログラミングガイド」です。

### デバッグ

iOS/OS X プログラミングにおけるデバッグの手法をいくつか紹介します。

#### `NSLog`

ログを出します。

```objc
NSDictionary *dict = @{ @"a" : @"b" };
NSLog(@"Dictionary: %@", dict);
```

出力は、対象のオブジェクトの `description` メソッドが使われます。必要に応じてこれを実装しておくとよいでしょう。

#### デバッガと breakpoint

ブレークポイントを設定することで、実行中のプログラムを特定の位置で止めることができます。Xcode から GUI でブレークポイントを操作できます。Safari や Chrome の Web インスペクタともよく似ています。

![ブレークポイントで止めているときの Xcode](https://www.evernote.com/shard/s2/sh/ec7da491-71e8-4caf-9ff3-e61debd6e572/10164606e9076f8ab9833d2eae4bbf84/deep/0/breakpoints.png)

例外発生時にブレークポイントを設定することができ、これをしておくことでエラーに対処しやすくなります。

#### 静的解析

Clang の Static Analyzer を使えば、プログラムを実行する前に潜在的なエラーを探すことができます。Xcode のメニューから `[Run] -> [Analyze]` を実行すると、静的解析が行われ、問題が起こり得る場所を指摘してくれます。

#### Instruments

Xcode に付属する Instruments を使うと、さらに高度な解析が簡単に行えます。メモリリークの発見や、`deallocate` されたオブジェクトへの操作によるエラー、パフォーマンスのチューニングなど、多くのことができます。詳しくはドキュメントを参照してください。

- [Instruments User Guide](https://developer.apple.com/library/ios/#documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/Introduction/Introduction.html)
- [日本語ドキュメント](https://developer.apple.com/jp/devcenter/ios/library/japanese.html)の「Instruments ユーザガイド」

### 参考資料

#### ドキュメント

- Xcode から読めるドキュメント
- [Apple Developer Center](http://developer.apple.com/ios/)
  - 公式ドキュメント
- [日本語ドキュメント](https://developer.apple.com/jp/devcenter/ios/library/japanese.html)
  - 公式ドキュメントの公式日本語訳。わりと更新されていて英語よりやや読みやすいかもしれない。開発ガイド的なものだけある
- [iOS Development Training Course](https://github.com/mixi-inc/iOSTraining)
  - 株式会社 mixi のトレーニングコース。とても充実しています。

#### 書籍

- [絶対に挫折しない iPhoneアプリ開発「超」入門【iOS6対応版】](http://www.amazon.co.jp/%E7%B5%B6%E5%AF%BE%E3%81%AB%E6%8C%AB%E6%8A%98%E3%81%97%E3%81%AA%E3%81%84-iPhone%E3%82%A2%E3%83%97%E3%83%AA%E9%96%8B%E7%99%BA%E3%80%8C%E8%B6%85%E3%80%8D%E5%85%A5%E9%96%80%E3%80%90iOS6%E5%AF%BE%E5%BF%9C%E7%89%88%E3%80%91-%E9%AB%98%E6%A9%8B-%E4%BA%AC%E4%BB%8B/dp/4797369434/)
  - iOS アプリ開発の入門書です。チュートリアル形式でいろいろ書いてあるので取っつきやすいと思います
- [詳解 Objective-C 2.0 第3版](http://www.amazon.co.jp/%E8%A9%B3%E8%A7%A3-Objective-C-2-0-%E7%AC%AC3%E7%89%88-%E8%8D%BB%E5%8E%9F/dp/4797368276)
  - Objective-C の言語について知りたかったらこれがいちばんよいと思います

ここからはより iOS / OS X の開発に親しみたい人向けです

- [Dynamic Objective-C](http://www.amazon.co.jp/Dynamic-Objective-C-%E6%9C%A8%E4%B8%8B-%E8%AA%A0/dp/4861006414)
  - Objective-C の動的特性や、Cocoa におけるデザインパターンについて書かれています
  - 書籍はすでに絶版ですが、[元となった Web での連載](http://news.mynavi.jp/column/objc/index.html)がいまも公開されています
- [iOS開発におけるパターンによるオートマティズム](http://www.amazon.co.jp/iOS%E9%96%8B%E7%99%BA%E3%81%AB%E3%81%8A%E3%81%91%E3%82%8B%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3%E3%81%AB%E3%82%88%E3%82%8B%E3%82%AA%E3%83%BC%E3%83%88%E3%83%9E%E3%83%86%E3%82%A3%E3%82%BA%E3%83%A0-%E6%9C%A8%E4%B8%8B-%E8%AA%A0/dp/4861007348/)
  - iOS アプリ開発の定石が紹介されています。著者は『Dynamic Objective-C』と同じ木下誠氏で、木下氏は長年この分野に取り組んでいらっしゃいます
- [スマートフォンのためのUIデザイン ユーザー体験に大切なルールとパターン](http://www.amazon.co.jp/%E3%82%B9%E3%83%9E%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%B3%E3%81%AE%E3%81%9F%E3%82%81%E3%81%AEUI%E3%83%87%E3%82%B6%E3%82%A4%E3%83%B3-%E3%83%A6%E3%83%BC%E3%82%B6%E3%83%BC%E4%BD%93%E9%A8%93%E3%81%AB%E5%A4%A7%E5%88%87%E3%81%AA%E3%83%AB%E3%83%BC%E3%83%AB%E3%81%A8%E3%83%91%E3%82%BF%E3%83%BC%E3%83%B3-%E6%B1%A0%E7%94%B0-%E6%8B%93%E5%8F%B8/dp/4797372303/)
  - UI デザインをパターンとして分類し、紹介されています。UI に迷ったり、使いやすいアプリを作るときには、このような書籍を参考にするのがよいでしょう