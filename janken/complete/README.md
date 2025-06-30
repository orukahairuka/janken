# Complete版 - じゃんけんゲーム

## 発展機能

### 1. 対戦成績の記録
```swift
@State private var wins = 0
@State private var losses = 0
@State private var draws = 0
```
- 勝ち、負け、あいこの回数を記録
- ScoreView コンポーネントで表示

### 2. リセットボタン
```swift
func resetGame() {
    withAnimation {
        wins = 0
        losses = 0
        draws = 0
        // ...
    }
}
```
- すべての成績をリセット
- 無効/有効の状態管理

### 3. アニメーション効果

#### 結果表示アニメーション
```swift
.scaleEffect(showResult ? 1.0 : 0.1)
.animation(.spring(response: 0.5, dampingFraction: 0.6), value: showResult)
```
- スプリングアニメーションで弾むような動き

#### CPU の手の回転
```swift
.rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
.animation(.easeInOut(duration: 0.5), value: isAnimating)
```

#### 遅延実行
```swift
DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
    // 0.5秒後に実行
}
```

### 4. 洗練されたUI

#### グラデーション背景
```swift
LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
              startPoint: .topLeading,
              endPoint: .bottomTrailing)
```

#### カスタムコンポーネント
- `ScoreView`: 成績表示用
- `GameButton`: ゲームボタン用

#### 影とエフェクト
```swift
.shadow(color: .blue.opacity(0.3), radius: 10)
```

### 5. デザインパターン

#### ビューの分割
- メインビューを小さなコンポーネントに分割
- 再利用性と可読性の向上

#### 状態管理
- 複数の @State 変数で複雑な状態を管理
- アニメーション用のフラグ管理

## 自習のヒント

### さらなる機能追加のアイデア
1. **効果音の追加**
   - AVFoundation を使用
   - 勝敗に応じた音を再生

2. **難易度設定**
   - CPU が前回の手を覚えて戦略を立てる
   - 勝率に基づいて調整

3. **統計情報**
   - 勝率の計算と表示
   - 最も使った手の統計

4. **連勝記録**
   - 最大連勝数の記録
   - 連勝中の特別なエフェクト

5. **カスタマイズ機能**
   - テーマカラーの変更
   - 手のアイコンの選択

### 学習を深めるために
1. **Core Data** を使って成績を永続化
2. **Widget** で成績を表示
3. **ShareLink** で成績をシェア
4. **Localization** で多言語対応

### デバッグのコツ
- `print()` でゲームの流れを確認
- Preview で様々な状態をテスト
- シミュレータで実際の動作を確認

## 参考になるSwiftUIの機能
- `@AppStorage`: UserDefaults との連携
- `@Environment`: 環境値の取得
- `GeometryReader`: サイズの取得
- `Path`: カスタム図形の描画

頑張って自分だけのオリジナルじゃんけんアプリを作ってみましょう！