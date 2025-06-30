import SwiftUI

struct ContentView: View {
    @State private var myHand = "questionmark"
    @State private var cpuHand = "questionmark"
    @State private var result = ""
    
    // じゃんけんの手を管理
    let hands = ["janken_gu", "janken_choki", "janken_pa"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("じゃんけんゲーム")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            VStack {
                Text("相手の手")
                    .font(.headline)
                // 相手の手を画像で表示
                if cpuHand == "questionmark" {
                    Image(systemName: cpuHand)
                        .font(.system(size: 80))
                        .foregroundColor(.orange)
                } else {
                    Image(cpuHand)
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }
            .padding()
            
            // 結果を表示
            Text(result)
                .font(.title)
                .foregroundColor(resultColor)
                .padding()
            
            VStack {
                Text("自分の手")
                    .font(.headline)
                // 自分の手を画像で表示
                if myHand == "questionmark" {
                    Image(systemName: myHand)
                        .font(.system(size: 80))
                        .foregroundColor(.green)
                } else {
                    Image(myHand)
                        .resizable()
                        .frame(width: 150, height: 150)
                }
            }
            .padding()
            
            HStack(spacing: 30) {
                Button(action: {
                    playGame(myChoice: "janken_gu")
                }) {
                    VStack {
                        Text("ぐー")
                            .font(.system(size: 30))
                    }
                }
                
                Button(action: {
                    playGame(myChoice: "janken_choki")
                }) {
                    VStack {
                        Text("ちょき")
                            .font(.system(size: 30))
                    }
                }
                
                Button(action: {
                    playGame(myChoice: "janken_pa")
                }) {
                    VStack {
                        Text("ぱー")
                            .font(.system(size: 30))
                    }
                }
            }
            .padding()
        }
    }
    
    // ゲームを実行する関数
    func playGame(myChoice: String) {
        // 自分の手を設定
        myHand = myChoice
        
        // CPUの手をランダムに決定
        let cpuChoice = hands.randomElement()!
        cpuHand = cpuChoice
        
        // 勝敗を判定
        result = judgeGame(myChoice: myChoice, cpuChoice: cpuChoice)
    }
    
    // 勝敗を判定する関数
    func judgeGame(myChoice: String, cpuChoice: String) -> String {
        // あいこの判定
        if myChoice == cpuChoice {
            return "あいこ"
        }
        
        // 勝敗の判定
        if (myChoice == "janken_gu" && cpuChoice == "janken_choki") ||
           (myChoice == "janken_choki" && cpuChoice == "janken_pa") ||
           (myChoice == "janken_pa" && cpuChoice == "janken_gu") {
            return "勝ち！"
        } else {
            return "負け..."
        }
    }
    
    // 結果に応じた色を返す
    var resultColor: Color {
        switch result {
        case "勝ち！":
            return .blue
        case "負け...":
            return .red
        case "あいこ":
            return .green
        default:
            return .black
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}