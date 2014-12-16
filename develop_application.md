# Tech Logics iOSアプリ開発者養成ドキュメント


## イントロダクション

現在、世界は2007年のiPhoneを機にモバイルファーストの時代に突入しています。ゆえに当然モバイル開発のスキルも必要となることが増えるのは当然のことでしょう。この講座はiPhoneアプリ、すなわちiOSアプリの開発の基礎的なことを勉強し、これから本格的にiOSアプリを開発していくための導入の講座です。なお、使用する言語はAppleが2014年に発表されたSwiftで進めたいと思います。対象とする読者はプログラミング言語を学習したことがある人とします。

---

## アプリを作ろう
### ニュースアプリの作成
#### プロジェクトの作成  
Xcodeを開き、`File -> New -> Project`より新規プロジェクトを作成してください。今回作成するアプリはSingle View Applicationです。  
  
![](https://www.evernote.com/shard/s324/sh/68402932-e466-4137-b0d2-182c5b95c2d7/8f3faeb6bd54b757df4210d43d4c39dd/res/c7ceee9b-705f-41e9-af38-bd7252c36970/skitch.png)  
  
次にアプリの情報を入力していきます。プロジェクトの名前、そして所属組織の名前、なければ適当で構いません。そして最後に組織の識別子、一般的にはドメインの逆を指定します。ここまで終わったら、開発言語をSwiftに設定して終わりです。  
  
![](https://www.evernote.com/shard/s324/sh/010c0c90-5413-4c5c-bc69-503fa927d9e0/e01b4d80b05493295a1981ec40b04c9e/res/eb31bbed-1cdb-43a6-820f-215642c6919d/skitch.png)  

これがXcodeの画面です。  
  
![](https://www.evernote.com/shard/s324/sh/74b5801b-ee5e-418b-9f1e-a266cd6e0b25/453becde3917d99c695b536f232d0f54/res/f32e60fe-055a-4e32-8320-91d39781ea6f/skitch.png)
  
今回はこのようなニュースアプリを作りたいと思います。
![](https://www.evernote.com/shard/s324/sh/cc54ea21-68d7-445c-9621-6098d22097d2/86f21d01a7fe3dc8765ea8d37d67b2fd/deep/0/iOS-Simulator---iPhone-6---iPhone-6---iOS-8.1-(12B411).png)
![](https://www.evernote.com/shard/s324/sh/c17e51e9-fa51-4803-ac03-e0cb35a366cc/5b1bfb0bd93db0c8627ab0e2e0d57d4a/deep/0/Screenshot-12-15-14,-00-32.png)
  
機能としては、  
- ニュースのタイトルの表示
- ニュースの記事の表示
- ニュースの詳細ページを表示
- 記事をつぶやく





次に画面の構成を考えていきます。iOSでは基本的に一つの画面に対して一つのコントローラーを持ち画面を管理します。今回作るアプリの画面の構成は、ニュース一覧を表示する`NewsTableViewController`が一つ、そして記事の詳細を表示する`DetailViewController`が一つの二つの画面構成で開発していきたいと思います。  
開発の基本の流れとして、画面のレイアウトを考える、そしてそれに合わせコードを書いていくのが一般的な流れです。では、早速画面のレイアウトを考えていきましょう。Xcodeを開いてください。  
  

まずは、左のファイル一覧から`Main.storyboard`を選択し不要な`ViewController`を削除します。そして左下のライブラリーから`TableViewController`と`ViewController`をキャンバスに配置してください。
![](https://www.evernote.com/shard/s324/sh/fd2df4af-f8fd-4bd7-bd74-70e36a40b83d/6dd0821bb62dcc48f4845e1aa5f39e8d/res/19a54c25-30f7-4bed-b05e-e9222f23c2f2/skitch.png)  

このようになれば大丈夫です。

![](https://www.evernote.com/shard/s324/sh/71ab7a62-0dd7-4aeb-a5d0-e86757c1aeed/1ece38025b6a238ea2b747a93ee66503/res/7c8f6841-b3ab-469c-a38b-250fe575f4b0/skitch.png)  

次にTableViewControllerを起動時最初に表示させたいので、InitialViewControllerに設定してあげます。  

![](https://www.evernote.com/shard/s324/sh/76a0002a-8fe4-4a4d-8b49-339ddcacc9d5/550b5fb04b97c9d124225fc8390550a1/res/d88f8810-ac23-47b6-bdad-f2879ffa0333/skitch.png)  

最後に`NavigationController`と呼ばれるViewControllerの階層を管理するコントローラーを追加して一旦storyboardからは離れます。下記のようになれば大丈夫です。

![](https://www.evernote.com/shard/s324/sh/bcb47b40-2a2d-4df2-b41a-72467ec3d000/252e9287484f059606860f2890e2dc99/res/83206bad-15ce-469b-b461-5c63b79c2216/skitch.png)  

ここですこしコードをいじってみます。左のファイル一覧からViewController.swiftを削除してください。そして新しくファイルを追加していきます。Menuバーから`File -> New -> File`と選択していき下記の画面を出します。ここでは`Cocoa Touch Class`を選択してください。  

![](https://www.evernote.com/shard/s324/sh/81295224-0f70-4e6f-a0bc-7c827adaebd0/529c55b534f72423452ff22c57bd5bba/res/f12f2de8-1264-4b27-aa80-afecd3957eea/skitch.png)  

ファイル名を`NewsTableViewController`にしてSubclassは`UITableViewcontroller`にします。言語もSwiftにしましょう。

![](https://www.evernote.com/shard/s324/sh/1c88e7f8-940c-4390-af1a-7238073c4bf2/ea3284c2371c96a3d496dec06e24f0e0/res/e0882bb6-edf8-4c6c-9dd9-7f9cf65074b5/skitch.png)  

保存するフォルダをプロジェクトのフォルダに指定します。

![](https://www.evernote.com/shard/s324/sh/a556a1cc-c294-4715-b005-e065ae517ed8/f361ef8efcbe54c2980bd9afd147db35/res/ddd6e97c-b900-4558-8f9f-3ffa6b591bc1/skitch.png)  

そしたらファイル一覧から`NewsTableViewController`ファイルが追加されたのが確認できるはずです。

![](https://www.evernote.com/shard/s324/sh/b2a4aded-890c-4dd6-a9b9-820b4b3968d2/543d7331fa5a17cf49762dc38bd75395/res/4d67aab9-c4e9-4fe1-8437-347de469125b/skitch.png)  

ではいよいよコードを見ていきましょう。`NewsTableViewController`を選択してください。上のコードが編集していないコードなのですが、たくさんコメントが書いてあります。これを下のコードのように書き換えてください。  

#####変更前
```swift
import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
```
#####変更後
```swift
import UIKit

class NewsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        return cell
    }
}
```
  
これで`NewsTableViewController`はひとまず終わりです。次は、記事の詳細を表示する`DetailViewController`を追加していきましょう。追加方法は、`NewsTableViewContoroller`の時と同様に、Menuバーから`File -> New -> File`と選択していき下記の画面を出します。ここでは`Cocoa Touch Class`を選択してください。そして名前を`DetailViewController`、サブクラスを`UIViewController`を継承するようにし、言語をSwiftにして作成します。

![](https://www.evernote.com/shard/s324/sh/46990e51-ef8c-4cd0-b73d-a46c71ea009b/bcc61c6e53f50c691f3952f24a5c24b9/res/f131a48a-5080-47b3-af31-04c2fa689a5f/skitch.png)  
  
ここまでが終わったら、StoryBoardを使ってUIの部分を作っていきたいと思います。`Main.storyboard`を開いてください。現在はTableViewControllerとViewControllerの二つがキャンバスの上にあると思います。これらにまずは先ほど上で作った`NewsTableViewControllerクラス`と`DetailViewControllerクラス`を結びつけていきたいと思います。

`UITableViewController`を選択し、`Class`の部分を`NewsTableViewController`にしてください。
![](https://www.evernote.com/shard/s324/sh/81007ed3-7eae-479a-b1b2-5835d5037b7e/f38ec4aecf97706d447bde3e7bba2fa4/res/92104b0d-5f6a-4924-a8dc-e7feb864bc8e/skitch.png)

次に、`UIViewController`を選択し、`Class`の部分を`DetailViewController`にしてください。これでソースファイルとStoryboardが結びつけられました。
![](https://www.evernote.com/shard/s324/sh/ba1c9e73-7a69-4bab-b3a9-a0cc9565301e/42cefa8948ef56f72ef2547683d218c0/res/db155f6c-a42d-4d0f-a84e-61f8dc8f4753/skitch.png)

ここからは、UIパーツなどを配置していきたいとおもいます。まずは、`NewsTableViewController`を選択しセルの部分を選択してください。次にセルの高さを160に設定しましょう。
![](https://www.evernote.com/shard/s324/sh/2bb1241e-3906-4667-9d0e-c40bb8d11fb2/77cf9610cecf9184533c539d7694c973/res/857d94da-2bf9-4933-9faf-bb387beaa69b/skitch.png)

次はセルに表示させる画像を配置しましょう。パーツライブラリから`UIImageView`をセルの上に配置します。X座標を8、Y座標を10で幅と高さは140に設定しましょう。
![](https://www.evernote.com/shard/s324/sh/1d62344e-e0a2-4ddb-b6bd-1f080fc04b04/cd155807093d8f882d8238aa657390e8/res/b65c2b68-7002-4a28-9094-9de92f26d2f8/skitch.png)

記事を表示させるためのラベルも配置します。`UILabel`をライブラリからセル上に配置してください。X座標は156、Y座標は30にし、幅を436高さを120に設定してください。
![](https://www.evernote.com/shard/s324/sh/f441fc92-7bc3-4e75-8ba0-df4d26f263ed/b7f47619afe520f1/res/641c3227-85ae-4917-8e81-73438f06a611/skitch.png)

記事のタイトルを表示させるラベルも用意します。記事ラベルと同様に配置していきます。X座標は156Y座標は10、幅は436高さは20で設定しましょう。
![](https://www.evernote.com/shard/s324/sh/a4773f3c-a91b-446c-a8d5-fd5364c990c4/80cfd538797e5c87/res/89d28e66-1d51-4a99-846c-a858aca5a023/skitch.png)

次はセルに配置したアイテムごとに識別するためのタグをつけていきたいと思います。`UIImageView`を選択して`Tag`の部分を`1`に設定しましょう。また同様に記事ラベルとタイトルラベルの設定してください。
![](https://www.evernote.com/shard/s324/sh/45829b3a-96ed-44ce-8a27-8515bc815d43/01541bf13f391a8a9590aad39036680b/res/36dc31e1-9f93-4825-8aec-95fc52fd2848/skitch.png)
![](https://www.evernote.com/shard/s324/sh/a4136bb0-2d87-463a-ae47-c59002ec3191/fc95012474bfc471ccefe6dc8eb0eae9/res/be68bf92-1f1c-4052-ae1f-35dc36d2990f/skitch.png)
![](https://www.evernote.com/shard/s324/sh/9e0b681c-9392-47d1-b268-7b47031db3ef/be7e1103c5d6ac97da46169a6a0dcbb8/res/ddb3293c-6a3d-4b7a-89e6-511206686eb4/skitch.png)

次は記事を更新するためのボタン配置します。ライブラリから`Bar Button Item`を`NewsTableViewContorller`の右上のNavigation Barに配置しましょう。そして`Idetifier`を`refresh`にしてあげます。
![](https://www.evernote.com/shard/s324/sh/ea0248c2-d52c-4285-8f51-da3f7eee24b4/c5daa5ec1585408d1060f174accd7ce3/res/9917dba5-bd92-491c-a560-5f8eb82f0d23/skitch.png)

次に`AutoLayout`について説明します。この機能は以前からあったのですが、あまり使うことはありませんでした。しかし、2014/9/19日よりiPhone6が発売されたことで必須の機能になりました。iPhoneの画面の種類が増えたことにより、ただStoryboardにパーツを配置していくだけでは、端末が変わった時にレイアウトが変わってしまいます。`AutoLayout`はそれを解決するために利用し、どの端末の画面サイズにも対応できる、柔軟なユーザーインターフェイスを作ることができます。　　

`AutoLayout`では`制約:Constraints`という考え方をします。まずは制約をつけてみましょう。先ほど配置した`UIImageView`を選択してください。そしてキャンバスの右下の4つ並んでるアイコンが`AutoLayout`を管理するもので、このアイコン左から2番目のアイコンを選択してください。ポップアップが現れるとおもいます。上の方に白い四角形に4辺からからピンが出ています。これらは選択したアイテムのマージンを管理するものです。今回は`UIImageView`を配置した位置から動かしたくないので、4つのピンを全て選択してください。次の項目では幅と高さに制約をつけることができます。`UIImageView`の大きさは変えたくないので、`width`と`height`にチェックをつけましょう。
![](https://www.evernote.com/shard/s324/sh/e2c98694-feee-4e96-96d1-d4578f3c0c70/df9ffd2c80ea2a1ca346a630b3c6f090/res/31e4809c-22e2-4203-9a45-a1013fcbcb73/skitch.png)

次は、記事ラベルに制約をつけていきましょう。基本的に`UIImageView`の時と変わりません。まずは4辺のマージンを固定します。また記事ラベルは高さを変えたくないので高さを固定します。横幅はデバイスによって変わるので`width`は今回指定しません。
![](https://www.evernote.com/shard/s324/sh/7b4902f7-e03f-41f8-bc86-3ba39e78cd04/9e5b52460a37bc9bd94b1f248f05e864/res/7f9139bc-bcc5-4aea-a981-aaed9154c52b/skitch.png)

最後にタイトルラベルに制約をつけましょう。タイトルラベルは記事ラベルと全く同様の設定で構いません、自分の制約を設定してみましょう。
![](https://www.evernote.com/shard/s324/sh/a200cfee-ddd9-4817-83ed-98b2c2782b15/3a2a1460986d7a3b7fa73d86a4ca2640/res/6366a437-00e1-4ab6-8de7-3175f5d03b1a/skitch.png)

さて、ここまでセルに色々配置して設定してきましたが、いまのままではコードからセルにアクセスすることができません。そこでセルを識別するための名前をつけてあげる必要があります。セルを選択し`Idetifier`を`NewsCell`にしてあげてください。これで後ほど書くコードから今名前をつけたセルにアクセスすることができます。
![](https://www.evernote.com/shard/s324/sh/61ebecd1-aa7e-473b-8a78-448bf63f365b/735e0111ef2ceac29a5a4270f10e27cf/res/161060a3-1e88-4009-8007-3a1d79be2bb9/skitch.png)

次は、`Segue`について説明したいとおもいます。例えばニュース一覧のセルをタップするとその詳細画面に飛びます。また設定ボタンをタップすると次は設定画面に飛びます。これらはともに画面が遷移しています。この遷移に名前をつけることで遷移元の画面から遷移先に値を渡したい時などに役に立ちます。

では、まずは遷移を実際に追加しましょう。`NewsTableViewController`選択し`DetailViewController`に引っ張りましょう。そうすると二つの間に矢印が追加されます。これが`Segue`です。
![](https://www.evernote.com/shard/s324/sh/d074eb08-7461-4b7c-af77-b13c5d589db9/efeaaaf140bbdaa1256cb8c57e6dbcc9/res/6a1df7bc-8cd6-49a7-929a-6243a8649aac/skitch.png)

次に先ほど追加した`Segue`を選択して識別するラベルを追加していきます。`Idetifier`に`DetailSegue`と入力しましょう。
![](https://www.evernote.com/shard/s324/sh/9ab5e4ea-b794-4bc4-9c72-b3b29ac05c28/7814504ea4bcecb9455b7e29154c7b0b/res/b2fc5ceb-f34f-4e80-b3bd-615df5016b4d/skitch.png)

`DetailViewController`にもパーツを配置していきましょう。まずは記事を共有するためのボタンです。はじめに`Navigation Item`を上部のNavigation BarにD&Dしましょう。次に`Bar Button Item`を右上に配置します。そしてそのボタンの`Identifier`を`Action`にしてあげると見慣れたiOSの共有ボタンになるとおもいます。
![](https://www.evernote.com/shard/s324/sh/d21d7ba5-8820-4a67-b5f2-51efe77a6d6a/2cb50c2e323ff646ee588e11ef1a8ccd/res/6fe1ffa3-45df-4f7f-8587-1889da359ade/skitch.png)

これで最後のパーツになります。`Web View`はウェブページを表示するためのパーツでブラウザアプリを作るときにも使います。今回はこれを画面目一杯に配置しましょう。
![](https://www.evernote.com/shard/s324/sh/afc7997f-83b9-41e6-bbe4-26cae70d2fb3/510d121eb936dba2ad58ba3ee9cb5c35/res/65068a71-ade5-4934-a807-906d58e6f851/skitch.png)

いよいよStoryboardの作業も最後です。今まで配置してきたパーツをコードとつなげます。まず、Xcodeの画面の右上に![](https://www.evernote.com/shard/s324/sh/270f9fb1-1493-49ee-8c0c-5e985c15e1ee/5a13b5ecd7f557fcebdf1f6c5cff8773/deep/0/Main.storyboard.png)このようなアイコンが並んでいると思いますが、真ん中のものを選んでください。そうすることでStoryboardとソースコードを同時に見ることができます。

`NewsTableViewController`の配置した更新ボタンを選択肢Controlキーを押しながらソースコードの下の方の引っ張っていきます。画像の位置辺りでいいです。
![](https://www.evernote.com/shard/s324/sh/4f4b8f6e-1ea6-4d41-965d-ea23506c5aee/d9542be73fb99fa2da2c14da5aa4550e/res/76ff383d-5821-44b9-8a8c-c5d6e5fb0d48/skitch.png)

次にポップアップが出ると思いますがこれの`Collection`の部分を`Action`、`Name`を`refresh`にして`Connect`を選択しましょう。
![](https://www.evernote.com/shard/s324/sh/aad588d5-020c-47f7-80c0-fe4edd906239/b00a97c115239c7c41243e5385204cf8/res/e06a9eaa-1bf3-4225-a4aa-7ca1951a9ec3/skitch.png)

最後に`DetailViewController`に配置した`Web View`もコードとつなげてあげます。上と同様にやってみてください。なお`Web View`は`Collection`を`Outlet`、`Name`を`webView`に設定しましょう。
![](https://www.evernote.com/shard/s324/sh/eba8bd76-52aa-4b8e-a8b0-40aa7fa8abf4/7ea1e272fa9e781c4c4f616c06c8c712/res/cc31f2c1-7579-4872-9d82-fef57874f008/skitch.png)

ここからはソースコードをどんどん書いていきましょう。まずは今回扱うデータについてです。今回はGoogle Ajax Feed API
`https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=RSSのURL&num=記事数`
を使ってRSSをJSONに変換してSwiftで扱いたいと思います。Lig.Incさんのブログの記事をとってみましょう。LigさんのブログのRSSフィードは`http://liginc.co.jp/feed`です。また記事数は20件くらいにしましょう。そしたら以下のようなURLができます。クリックしてみると取得できていることがわかります。   
[https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20](https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20)
```json
{
    "responseData": {
        "feed": {
            "author": "", 
            "description": "", 
            "entries": [
                {
                    "author": "LIGブログ編集部", 
                    "categories": [
                        "お知らせ", 
                        "その他", 
                        "ニュース"
                    ], 
                    "content": "<p>こんにちは！　はじまりました「今週のLIGブログまとめ」、初回は編集部より朽木がお送りします。 さて、僕は今年で28歳になるのですが、アドディレクターのきょうへいが同い年で、わりと仲良しです。 そんなきょうへいですが、ブ […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/news/notice/other-notice/135799">佐藤可士和さんインタビュー、仕事をサボる菊池【今週のLIGブログ】</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは！　はじまりました「今週のLIGブログまとめ」、初回は編集部より朽木がお送りします。 さて、僕は今年で28歳になるのですが、アドディレクターのきょうへいが同い年で、わりと仲良しです。 そんなきょうへいですが、ブ [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/news/notice/other-notice/135799", 
                    "publishedDate": "Fri, 12 Dec 2014 22:00:11 -0800", 
                    "title": "佐藤可士和さんインタビュー、仕事をサボる菊池【今週のLIGブログ】"
                }, 
                {
                    "author": "朽木誠一郎", 
                    "categories": [
                        "PR", 
                        "おもしろ"
                    ], 
                    "content": "<p>こんにちは、メディア事業部の朽木です。 新しくしたいパソコンや、役目を終えた家具家電、買ったけど着なかった服・・・ 捨ててもいいけど、捨てるのにはちょっと抵抗がある、そんなモノがみなさんのお部屋にはありませんか？ &amp;nb […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/omoshiro/pr-omoshiro/132156">ゴミ屋敷のモノを全部買取してもらって、綺麗な部屋になるまで断捨離した話</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは、メディア事業部の朽木です。 新しくしたいパソコンや、役目を終えた家具家電、買ったけど着なかった服・・・ 捨ててもいいけど、捨てるのにはちょっと抵抗がある、そんなモノがみなさんのお部屋にはありませんか？ &#038;nb ...", 
                    "link": "http://liginc.co.jp/omoshiro/pr-omoshiro/132156", 
                    "publishedDate": "Thu, 11 Dec 2014 17:00:05 -0800", 
                    "title": "ゴミ屋敷のモノを全部買取してもらって、綺麗な部屋になるまで断捨離した話"
                }, 
                {
                    "author": "づや", 
                    "categories": [
                        "JavaScript", 
                        "Web制作", 
                        "その他"
                    ], 
                    "content": "<p>こんにちは、CTOのづやです。 前回はTwenn系の使い方について紹介しましたが、今回はTimeline系の使い方について紹介していきたいと思います。 こちらには読んで字の如く、いろいろいろいろなアニメーションをタイムラ […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/web/js/other-js/131748">アニメーションに便利なJavaScriptライブラリTweenMaxを使ってみる（その2）</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは、CTOのづやです。 前回はTwenn系の使い方について紹介しましたが、今回はTimeline系の使い方について紹介していきたいと思います。 こちらには読んで字の如く、いろいろいろいろなアニメーションをタイムラ [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/web/js/other-js/131748", 
                    "publishedDate": "Thu, 11 Dec 2014 15:00:49 -0800", 
                    "title": "アニメーションに便利なJavaScriptライブラリTweenMaxを使ってみる（その2）"
                }, 
                {
                    "author": "段田", 
                    "categories": [
                        "Web制作", 
                        "まとめ", 
                        "アプリ", 
                        "ソフト・ツール"
                    ], 
                    "content": "<p>みなさんこんにちは、段田です。 いきなりですが、みなさん漫画って何で読まれてますか？　紙？　電子書籍？ 僕は以下の3つ理由からもっぱら電子書籍派になりました。 iPhone6 Plusを買ったことで画面サイズが大きくなり […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/web/tool/app/130571">漫画をダウンロードしてiPhone＆Androidで持ち歩ける電子書籍アプリおすすめ30選</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "みなさんこんにちは、段田です。 いきなりですが、みなさん漫画って何で読まれてますか？　紙？　電子書籍？ 僕は以下の3つ理由からもっぱら電子書籍派になりました。 iPhone6 Plusを買ったことで画面サイズが大きくなり [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/web/tool/app/130571", 
                    "publishedDate": "Thu, 11 Dec 2014 15:00:34 -0800", 
                    "title": "漫画をダウンロードしてiPhone＆Androidで持ち歩ける電子書籍アプリおすすめ30選"
                }, 
                {
                    "author": "姐さん", 
                    "categories": [
                        "Illustrator", 
                        "Photoshop", 
                        "Web制作", 
                        "ウェブデザイン"
                    ], 
                    "content": "<p>こんにちは、デザイナーの白浜です。 今回は人気のポリゴンスタイルの画像をPhotoshopとIllustratorで作成する方法をご紹介したいと思います。 参考サイト まず初めに今回の参考サイトから。 【Photosho […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/web/design/photoshop/133405">PhotoshopとIllustratorで画像をポリゴン風に加工する方法</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは、デザイナーの白浜です。 今回は人気のポリゴンスタイルの画像をPhotoshopとIllustratorで作成する方法をご紹介したいと思います。 参考サイト まず初めに今回の参考サイトから。 【Photosho [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/web/design/photoshop/133405", 
                    "publishedDate": "Thu, 11 Dec 2014 15:00:16 -0800", 
                    "title": "PhotoshopとIllustratorで画像をポリゴン風に加工する方法"
                }, 
                {
                    "author": "勢古口", 
                    "categories": [
                        "お役立ち情報", 
                        "まとめ", 
                        "ライフスタイル"
                    ], 
                    "content": "<p>こんにちは。コワーキングスペース＆シェアオフィスのいいオフィス管理人、勢古口です。 いいオフィスには大きなキッチンがあるので、食を通じたイベントも多数開催しております。勉強会のあとの懇親会など、みんなで料理を一緒に食べる […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/life/useful-info/132495">手作り料理で貸切パーティや懇親会を！キッチンのあるレンタルスペースまとめ【渋谷編】</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは。コワーキングスペース＆シェアオフィスのいいオフィス管理人、勢古口です。 いいオフィスには大きなキッチンがあるので、食を通じたイベントも多数開催しております。勉強会のあとの懇親会など、みんなで料理を一緒に食べる [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/life/useful-info/132495", 
                    "publishedDate": "Wed, 10 Dec 2014 15:00:52 -0800", 
                    "title": "手作り料理で貸切パーティや懇親会を！キッチンのあるレンタルスペースまとめ【渋谷編】"
                }, 
                {
                    "author": "野田", 
                    "categories": [
                        "Web制作", 
                        "その他", 
                        "まとめ", 
                        "ウェブデザイン"
                    ], 
                    "content": "<p>こんにちは。野田です。 突然ですが、僕はとても飽き性です。なので、仕事もプライベートも楽しいこと重視で動いています。 すべてが楽しいことではないと分かっているのですが、どんなことでも楽しくなるように、常に心がけています。 […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/web/design/other-design/133018">デザイナーのためのテスト・クイズまとめ「フォント当て」「カーニング」など</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは。野田です。 突然ですが、僕はとても飽き性です。なので、仕事もプライベートも楽しいこと重視で動いています。 すべてが楽しいことではないと分かっているのですが、どんなことでも楽しくなるように、常に心がけています。 [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/web/design/other-design/133018", 
                    "publishedDate": "Wed, 10 Dec 2014 15:00:20 -0800", 
                    "title": "デザイナーのためのテスト・クイズまとめ「フォント当て」「カーニング」など"
                }, 
                {
                    "author": "ハマ", 
                    "categories": [
                        "ビジネス", 
                        "ライフスタイル"
                    ], 
                    "content": "<p>こんにちは、メディア事業部のハマです。 私は以前技術系の出版社で雑誌記者をやっていたことがあるのですが、当時から現在に至るまで、どうにも気が進まない作業の中の1つに「取材音声の文字起こし原稿を編集する」というものがありま […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/life/business/132398">元雑誌記者が考える、文字・テープ起こし原稿を編集するための4つのステップ</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは、メディア事業部のハマです。 私は以前技術系の出版社で雑誌記者をやっていたことがあるのですが、当時から現在に至るまで、どうにも気が進まない作業の中の1つに「取材音声の文字起こし原稿を編集する」というものがありま [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/life/business/132398", 
                    "publishedDate": "Wed, 10 Dec 2014 15:00:12 -0800", 
                    "title": "元雑誌記者が考える、文字・テープ起こし原稿を編集するための4つのステップ"
                }, 
                {
                    "author": "そめひこ", 
                    "categories": [
                        "おもしろ", 
                        "ステマ", 
                        "殿堂入り"
                    ], 
                    "content": "<p>こんにちは、LIGでメディア事業部のマネージャーをやっている寺倉そめひこです。 突然ですが、僕ってイケメンじゃないですか？ 会社に入って少し体重は増えましたが、まだまだイケると思うんです。でも、自分でイケメンだって言って […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/omoshiro/sutema/131076">企業の新しいファン作り企画・イケメンチップスに参加できませんでした。</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは、LIGでメディア事業部のマネージャーをやっている寺倉そめひこです。 突然ですが、僕ってイケメンじゃないですか？ 会社に入って少し体重は増えましたが、まだまだイケると思うんです。でも、自分でイケメンだって言って [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/omoshiro/sutema/131076", 
                    "publishedDate": "Tue, 09 Dec 2014 17:00:21 -0800", 
                    "title": "企業の新しいファン作り企画・イケメンチップスに参加できませんでした。"
                }, 
                {
                    "author": "John", 
                    "categories": [
                        "まとめ", 
                        "ビジネス", 
                        "ライフスタイル"
                    ], 
                    "content": "<p>こんにちは。ジョンです。12月からブランディングチームという部署に異動し、コピーライターとディレクターをしています。 過去、ぼくが言われてきたセリフで多かったのが「いいコピーって何？」と「オレ（ワタシ）のコピー書いてよ」 […]</p>
<p>The post <a rel="nofollow" href="http://liginc.co.jp/life/matome-life/131357">事例から学ぶ、優れたキャッチコピー10選。 第一回「コピーされるコピー」</a> appeared first on <a rel="nofollow" href="http://liginc.co.jp">株式会社LIG</a>.</p>", 
                    "contentSnippet": "こんにちは。ジョンです。12月からブランディングチームという部署に異動し、コピーライターとディレクターをしています。 過去、ぼくが言われてきたセリフで多かったのが「いいコピーって何？」と「オレ（ワタシ）のコピー書いてよ」 [&#8230;]
The ...", 
                    "link": "http://liginc.co.jp/life/matome-life/131357", 
                    "publishedDate": "Tue, 09 Dec 2014 15:00:59 -0800", 
                    "title": "事例から学ぶ、優れたキャッチコピー10選。 第一回「コピーされるコピー」"
                }
            ], 
            "feedUrl": "http://liginc.co.jp/feed", 
            "link": "http://liginc.co.jp", 
            "title": "株式会社LIG", 
            "type": "rss20"
        }
    }, 
    "responseDetails": null, 
    "responseStatus": 200
}
```
こんな感じのデータが返ってくるのでこれを叩いてTableViewに表示させてみましょう。まずはURLを保持する変数と記事を保持する配列を宣言しましょう。`NewsTableViewController.swift`を開いて以下の二つの変数を追加しましょう。
```swift
import UIKit

class NewsTableViewController: UITableViewController {
    
    // APIリクエスト用のURL
    let URLString = NSURL(string:"https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20](https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://liginc.co.jp/feed&num=20")
    
    // 記事用の配列
    var entries = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    ...
```
コードを解説します。`NSURL`はウェブのURLを管理するクラスでイニシャライズするには、
```swift
NSURL(string:"URLの文字列")
```
で初期化することができます。よく使うので覚えておきましょう。  
次は`entries`配列です。この配列は`NSMutableArray`と言われるクラスで`NSArray`を継承したクラスです。`NSMutableArray`はこちらは可変長なのでいつでも要素を増やしたり減らしたりできます。  

今度は更新ボタンのアクションを書いていきましょう。この関数の中を下記のように編集しましょう。
```swift
@IBAction func refresh(sender: AnyObject) {
        
        // 記事用の配列の中身を削除
        self.entries.removeAllObjects()
        
        // ダウンロードの準備
        var downloadDataTask = NSURLSession.sharedSession().dataTaskWithURL(self.URLString!, completionHandler: {data, response, error in
            
            // 返ってきたデータをNSDictionaryにキャスト
            var dictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            
            // 返ってきたJSONのentriesを上のentriesプロバティに代入
            if var responseData = dictionary["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSArray {
                        // entries配列をentriesプロパティに追加
                        self.entries.addObjectsFromArray(entries)
                    }
                }
            }
            
            // メインスレッドでテーブルビューを更新
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView.reloadData()
            })
            
        })
        
        // ダウンロードを開始
        downloadDataTask.resume()
    }
```
この関数はボタンがタップされるたびに呼び出されます。最初の行では上で宣言した`entries`中身を空にします。次に`NSURLSession`クラスと呼ばれるバックグラウンドで通信するクラスで通信をします。`downloadDataWithTask`という変数にインスタンスを入れてあげましょう。`sharedSession()`は`NSURLSession`のクラスメソッドでデフォルトの設定が適用されます。`dataTaskWithURL`は`NSURL`型のurlと呼ばれる引数を取るインスタンスメソッドでタウンロードが完了すると`completionHandler`が呼び出されます。ダウンロードしたものは`NSData`と型で返ってきます。今度はそれをシリアライズしてあげるためのクラス`NSJSONSerialization`でシリアライズしてから、扱いやすいように`NSDictionary`型にキャストして変数`dictionary`に代入します。キャストするには`as`を使います。  
```swift
if var responseData = dictionary["responseData"] as? NSDictionary {
	if var feed = responseData["feed"] as? NSDictionary {
		if var entries = feed["entries"] as? NSArray {
			self.entries.addObjectsFromArray(entries)
        }
   	}
}			
```
この部分では返ってきたJSONデータの中の`responseData/feed/entries`を取り出すための処理をしています。

```swift
dispatch_async(dispatch_get_main_queue(), {
	self.tableView.reloadData()
})
```
tableViewでダウンロードしたあとにデータを表示させるには一度tableViewを更新してあげる必要がある。しかしCocoaプログラミングでは画面の表示に関わる処理をするときにはメインスレッドでやってあげる必要がある。一方で先ほどのハンドラーの中ではメインとは別のスレッドで処理が行われている。そこでメインスレッドでtableViewを更新してあげるために`dispatch_async`メソッドを使ってあげます。引数にはメインキューを渡してあげます。そしてその中でtableViewのメソッドの`reloadData()`を呼び出しています。これでデータがダウンロードし終わったらtableViewを更新してくれます。最後に`NSURLSession`の`resume()`メソッドでダウンロードを始めます。  
次は実際にセルにデータと表示させてみましょう。まずはセルの数を設定します。
```swift
override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // entriesの数だけ表示
        return self.entries.count
    }
```
このtableViewのメソッドはセルの表示数を返します。ここでは`entries`配列の数だけ返してあげれば記事の数に応じてセルの数を変えてあげることができます。
```swift
override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as UITableViewCell
        
        // エントリーのそれぞれの値を取得
        var entryTitle = self.entries[indexPath.row]["title"] as String
        var entryContent = self.entries[indexPath.row]["contentSnippet"] as String
        
        // UIパーツをタグ付け
        var eyeCatchImage = cell.viewWithTag(1) as UIImageView
        var titleLabel = cell.viewWithTag(2) as UILabel
        var contentsLabel = cell.viewWithTag(3) as UILabel
        
        // UIパーツに値を表示
        eyeCatchImage.image = UIImage(named: "lig")
        titleLabel.text = entryTitle
        contentsLabel.text = entryContent
        
        return cell
    }
```
次にセルの内容を設定してあげます。  
```swift
let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as UITableViewCell
```
この部分ではセルのインデックス及び`identifier`に基づいてセルのインスタンスを作成します。次に`entries`配列の中のタイトルと記事を別々の変数に保持しておきます。その際`String`型にキャストしてあげます。次はStoryboardでタグをつけたパーツを取得しましょう。1は`UIImageView`、2は`UILabel`、3も`UILabel`にキャストして変数に代入します。最後にそれぞれのプロパティにアクセスして表示させたいデータを入れてあげましょう。またここでサイトの画像を一緒に表示させておくと、よりアプリらしくなります。今回は[LIGさんの画像](https://www.evernote.com/shard/s324/sh/2871fb3a-ab15-4a32-96d5-c5b48026d3c9/36525ebfa0166f74/res/7ac82e01-c86f-4b9d-97a1-b282e3cc78f2/lig.png)を使わせていただきましょう。
ダウンロードしたらXcodeの左のプロジェクトフォルダに直接D&Dしてあげましょう。  
さて、ここまで出来たら一度起動してみます。![](https://www.evernote.com/shard/s324/sh/9cac0fd7-137c-4ca2-84d4-6f4b78dc6aee/3cce537a251727cfdb738718f96c4174/deep/0/NewsTableViewController.swift.png)
シュミレータには様々な種類があり、iPhone、iPad共にテストすることができます。  
![](https://www.evernote.com/shard/s324/sh/94f9f259-305a-4b02-87ba-c063b4126c99/c899dfad0575f61097181ebc76561c9c/deep/0/Screenshot-12-14-14,-23-42.png)

更新ボタンを押してみましょう。うまく動くとこのように表示されると思います。  
さぁ、最後に詳細を表示させて仕上げます。`DetailViewContorller`を開いてください。  

まずはこちらに`NewsTableViewContorller`から受け取るURLを保持するための変数を用意してあげます。　
```swift
class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    // URL受け取り用の変数
    var URLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLStringをNSURLに変換
        var url = NSURL(string: URLString)
        
        // webViewでリクエストを読み込む
        webView.loadRequest(NSURLRequest(URL: url!))
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
```
受け取ったURLは`NSURL`に変換して扱いやすくします。そしてUIWebViewのメソッドの`loadRequest`でリクエストを読み込みwebViewに表示します。
さて、`DetailViewController`はこれでおわりなのですが、このままではセルを選択しても`DetailViewController`には遷移しません。そこで次は`NewsTableViewController`から色々やらなければなりません。  

```swift
// 画面遷移の準備
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		// セグエの識別子をチェック
        if segue.identifier == "DetailSegue" {
        	// 遷移先のViewController
            var detailViewContorller = segue.destinationViewController as DetailViewController
            // DetailViewControllerのURLStringプロパティにアクセス
            detailViewContorller.URLString = sender as String
        }
    }
```
`prepareForSegue`メソッドはセグエが実行させる前に呼び出されるものでその名の通り準備する役割を担います。引数で渡ってきた`segue`の`idetifier`が`"DetailSegue"`ならば、目的のViewControllerに`DetailViewController`を指定してそのインスタンスを作ってあげます。そして`URLString`プロパティに`sender`を渡して終わりです。 　
 
最後にセルが選択された時にセグエを実行してあげます。  
```swift
// セルが選択されたときに呼ばれる
override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		// senderに記事のリンクを渡してあげる
        performSegueWithIdentifier("DetailSegue", sender: entries[indexPath.row]["link"] as String)
    }
```
これでセルを選択すると画面が遷移して、その記事のURLのページが表示されると思います。実行してみましょう。![](https://www.evernote.com/shard/s324/sh/42a6da5d-1a4d-45f5-a6cf-97d023041e07/0b18f44849c5b18c54847221065a5938/deep/0/Screenshot-12-15-14,-00-15.png)
NavigationControllerによって戻るボタンもうまくできています。これでだいぶアプリっぽくなりました。
##### お疲れ様でした。これでみなさんはiOS開発の基本的なことができるようになったと思います。しかしこのアプリはまだ完成していません。記事の詳細画面に配置した共有ボタンをまだ実装していません。ぜひ自分の手で実際に実装方法を調べて実装してみることをおすすめします。最初は難しいかもしれません、しかしそれらを乗り越えてこそ成長できると思いますし、達成感も味わえます。それでは、iOSの世界を一緒にさらに探検していきましょう。
---
## 課題
#### 課題
- 共有ボタンを実装してみましょう。 
- 今のままでは、画像が大きすぎます。もうすこし画像をちいさくし、UIをブラッシュアップしてみてください。 