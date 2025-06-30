# SwiftUI じゃんけんアプリ ハンズオン

## 概要
このハンズオンでは、SwiftUIの基礎から始めて、段階的にじゃんけんアプリを完成させていきます。
プログラミング初心者（大学1年生）向けに、各ステップで新しい概念を1つずつ学べるように構成されています。

## 必要環境
- macOS 12.0 以上
- Xcode 14.0 以上
- Swift 5.7 以上

## フォルダ構成
```
janken/
├── step1-hello-world/      # 基本的なText表示
├── step2-button-basics/    # ボタンと状態管理
├── step3-janken-ui/        # じゃんけんのUI作成
├── step4-game-logic/       # ゲームロジックの実装
├── step5-final-design/     # デザインの仕上げ
└── complete/               # 完成版（発展機能付き）
```

## 各ステップの説明

### 📱 Step 1: Hello World
**学習内容**: SwiftUIの基本構造
- Text ビューの使い方
- VStack での配置
- 修飾子（フォント、色）の適用

**作るもの**: 「じゃんけんアプリ」というタイトル表示

### 🔘 Step 2: Button Basics  
**学習内容**: インタラクションの基礎
- @State による状態管理
- Button の実装
- 画面の自動更新の仕組み

**作るもの**: タップ回数をカウントする簡単なアプリ

### 🎮 Step 3: Janken UI
**学習内容**: 複雑なUIの構築
- HStack での横並び配置
- Image（SF Symbols）の使用
- 複数の @State 変数管理

**作るもの**: じゃんけんの手を選択できるUI

### 🧮 Step 4: Game Logic
**学習内容**: プログラムのロジック
- 関数の作成と呼び出し
- ランダム値の生成
- if文による条件分岐
- 勝敗判定の実装

**作るもの**: CPUと対戦できるじゃんけんゲーム

### 🎨 Step 5: Final Design
**学習内容**: UIのブラッシュアップ
- padding、background、cornerRadius
- 色の使い分けと透明度
- buttonStyle の適用
- 適切なレイアウト調整

**作るもの**: 見た目が整ったじゃんけんゲーム

### 🚀 Complete版
**学習内容**: 発展的な機能
- 対戦成績の記録と表示
- アニメーション効果
- カスタムコンポーネント
- より洗練されたデザイン

**作るもの**: 機能豊富な完成版じゃんけんアプリ

## 学習の進め方

1. **各ステップのコードを写経する**
   - まずはコードを書き写して動かしてみましょう
   - エラーが出たら、エラーメッセージをよく読んで解決しましょう

2. **README.mdを読んで理解を深める**
   - 各ステップのREADMEには、そのステップで学ぶ概念の説明があります
   - 「試してみよう」のセクションで、自分なりの改造に挑戦しましょう

3. **前のステップと比較する**
   - 何が追加されたか、どう変わったかを確認しましょう
   - 差分を理解することで、各機能の役割が明確になります

4. **自分なりのカスタマイズ**
   - 色やサイズを変える
   - 新しい機能を追加する
   - エラーを恐れずに実験する

## SwiftUI学習のコツ

### 🔍 Xcodeの活用
- **Command + クリック**: ビューの詳細を見る
- **Option + クリック**: クイックヘルプを表示
- **Control + I**: コードの自動整形
- **Canvas**: リアルタイムプレビューを活用

### 📚 理解のポイント
1. **宣言的UI**: 「どう見えるか」を記述する
2. **状態管理**: @State で変化を監視
3. **修飾子の順番**: 順番によって結果が変わる
4. **ビューの組み合わせ**: 小さな部品を組み合わせて作る

### 🐛 デバッグのヒント
- エラーメッセージは必ず読む
- print() でデバッグ出力
- Canvas でプレビューエラーを確認
- ビルドエラーは上から順に解決

## 参考リンク

### 公式ドキュメント
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Swift Documentation](https://docs.swift.org/swift-book/)
- [SF Symbols](https://developer.apple.com/sf-symbols/)

### 日本語リソース
- [Swift Playgrounds](https://www.apple.com/jp/swift/playgrounds/)
- [SwiftUI 100 Knocks](https://zenn.dev/taka1068/articles/8d87538b47b525)

### コミュニティ
- [Swift Forums](https://forums.swift.org)
- [r/SwiftUI](https://www.reddit.com/r/SwiftUI/)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/swiftui)

## トラブルシューティング

### よくあるエラーと対処法

1. **"Cannot find 'ContentView' in scope"**
   - ファイル名とstruct名が一致しているか確認
   - import SwiftUI が書かれているか確認

2. **"Extra argument in call"**
   - カッコの対応を確認
   - カンマの位置を確認

3. **Preview が表示されない**
   - Canvas の Resume ボタンをクリック
   - Command + Option + P でプレビューを更新

4. **@State が更新されない**
   - @State をつけ忘れていないか確認
   - private をつけているか確認

## 最後に

プログラミングは「習うより慣れろ」です。エラーは学習のチャンス。
完璧を目指さず、まずは動くものを作ることから始めましょう。

楽しみながら、一歩ずつ進んでいってください！🎮✨

---

質問や困ったことがあれば、遠慮なく先生やTAに聞いてください。
Happy Coding! 🚀