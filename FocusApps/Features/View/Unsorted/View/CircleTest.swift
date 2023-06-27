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
        VStack{
            Text("This is jakarta")
                .font(.custom("Poppins-Bold", size: 30))
            Text("This is jakarta")
                        .font(.system(size: 30))
//                .font(.custom("PlusJakartaSans-ExtraBold", size: 30))
        }
    }
}

struct SelectButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SelectButtonView()
    }
}

