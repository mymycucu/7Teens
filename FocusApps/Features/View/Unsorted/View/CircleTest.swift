import SwiftUI



struct CircleTest: View {
    @State private var selection = "Red"
    let colors = ["Red", "Green", "Blue", "Black", "Tartan"]

    var body: some View {
        VStack {
            Picker("Select a paint color", selection: $selection) {
                ForEach(colors, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)

            Text("Selected color: \(selection)")
        }
    }
}


struct CircleTest_Previews: PreviewProvider {
    static var previews: some View {
        CircleTest()
    }
}
