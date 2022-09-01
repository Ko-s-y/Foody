# Foody!

<p align="center">
<img src="https://user-images.githubusercontent.com/100200496/185188262-914d6ddc-172d-4e99-8cf8-a9f06f089069.png">
</p>

---

### アプリURL
https://foody-life.herokuapp.com/

---

### レストランの存在価値
レストランとは「ただ食事をする場所」では無く、味とサービス、そして空間を五感全てで感じられる場所です。

AIの技術の発展により様々なものがAIに代替される中、今後もレストランは「人」と感動を共有できる場所として残して行きたいと心より願ってます。

---

### 主な機能とページ紹介

|  トップページ &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     |  新規登録画面,ログイン画面,アカウント編集画面  | 　本人確認,パスワードリセットメール送信画面  |
| ---- | ---- | ---- |
|  ![5C85C4EF-834A-4B40-BB53-FEEED5929531_AdobeExpress](https://user-images.githubusercontent.com/100200496/187718202-e36e69b1-087d-4045-9e34-b57aa6f6f0c1.gif)  | ![Image from Gyazo](https://gyazo.com/587d7e250a75604626ecdd8be7622da0.gif)  |  ![6774C748-EB6C-43C2-92A0-C07F096FC529](https://user-images.githubusercontent.com/100200496/187486248-a7b7620b-2872-4e2e-bf29-c6f2a77b10ba.jpeg)
|  自分が撮った料理のスライド　 |  新規登録画面,ログイン画面,アカウント編集画面  |  パスワード一致/不一致、パスワード表示/非表示機能,ゲストログイン機能  |  deviseによるconfirmable,recoverable機能  |


|  タイムライン(新規投稿ページ)  |  投稿詳細(コメント投稿ページ)  |  投稿編集ページ  |
| ---- | ---- | ---- |
|  ![Image from Gyazo](https://gyazo.com/e130e98e071704ed042256e676c3060f.gif)  |  ![Image from Gyazo](https://gyazo.com/e9a70cc04be08cbee2de700b88f16e53.gif)   |  ![85C01D04-B578-42EA-917A-1C9CA6ED5952](https://user-images.githubusercontent.com/100200496/187483175-0867c891-cab7-4ac9-b764-529d68ba88d1.jpeg)  |
|  画像プレビューと文字数カウント(改行は2文字扱い)  |  投稿詳細、削除とコメント投稿機能,文字数カウント(改行は2文字扱い)  |  投稿の編集が可能  |
* コメントのアイコンはその投稿に一度コメントをしたら、いいねとブックマークのアイコンはそれぞれアクションを行うと色が変わります。


|  マイページ  |  ユーザー編集ページ  |  新規通知一覧ページ  |
| ---- | ---- | ---- |
|  ![Image from Gyazo](https://gyazo.com/f54a6f40bbdaed4bf9ca7995b6ecdadf.gif)  |  ![4FA096F9-E8B7-4BA9-AD91-BCA3B25A419E](https://user-images.githubusercontent.com/100200496/187489593-7bce2c69-4ada-4fee-89a2-dcbcd9360a22.jpeg)  |  ![505A91C7-C778-4BE1-8B96-54C0D13EEED8](https://user-images.githubusercontent.com/100200496/187489806-b7687aca-8158-4bcd-b66d-79baa1fc775a.jpeg)  |
|  自分が投稿した一覧、ブックマーク一覧、アクティビティの確認  |  ユーザー情報の編集が可能  |  全てのパッシブ情報を閲覧可能　 |
* 新規通知一覧ページより新規通知を1度閲覧すると以降通知一覧ページにて閲覧可能,一度コメントをした投稿に対しては以後全てのユーザーのコメントを通知します。


|  自分以外のユーザーページ  |  admin_user  |  メール画面  |
| ---- | ---- | ---- |
|  <img width="100/">![6B9C31C6-797F-41E4-B1DA-184960A8CEA5](https://user-images.githubusercontent.com/100200496/187494525-bfe954db-054d-460c-8ccf-9a897236cf4b.jpeg)  | ![AF616A27-5A19-4F62-961A-9597FDF118A5](https://user-images.githubusercontent.com/100200496/187500296-110ed7b0-bf5a-4ca8-b6bd-b5d91a5daf57.jpeg)  |  ![D4A2FBF9-8A97-4225-93AB-C7C7DF123EAF](https://user-images.githubusercontent.com/100200496/187593912-69ca411a-4820-4487-b6d2-04a99f32aba4.jpeg)![06351BFA-E0F5-48B7-BBD9-87526F345460_4_5005_c](https://user-images.githubusercontent.com/100200496/187594084-39e26db9-93fc-4220-98cb-5fd01d1b696a.jpeg)
|  PATHはユーザーIDではなくユーザー名,フォローする,アクティビティを確認する,投稿一覧を確認することが可能  |  rails_adminにより作成,admin_userのログイン画面は管理人以外のアクセスはリダイレクトされます  |  お問合せフォーム,deviseのメール内容  |


|  いいね機能,ブックマーク機能  |  アクションユーザーリスト  |  フォロー機能  |
| ---- | ---- | ---- |
|  ![Image from Gyazo](https://gyazo.com/db814f5e9077555b8e11ba4515b65d55.gif)  |  ![Image from Gyazo](https://gyazo.com/ef7b2305dc9d328e9d9c710b1f1f3714.gif)  |  ![Image from Gyazo](https://gyazo.com/8a59856b3d6e8242bad02d02de5b8fad.gif)  |
|  それぞれAjax,ブックマークした投稿はマイページにて閲覧可能  |  いいね,ブックマークしたユーザーを確認可能  |  Ajax,既にフォローされているとフォローバックに変化  |


|  検索機能  |  検索結果ページ  |  フォロー,フォロワーページ  |
| ---- | ---- |  ----  |
|  ![Image from Gyazo](https://gyazo.com/8d3d81375322bfae684cb5cbd7da6d6a.gif)  |  ![02C4F9CF-9854-4F2E-B951-DBFF2CCD224D](https://user-images.githubusercontent.com/100200496/187496183-1f4ae922-c443-4e35-8d4f-e89fa2441341.jpeg)  |  ![Image from Gyazo](https://gyazo.com/76ed1a0ec5b8e778e107d632848dddb2.gif)  |
|  ransack未使用,[投稿,コメント,ユーザー]を検索可能,PCとタブレット,スマホでの検索フォームを別に設置  |  2ワード検索が可能(AND検索),50字でtrancate(切り捨て)  |  それぞれ閲覧可能,数を表示  |


|  新規お問合せページ  |  お問合せ内容確認ページ  |  お問合せ一覧ページ  |
| ---- | ---- | ---- |
|  ![52B3A5CF-1C5C-45AF-90E6-6D0FCF68E356](https://user-images.githubusercontent.com/100200496/187497705-ad4473e4-e2dc-4271-bb20-1adc80f79cbd.jpeg)  |  ![A12F6591-E1BF-4E07-A1B9-103DAD853E32](https://user-images.githubusercontent.com/100200496/187497797-ac10b0eb-f3f4-4b78-a6b2-54a59d07b84d.jpeg) | ![5645D975-9D18-4E1D-8EDD-7E01C355D69D](https://user-images.githubusercontent.com/100200496/187497916-26f9ad94-a347-4ea2-bbe9-22d5288e2eab.jpeg)
|  お問合せの作成が可能,titleはデータリストを活用  |  お問合せの入力内容が確認と送信が可能  |  自分が過去に送ったお問合せを閲覧可能  |
* お問合せは送ったユーザーにお問合せ受付メールが送信,Bccで管理人に同じ内容が自動送信

<table>
  <tr>
    <th>404</th>
    <th>422</th>
    <th>500</th>
  </tr>
  <tr>
    <td><img src="https://user-images.githubusercontent.com/100200496/187595506-5eebc3c4-587a-4b34-8e4d-0f9a322b50ed.jpeg"></td>
    <td><img src="https://user-images.githubusercontent.com/100200496/187595547-5ec51fe1-1583-4f95-afff-f34aae170508.jpeg"></td>
    <td><img src="https://user-images.githubusercontent.com/100200496/187595583-23719e04-3663-4f4c-8c9d-a1da6a9ab67a.jpeg"></td>
  </tr>
  <tr>
    <td colspan="3">もしユーザーが操作ミスでこれらのページに行っても焦らないように,自分がイタリアで撮った気持ちが落ち着きそうな画像を選びました(文字化け対策済み)</td>
  </tr>
</table>

---

### Foody!開発に至った経緯
今の飲食業界の課題の大きな一つとして人材不足が挙がると思われます。
実際に10年前と比べても「レストランで一流のコックを目指したい！」とコックを志望する方が減ってしまっている状況です。

そこでまず取り組むべきは今現在レストランで働いている新米コックの方達の着実なレベルアップと挫折率の低減だと思います。

レストランで働く方達の多くが多忙を極めます。
特に新米のコックたちはインプットをしたくても出来ない状況が多々あり、休憩時間がない日も多々あります。
ようやく仕事が終わって、家に帰ってわずかな睡眠時間を勉強に費やし、睡眠不足で仕事中にミスをしてしまっては元も子もありません。

プロのコック達にとって知識のインプットは必須だと思うのですがそこで考えたのがFoody!です。
`Foody!は自分が新米コックの時にこんなのあったら良いのになと実際に思ったWebアプリです。`

「料理は先輩からみて盗め」の考えを持ったレストランが今でもあるのが現状です。
`聞きたくても職場の人に聞けない、そんな状況で働き、飲食業界を去ってしまった同期の仲間達が何人もいました。
そのような人たちの挫折を少しでも減らせたらと思っております。`

またコロナ禍で減ってしまった様々な調理ジャンルの方達との意見交流の場としても一役買ってくれると信じています。

---

### - こだわったポイント
Foody!は肩書き、経験年数を撤廃したフラットな環境を目指して作成しました。
`あえてユーザーの自己紹介機能はつけておりません。`

機能に関しては実際自分が料理人の目線に立ち、有ったらいいなと思った機能を実装しました。
また現場で働いているコックの友人等にどのような機能があれば嬉しいかも実際に聞き、取り入れました。(検索機能, フォロー機能等)

実際料理人の方達は使うデバイスはおそらくスマートフォンもしくはタブレットだと思われます。
各デバイスでの操作性を意識してレスポンシブデザインを対応しました。
また使いやすさ、シンプルさを意識しました。

---

### レスポンシブ対応済み
* MacOS 1024px~2000px
* Android, FireOS  769px~1023px
* iOS  380px~768px

---

### Foody!の今後の流れ
* AWSにデプロイ
* Dockerの導入
* Reactの導入
* 投稿は増えて来たらpaginationを無限スクロールに変更する可能性があります

---

### ER図
![52B0A6D6-A52A-45D0-87B9-77FD3789CA65](https://user-images.githubusercontent.com/100200496/186084288-ec58d804-5de2-4d32-8401-312349fd5866.png)

---

### 開発スケジュール
* クラス図作成 6/15
* 機能実装 6/16~8/18
* README 8/19
* テスト追加,その他修正と変更 8/20~

---

### 使用技術
##### バックエンド
* Ruby 2.7.5
* Rails 6.1.4

##### フロントエンド
* Bulma
* JavaScript
* JQuery
* Canva(favicon作成)

##### 主要Gem
* devise
* aws-sdk
* kaminari
* rails_admin
* rubocop-airbnb

![094C5F06-7ECE-4107-84FD-7B455F7A8521_4_5005_c](https://user-images.githubusercontent.com/100200496/187426034-e5752aac-a027-49d0-94b0-a5720a8a1834.jpeg)


##### テスト
* rspec

![F37041D5-31D2-48DD-94EE-1478D904C20C_4_5005_c](https://user-images.githubusercontent.com/100200496/187425526-6c5bda97-a5d0-4830-81a0-450765957248.jpeg)

##### インフラ
* Heroku
* AWS S3
