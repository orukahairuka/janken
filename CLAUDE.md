# CLAUDE.md
## プロジェクト概要
SwiftUI じゃんけんアプリ ハンズオン用。1年生向けに基礎から完成まで学習できる構成。
---
## フォルダ構成
- step1-hello-world/
- step2-button-basics/
- step3-janken-ui/
- step4-game-logic/
- step5-final-design/
- complete/
各ステップに ContentView.swift と README.md を作成。
---
## ステップ詳細
### Step 1: Hello World
- Text: "じゃんけんアプリ"
- フォント: .largeTitle
- 色: 青
- VStack で中央配置
- コメント: 日本語、初心者向け
**README.md**
- Text, VStack, 修飾子の学習ポイント
---
### Step 2: Button Basics
- @State で tapCount
- "タップしてね" Button
- tapCount 表示
- コメント: @Stateを信号機に例える
**README.md**
- @State 概念
- Button の使い方
---
### Step 3: Janken UI
- タイトル: "じゃんけんゲーム"
- 相手の手: 画像で表示（最初は?画像）
- 自分の手: 画像で表示（最初は?画像）
- HStack に ✊✌️✋ の3つのボタン（各ボタンに対応する手の画像を配置）
- フォントサイズ50（ボタンタイトルを使う場合）
- @State myHand, cpuHand を画像名（String型）で管理
- ボタンを押したら自分の手画像が更新される
**README.md**
- HStack
- Imageの使い方
- 複数 @State 変数管理
---
### Step 4: Game Logic
- CPU の手をランダム決定
- 勝敗判定関数
- 結果表示 @State 追加
- ボタン押下時: 自分の手設定 → CPU 決定 → 勝敗判定 → 結果表示
**README.md**
- 関数作成
- ランダム
- if 文条件分岐
---
### Step 5: Final Design
- 全体 .padding()
- VStack.background(Color.gray.opacity(0.1))
- .cornerRadius(20)
- 結果表示: 大きく色分け（勝:青, 負:赤, あいこ:緑）
- ボタンに .buttonStyle(.borderedProminent)
- 適切なスペーシング
- じゃんけん画像を適切に配置し見やすく
**README.md**
- デザイン修飾子
- 色指定
- 画像配置デザイン
---
### Complete版
- 対戦成績記録
- リセットボタン
- 結果表示アニメーション
- 洗練UI
- じゃんけん手画像をよりリッチなデザインに
**README.md**
- 発展機能解説
- 自習ヒント
---
## ルート README.md
- ハンズオン概要
- 各ステップ説明
- 必要環境
- 参考リンク
---
## 開発メモ
- コメントは常に日本語で初心者に優しく。
- じゃんけんの手は SF Symbols または Assets に登録した画像を使用。
- ファイル命名、コード設計はSwiftUI公式スタイルガイド準拠。