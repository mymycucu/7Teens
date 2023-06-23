import SwiftUI



struct CircleTest: View {
    let options = ["Option 1", "Option 2", "Option 3"]
    @State private var selectedOption = "Option 1"
    @State private var isPickerExpanded = false

    var body: some View {
        VStack {
            HStack {
                Text("Select an option: ")
                Spacer()
                Text(selectedOption)
                    .onTapGesture {
                        isPickerExpanded.toggle()
                    }
            }

            if isPickerExpanded {
                Picker("Options", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
        }
    }
}


struct CircleTest_Previews: PreviewProvider {
    static var previews: some View {
        CircleTest()
    }
}
