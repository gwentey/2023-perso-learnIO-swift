import SwiftUI

struct CreeUIView: View {
    
    @State private var titleInput = ""
    @State private var subtitleInput = ""
    @Binding var listes: [List]

    var body: some View {
        NavigationView {
            VStack {
                
                TextEditor(text: $titleInput)
                    .frame(height: 200)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding()
                
                TextEditor(text: $titleInput)
                    .frame(height: 200)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                    .padding()
                
                
                Button(action: {
                    // action à effectuer lors du clic sur le bouton
                }) {
                    Text("Ajouter la carte")
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.blue)
                                )
                        )
                }
                Spacer()

            }
        }
    }
}





struct CreeUIView_Previews: PreviewProvider {
    static var previews: some View {
        let listes = Binding<[List]>(get: { [] }, set: { _ in })
        return CreeUIView(listes: listes)
    }
}
