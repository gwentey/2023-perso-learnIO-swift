import SwiftUI

struct CreeUIView: View {
    @State private var nom = ""
    @State private var liste = List(nom: "", cartes: [])
    @Binding var listes: [List]

    
    var body: some View {
        VStack {
            Spacer()
            TextField("Nom de la liste", text: $nom)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 2)
                )
                .padding()

            Spacer()

            Button(action: {
                listes.append(List(nom: nom, cartes: []))
                nom = ""
            }) {
                Text("Créer la liste")
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
        .navigationBarTitle("Crée")
    }
}





struct CreeUIView_Previews: PreviewProvider {
    public static var previews: some View {
         let listes = Binding<[List]>(get: { [] }, set: { _ in })
         return CreeUIView(listes: listes)
     }
}
