//
//  ContentView.swift
//  MountainManager
//
//  Created by SonGoku on 02/04/2022.
//

import SwiftUI

struct ListMountainView: View {
    @EnvironmentObject var mtn : MountainerViewModel
    @State var modelType : ModelType? = nil
    var body: some View {
        NavigationView {
            List() {
                //                    Text(mtn.errMessenger)
                //                        .foregroundColor(.red)
                ForEach(mtn.listMountain) { result in

                                            Button {
                                                modelType = .update(result)
                                            } label: {
                                                VStack {
                                                    HStack {
                                                        Text(result.name)
                                                        Text(result.age)
                                                        Spacer()
                                                    }.foregroundColor(Color(.label))
                                                }.padding()
                                            }
                                    }
                                    .onMove(perform: { indexSet, index in
                                        mtn.listMountain.move(fromOffsets: indexSet, toOffset: index)
                                    })
                                    .onDelete(perform: mtn.delete)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("List Mountainer")
                        .font(.title)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        modelType = .add
                    } label: {
                        Image(systemName: "plus.circle.fill")
                    }
                }
            }
        }
        .sheet(item: $modelType) {
            $0
        }
//        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct Mountainer_Previews: PreviewProvider {
    static var previews: some View {
        ListMountainView()
            .environmentObject(MountainerViewModel())
    }
}
