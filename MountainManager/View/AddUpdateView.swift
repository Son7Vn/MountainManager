//
//  UpdateMountainerView.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import SwiftUI

struct AddUpdateView: View {
    @EnvironmentObject var mtn : MountainerViewModel
//    @State var mountainer : Mountain
    @ObservedObject var mountainer: AddUpdateViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    
                    HStack {
                        Text("Name:")
                        TextField("Demo", text: $mountainer.name)
                            .disableAutocorrection(true)
                        Spacer()
                    }
                    .padding()
                    Divider()
                    
                    HStack {
                        Text("Age:")
                        TextField("Demo", text: $mountainer.age)
                            .disableAutocorrection(true)
                        Spacer()
                    }
                    .padding()
                    Divider()
                    
                    Button {
                        mountainer.update ? add() : change()
                        
                    } label: {
                        Text(mountainer.update ? "Add" : "Update")
//                            .foregroundColor(.white)
//                            .background(.blue)
//                            .frame(width: 80, height: 50)
                    }.disabled(mountainer.disable)
                }
            }
            .navigationTitle("Mountainer")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: cancelButton)
        }
    }
}

extension AddUpdateView {
    
    private func change() {
        let mountainer = Mountainer(id: mountainer.id!,name: mountainer.name, age: mountainer.age)
        mtn.update(mountainer)
        print("Update listMountaint")
        presentation.wrappedValue.dismiss()
    }
    
    private func add() {
        let mountainer = Mountainer(name: mountainer.name, age: mountainer.age)
        mtn.add(mountainer)
        presentation.wrappedValue.dismiss()
    }
    
    var cancelButton : some View {
        Button {
            presentation.wrappedValue.dismiss()
        } label: {
            Text("Cancel")
        }
    }
}

struct UpdateMountainerView_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdateView(mountainer: AddUpdateViewModel())
            .environmentObject(MountainerViewModel())
        
    }
    
}
