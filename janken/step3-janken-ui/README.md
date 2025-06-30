# Step 3: Janken UI

## 学習ポイント

### 1. HStack
`HStack` は複数のビューを横に並べるためのコンテナです。
- H は Horizontal（水平）の略
- spacing: 要素間の間隔を指定

```swift
HStack(spacing: 30) {
    // ボタンを横に並べる
}
```

### 2. Image の使い方
SF Symbols を使って画像を表示します。
```swift
Image(systemName: "hand.raised.fill")
    .font(.system(size: 50))
```
- `systemName`: SF Symbols の名前を指定
- `.font()`: 画像のサイズを調整

### 3. 複数の @State 変数管理
```swift
@State private var myHand = "questionmark"
@State private var cpuHand = "questionmark"
```
- 複数の状態を管理する場合、それぞれに @State をつける
- 初期値として "questionmark"（?マーク）を設定

### 4. Button のカスタマイズ
```swift
Button(action: {
    myHand = "hand.raised.fill"
}) {
    VStack {
        Image(systemName: "hand.raised.fill")
        Text("✊")
    }
}
```
- action: ボタンが押されたときの処理
- クロージャの後の { } 内: ボタンの見た目をカスタマイズ

### ポイント
- SF Symbols は Apple が提供する無料のアイコンセット
- VStack と HStack を組み合わせて複雑なレイアウトを作れる
- @State 変数を更新すると、関連する View が自動的に再描画される

## 試してみよう
1. ボタンの間隔を変えてみる
2. 画像の色を変えてみる
3. ボタンに背景色をつけてみる（.background() を使う）