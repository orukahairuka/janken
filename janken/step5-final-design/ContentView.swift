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
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.top)
            
            VStack(spacing: 10) {
                Text("相手の手")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.orange.opacity(0.2))
                        .frame(width: 180, height: 180)
                    
                    if cpuHand == "questionmark" {
                        Image(systemName: cpuHand)
                            .font(.system(size: 80))
                            .foregroundColor(.orange)
                    } else {
                        Image(cpuHand)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                }
            }
            .padding()
            
            // 結果を表示
            if !result.isEmpty {
                Text(result)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(resultBackgroundColor)
                    .cornerRadius(25)
                    .shadow(radius: 5)
            }
            
            VStack(spacing: 10) {
                Text("自分の手")
                    .font(.headline)
                    .foregroundColor(.gray)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(Color.green.opacity(0.2))
                        .frame(width: 180, height: 180)
                    
                    if myHand == "questionmark" {
                        Image(systemName: myHand)
                            .font(.system(size: 80))
                            .foregroundColor(.green)
                    } else {
                        Image(myHand)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                    }
                }
            }
            .padding()
            
            HStack(spacing: 20) {
                Button(action: {
                    playGame(myChoice: "janken_gu")
                }) {
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 80, height: 80)
                            
                            Image("janken_gu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        Text("ぐー")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
                .buttonStyle(.borderedProminent)
                .scaleEffect(myHand == "janken_gu" ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: myHand)
                
                Button(action: {
                    playGame(myChoice: "janken_choki")
                }) {
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 80, height: 80)
                            
                            Image("janken_choki")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        Text("ちょき")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
                .buttonStyle(.borderedProminent)
                .scaleEffect(myHand == "janken_choki" ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: myHand)
                
                Button(action: {
                    playGame(myChoice: "janken_pa")
                }) {
                    VStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.2))
                                .frame(width: 80, height: 80)
                            
                            Image("janken_pa")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                        Text("ぱー")
                            .font(.title2)
                            .fontWeight(.medium)
                    }
                }
                .buttonStyle(.borderedProminent)
                .scaleEffect(myHand == "janken_pa" ? 1.1 : 1.0)
                .animation(.easeInOut(duration: 0.1), value: myHand)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .padding()
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}