import SwiftUI

struct CreeUneListeView: View {
    @State private var nom = ""
    @State private var liste = Liste(nom: "", cartes: [])
    @Binding var listes: [Liste]

    
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
                listes.append(Liste(nom: nom, cartes: []))
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





struct CreeUneListeView_Previews: PreviewProvider {
    public static var previews: some View {
         let listes = Binding<[Liste]>(get: { [] }, set: { _ in })
         return CreeUneListeView(listes: listes)
     }
}
