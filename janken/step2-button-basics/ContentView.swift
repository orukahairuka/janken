import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack {
            Text("じゃんけんアプリ")
                .font(.largeTitle)
                .foregroundColor(.blue)
            
            Text("タップ回数: \(tapCount)")
                .font(.title2)
                .padding()
            
            Button("タップしてね") {
                tapCount += 1
            }
            .font(.title)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}