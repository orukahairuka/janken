# Step 4: Game Logic

## 学習ポイント

### 1. 関数の作成
ゲームのロジックを関数に分けて整理します。

```swift
func playGame(myChoice: String) {
    // ゲームを実行する処理
}

func judgeGame(myChoice: String, cpuChoice: String) -> String {
    // 勝敗を判定する処理
}
```

### 2. ランダムな値の生成
```swift
let cpuChoice = hands.randomElement()!
```
- `randomElement()`: 配列からランダムに1つ選ぶ
- `!`: 配列が空でないことが確実なので強制アンラップ

### 3. if 文による条件分岐
```swift
if myChoice == cpuChoice {
    return "あいこ"
}
```

複雑な条件も書けます：
```swift
if (myChoice == "rock" && cpuChoice == "scissors") ||
   (myChoice == "scissors" && cpuChoice == "paper") ||
   (myChoice == "paper" && cpuChoice == "rock") {
    return "勝ち！"
}
```

### 4. Dictionary（辞書）の使用
```swift
let handImages = [
    "rock": "hand.raised.fill",
    "scissors": "hand.raised",
    "paper": "hand.raised.fingers.spread"
]
```
- キーと値のペアでデータを管理
- `handImages[myChoice]` でアクセス

### 5. Computed Property
```swift
var resultColor: Color {
    switch result {
    case "勝ち！":
        return .blue
    // ...
    }
}
```
- 値を計算して返すプロパティ
- result の値に応じて色を変える

### ポイント
- 処理を関数に分けることで、コードが読みやすくなる
- ランダム要素を加えることでゲームらしくなる
- 条件分岐を使って複雑なロジックを実装できる

## 試してみよう
1. 勝敗のメッセージを変えてみる
2. じゃんけんのルールを逆にしてみる（負けが勝ちになる）
3. 連勝数をカウントする機能を追加してみる