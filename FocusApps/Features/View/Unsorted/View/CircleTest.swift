//import SwiftUI
//
//
//struct AccordionView: View {
//
//    @State var isAccordionExpanded: Bool = false
//    @State var isAccordionExpanded2: Bool = false
//
//    var body: some View {
//        VStack {
////            Toggle("Expand Accordion", isOn: $isAccordionExpanded.animation()) // THIS FIX the Disclosure Animation
////                .padding(.horizontal)
//
//            DisclosureGroup("The Title Of Accordion", isExpanded: $isAccordionExpanded) {
//                VStack {
//                    Image(systemName: "star")
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. ")
//                        .onTapGesture { isAccordionExpanded.toggle() }
//                }
//            }.padding()
//
//            DisclosureGroup("The Title Of Accordion", isExpanded: $isAccordionExpanded2) {
//                VStack {
//                    Image(systemName: "star")
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. ")
//                        .onTapGesture { isAccordionExpanded2.toggle() }
//                }
//            }.padding()
//
//        }
//    }
//}
//
//struct CircleTest_Previews: PreviewProvider {
//    static var previews: some View {
//        AccordionView()
//    }
//}

import SwiftUI

struct SelectButtonView: View {
    @State private var selectedOption: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose your music")
                .multilineTextAlignment(.leading)
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical, 10)
            
            ToggleButton(title: "Forest Wind", option: "Forest Wind", selectedOption: $selectedOption)
            ToggleButton(title: "Ocean Waves", option: "Ocean Waves", selectedOption: $selectedOption)
            ToggleButton(title: "Rain Sounds", option: "Rain Sounds", selectedOption: $selectedOption)
            
            // Start Button
            Button(action: {
                // Perform action when Start button is pressed
            }) {
                Text("Choose")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 52)
                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .cornerRadius(40)
            }
            .padding(.vertical, 20)
        }
    }
}

//struct ToggleButton: View {
//    let title: String
//    let option: String
//    @Binding var selectedOption: String?
//    
//    var body: some View {
//        Button(action: {
//            selectedOption = option
//        }) {
//            HStack {
//                Text(title)
//                    .foregroundColor( option == selectedOption ? .white : .black)
//                Spacer()
//                Image(systemName: "speaker.wave.2")
//                    .foregroundColor( option == selectedOption ? .white : .black)
//            }
//            .frame(width: 320, height: 20)
//            .padding()
//            .background(option == selectedOption ? Color(red: 0.07, green: 0.34, blue: 0.35) : Color(.systemGray5))
//            .cornerRadius(8)
//        }
//        .padding(.vertical, 7)
//    }
//}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}

