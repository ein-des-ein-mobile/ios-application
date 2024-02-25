//
//  InfoView.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import SwiftUI
import ComposableArchitecture

struct InfoView: View {
  let store: StoreOf<InfoReducer>
  
  var body: some View {
    Text("Hello, Info World!")
  }
}

#Preview {
  InfoView(
    store: Store(initialState: InfoReducer.State()) {
      InfoReducer()
    }
  )
}
