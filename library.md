# ライブラリ
-
iOS開発を効率的に進めるためのライブラリを紹介していきます。導入方法、使い方、などを書いていきたいと思います。

---

### Alamofire
[Alamofire](https://github.com/Alamofire/Alamofire)はネットワーク接続用のライブラリ[AFNetworling](https://github.com/afnetworking/afnetworking)の開発者の[mattt](https://github.com/mattt)さんが開発したSwift版のAFNetworkingです。これを使う事によりネットワーク接続を効率よく、綺麗に書くことができますので必須ライブラリの一つです。

-
#### 使い方
- 導入方法  
Alamofireを導入するには[Alamofire](https://github.com/Alamofire/Alamofire)からプロジェクトファイルをダウンロードして、導入したいプロジェクトファイルにD&Dします。
![](https://www.evernote.com/shard/s324/sh/4556fed9-99c5-454e-bbd1-5f32b152191f/9e76fa3b8ff8d9cd428882c04b38c362/deep/0/Fullscreen-12-26-14,-15-21.png)
追加したら自分のプロジェクトを選択し、`Target dependecies`に`Alamofire`を追加してください。そして新しくBuild Phaseを追加し、名前を`Copy Frameworks`にします。その中の`Destination`を`Framework`にし、`Alamofire`を追加してください。あとは使いたいところで`import`してあげれば使えるようになります。
![](https://www.evernote.com/shard/s324/sh/260da73c-8d24-4f33-9714-3028e268e6ad/b3463ce72c9701ebe9973600e30e5543/deep/0/Fullscreen-12-26-14,-15-26.png)

- 使用方法

今回は[こちら](http://jsonplaceholder.typicode.com/posts)のデータをダウンロードしてみたいと思います。

```swift
override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(.GET, "http://jsonplaceholder.typicode.com/posts")
            .responseJSON { (request, response, JSON, error) in
                println(request)
                println(response)
                println(JSON)
                println(error)
        }
        
    }
```

これを実行するとうまく結果が返ってきているのがわかると思います。これだけでリクエストが処理ができるのでかなり簡単です。では、説明していきます。

```swift
Alamofire.requestJSON(.GET, "http://jsonplaceholder.typicode.com/posts")
```  

この部分でリクエストするためのオブジェクトを生成します。列挙型にHTTPメソッドが定義されていて下記のものが使えます。  

```swift
public enum Method: String {
    case OPTIONS = "OPTIONS"
    case GET = "GET"
    case HEAD = "HEAD"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case TRACE = "TRACE"
    case CONNECT = "CONNECT"
}
```

次にリクエストするURLを指定してあげます。なお、パラメータを追加したい場合はその後に指定してあげます。

```swift
Alamofire.requestJSON(.GET, "http://jsonplaceholder.typicode.com/posts", parameters: ["foo": "bar"])
```

これでレスポンスメソッドを呼ぶことで非同期通信が開始され、完了したらクロージャーが呼ばれます。
今回はJsonでリクエストしたので結果は`.responseJSON`メソッドでJSON形式にシリアライズして取得します。あとは受け取った値を利用していろいろしてください。

---

	
