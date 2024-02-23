//
//  TabView.swift
//  Application
//
//  Created by Anton Bal` on 10.11.2022.
//

import SwiftUI
import ComposableArchitecture
import Combine

struct TabView: View {
    let store: StoreOf<TabReducer>
    
    @ObservedObject var viewStore: ViewStore<ViewState, TabReducer.Action>
    
    var cancellables: Set<AnyCancellable> = []
    
    struct ViewState: Equatable, Hashable {
        let currentTab: TabReducer.Tab
        
        init(state: TabReducer.State) {
            self.currentTab = state.currentTab
        }
    }
   
    init(store: StoreOf<TabReducer>) {
        self.store = store
        self.viewStore = ViewStore(self.store, observe: ViewState.init)
    }
    
    var body: some View {
        WithViewStore(store, observe: \.currentTab) { viewStore in
            SwiftUI.TabView(selection:
                    viewStore.binding(send: TabReducer.Action.selectedTab)
            ){
                Group {
                    NavigationView {
                        HomeView(store: store.scope(state: \.home,
                                                    action: \.home))
                    }                    .tag(TabReducer.Tab.home)
                    .tabItem {
                        TabItem(tab: .home)
                    }
                    
                    NavigationView {
                        InfoView(store: store.scope(state: \.info,
                                                    action: \.info))
                    }
                    .tag(TabReducer.Tab.info)
                    .tabItem {
                        TabItem(tab: .info)
                    }
  
                    NavigationView {
                        InfoView(store: store.scope(state: \.consumption,
                                                      action: \.consumption))
                    }
                    .tag(TabReducer.Tab.consumption)
                    .tabItem {
                        TabItem(tab: .consumption)
                    }
                    
                    NavigationView {
                        InfoView(store: store.scope(state: \.contact,
                                                       action: \.contact))
                    }
                    .tag(TabReducer.Tab.contact)
                    .tabItem {
                        TabItem(tab: .contact)
                    }
                    
                    NavigationView {
                        InfoView(store: store.scope(state: \.settings,
                                                       action: \.settings))
                    }
                    .tag(TabReducer.Tab.settings)
                    .tabItem {
                        TabItem(tab: .settings)
                    }
                }
            }
        }
    }
}


struct TabItem: View {
    let tab: TabReducer.Tab
    
    var image: Image {
        Image(systemName: "info.circle.fill")
    }
    
    var title: String {
        "\(tab)"
    }
    
    var body: some View {
        VStack {
            image
                .renderingMode(.template)
                
            Text(title)
                .font(.DX.bodyTextRegular)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(
            store: Store(initialState: TabReducer.State()) {
                TabReducer()
            }
        )
    }
}


