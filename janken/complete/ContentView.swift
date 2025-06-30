import SwiftUI

struct ContentView: View {
    @State private var myHand = "questionmark"
    @State private var cpuHand = "questionmark"
    @State private var result = ""
    @State private var wins = 0
    @State private var losses = 0
    @State private var draws = 0
    @State private var showResult = false
    @State private var isAnimating = false
    
    // じゃんけんの手を管理
    let hands = ["janken_gu", "janken_choki", "janken_pa"]
    let handNames = [
        "janken_gu": "ぐー",
        "janken_choki": "ちょき",
        "janken_pa": "ぱー"
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]),
                          startPoint: .topLeading,
                          endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                Text("じゃんけんゲーム")
                    .font(.system(size: 28, weight: .bold, design: .rounded))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .shadow(radius: 2)
                
                // 成績表示
                HStack(spacing: 20) {
                    ScoreView(title: "勝ち", count: wins, color: .blue)
                    ScoreView(title: "負け", count: losses, color: .red)
                    ScoreView(title: "あいこ", count: draws, color: .green)
                }
                .padding(.horizontal)
                
                // 相手の手
                VStack(spacing: 8) {
                    Text("相手の手")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(
                                    colors: [Color.orange.opacity(0.3), Color.orange.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 140, height: 140)
                            .shadow(color: .orange.opacity(0.3), radius: 5)
                        
                        if cpuHand == "questionmark" {
                            Image(systemName: cpuHand)
                                .font(.system(size: 60))
                                .foregroundColor(.orange)
                        } else {
                            Image(cpuHand)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                                .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
                                .animation(.easeInOut(duration: 0.5), value: isAnimating)
                        }
                    }
                }
                
                // 結果表示（固定高さ）
                ZStack {
                    if showResult {
                        Text(result)
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.horizontal, 25)
                            .padding(.vertical, 12)
                            .background(
                                Capsule()
                                    .fill(resultBackgroundColor)
                                    .shadow(radius: 5)
                            )
                            .scaleEffect(showResult ? 1.0 : 0.1)
                            .animation(.spring(response: 0.5, dampingFraction: 0.6), value: showResult)
                    }
                }
                .frame(height: 50)
                
                // 自分の手
                VStack(spacing: 8) {
                    Text("自分の手")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(
                                LinearGradient(
                                    colors: [Color.green.opacity(0.3), Color.green.opacity(0.1)],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 140, height: 140)
                            .shadow(color: .green.opacity(0.3), radius: 5)
                        
                        if myHand == "questionmark" {
                            Image(systemName: myHand)
                                .font(.system(size: 60))
                                .foregroundColor(.green)
                        } else {
                            Image(myHand)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110, height: 110)
                        }
                    }
                }
                
                // じゃんけんボタン
                HStack(spacing: 12) {
                    ForEach(hands, id: \.self) { hand in
                        GameButton(
                            hand: hand,
                            handName: handNames[hand] ?? "",
                            isSelected: myHand == hand,
                            action: {
                                playGame(myChoice: hand)
                            }
                        )
                    }
                }
                .padding(.horizontal)
                
                // リセットボタン
                Button(action: resetGame) {
                    Label("リセット", systemImage: "arrow.clockwise")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color.gray)
                        .cornerRadius(20)
                }
                .opacity(wins + losses + draws > 0 ? 1 : 0.5)
                .disabled(wins + losses + draws == 0)
                
                Spacer(minLength: 10)
            }
            .padding()
        }
    }
    
    // ゲームを実行する関数
    func playGame(myChoice: String) {
        withAnimation {
            showResult = false
            isAnimating = true
        }
        
        myHand = myChoice
        
        // 遅延を入れて演出
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let cpuChoice = hands.randomElement()!
            cpuHand = cpuChoice
            
            result = judgeGame(myChoice: myChoice, cpuChoice: cpuChoice)
            
            // 成績を更新
            switch result {
            case "勝ち！":
                wins += 1
            case "負け...":
                losses += 1
            case "あいこ":
                draws += 1
            default:
                break
            }
            
            withAnimation {
                showResult = true
                isAnimating = false
            }
        }
    }
    
    // 勝敗を判定する関数
    func judgeGame(myChoice: String, cpuChoice: String) -> String {
        if myChoice == cpuChoice {
            return "あいこ"
        }
        
        if (myChoice == "janken_gu" && cpuChoice == "janken_choki") ||
           (myChoice == "janken_choki" && cpuChoice == "janken_pa") ||
           (myChoice == "janken_pa" && cpuChoice == "janken_gu") {
            return "勝ち！"
        } else {
            return "負け..."
        }
    }
    
    // ゲームをリセットする関数
    func resetGame() {
        withAnimation {
            wins = 0
            losses = 0
            draws = 0
            result = ""
            showResult = false
            myHand = "questionmark"
            cpuHand = "questionmark"
        }
    }
    
    // 結果に応じた背景色を返す
    var resultBackgroundColor: Color {
        switch result {
        case "勝ち！":
            return .blue
        case "負け...":
            return .red
        case "あいこ":
            return .green
        default:
            return .clear
        }
    }
}

// 成績表示用のビュー
struct ScoreView: View {
    let title: String
    let count: Int
    let color: Color
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text("\(count)")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(color)
        }
        .frame(width: 70, height: 50)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(color.opacity(0.1))
        )
    }
}

// ゲームボタン用のビュー
struct GameButton: View {
    let hand: String
    let handName: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                ZStack {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [Color.blue.opacity(0.3), Color.blue.opacity(0.1)],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 70, height: 70)
                        .shadow(color: .blue.opacity(0.3), radius: isSelected ? 8 : 3)
                    
                    Image(hand)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .scaleEffect(isSelected ? 1.15 : 1.0)
                
                Text(handName)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
            }
        }
        .buttonStyle(.plain)
        .animation(.spring(response: 0.3, dampingFraction: 0.6), value: isSelected)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}