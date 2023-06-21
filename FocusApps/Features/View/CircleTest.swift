import SwiftUI

struct CircleTest: View {
    @State private var selectedHour = 0
    @State private var selectedMinute = 0
    @State private var selectedSecond = 0
    
    let hours = 0..<24
    let minutes = 0..<60
    let seconds = 0..<60
    
    var body: some View {
        VStack {
            Text("Selected Time: \(selectedHour)h \(selectedMinute)m \(selectedSecond)s")
                .padding()
            
            ZStack {
                Circle()
                    .stroke(Color.red, lineWidth: 2)
                    .frame(width: 300, height: 300)
                
                HStack{
                    Picker("Hours", selection: $selectedHour) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 80)
                    
                    Picker("Minutes", selection: $selectedMinute) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 80)
                    
                    Picker("Seconds", selection: $selectedSecond) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 80)
                }
            }
        }
    }
}

struct CircleTest_Previews: PreviewProvider {
    static var previews: some View {
        CircleTest()
    }
}
