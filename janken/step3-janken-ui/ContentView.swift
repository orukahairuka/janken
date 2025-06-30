import SwiftUI

struct ContentView: View {
    @State private var myHand = "questionmark"
    @State private var cpuHand = "questionmark"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("じゃんけんゲーム")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            VStack {
                Text("相手の手")
                    .font(.headline)
                Image(systemName: cpuHand)
                    .font(.system(size: 80))
                    .foregroundColor(.orange)
            }
            .padding()
            
            VStack {
                Text("自分の手")
                    .font(.headline)
                Image(myHand)
                    .resizable()
                    .frame(width: 150, height: 150)
            }
            .padding()
            
            HStack(spacing: 30) {
                Button(action: {
                    myHand = "janken_gu"
                }) {
                    VStack {
                        Text("ぐー")
                            .font(.system(size: 30))
                    }
                }
                
                Button(action: {
                    myHand = "janken_choki"
                }) {
                    VStack {
                        Text("ちょき")
                            .font(.system(size: 30))
                    }
                }
                
                Button(action: {
                    myHand = "janken_pa"
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
