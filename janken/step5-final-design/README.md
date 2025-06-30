# Step 5: Final Design

## 学習ポイント

### 1. デザイン修飾子
様々な修飾子を組み合わせて、見た目を整えます。

#### padding()
```swift
.padding()       // デフォルトの余白
.padding(.top)   // 上だけに余白
.padding(20)     // 数値指定
```

#### background と cornerRadius
```swift
.background(Color.gray.opacity(0.1))
.cornerRadius(20)
```

#### shadow
```swift
.shadow(radius: 5)
```

### 2. 色の指定と透明度
```swift
Color.orange.opacity(0.2)  // 20%の透明度
```

### 3. ZStack で重ねる
```swift
ZStack {
    RoundedRectangle(cornerRadius: 15)
        .fill(Color.orange.opacity(0.2))
    
    Image(systemName: cpuHand)
}
```
- 背景に色付きの四角形
- その上に画像を重ねる

### 4. ForEach でボタンを生成
```swift
ForEach([("rock", "✊"), ("scissors", "✌️"), ("paper", "✋")], id: \.0) { hand, emoji in
    // ボタンを生成
}
```
- 配列をループして同じようなビューを作成
- コードの重複を避ける

### 5. アニメーション
```swift
.scaleEffect(myHand == handImages[hand] ? 1.1 : 1.0)
.animation(.easeInOut(duration: 0.1), value: myHand)
```
- 選択したボタンを少し大きく表示
- スムーズなアニメーション効果

### 6. 条件付き表示
```swift
if !result.isEmpty {
    Text(result)
        // ...
}
```
- 結果がある時だけ表示

### デザインのポイント
- 統一感のある色使い
- 適切な余白（スペーシング）
- 視覚的なフィードバック（選択したボタンが大きくなる）
- 影や角丸で立体感を演出

## 試してみよう
1. 色のテーマを変えてみる（全体的に赤系、緑系など）
2. ボタンの形を変えてみる（Circle を RoundedRectangle に）
3. アニメーションの時間を変えてみる
4. 背景にグラデーションを追加してみる