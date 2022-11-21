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
        SwiftUI.TabView(selection: viewStore.binding(send: { TabReducer.Action.selectedTab($0.currentTab)
        })) {
            IfLetStore(self.store.scope(state: \.home, action: TabReducer.Action.home),
                       then: HomeView.init(store: ))
            .tabItem {
                TabItem(tab: .home)
            }
            .tag(TabReducer.Tab.home)

            IfLetStore(self.store.scope(state: \.info, action: TabReducer.Action.info),
                       then: InfoView.init(store:))
            .tabItem {
                TabItem(tab: .info)
            }
            .tag(TabReducer.Tab.info)
            
            IfLetStore(self.store.scope(state: \.consumption, action: TabReducer.Action.consumption),
                       then: InfoView.init(store:))
            .tabItem {
                TabItem(tab: .consumption)
            }
            .tag(TabReducer.Tab.consumption)
        
            IfLetStore(self.store.scope(state: \.contact, action: TabReducer.Action.contact),
                       then: InfoView.init(store:))
            .tabItem {
                TabItem(tab: .contact)
            }
            .tag(TabReducer.Tab.contact)
            
            IfLetStore(self.store.scope(state: \.settings, action: TabReducer.Action.settings),
                       then: InfoView.init(store:))
            .tabItem {
                TabItem(tab: .settings)
            }
            .tag(TabReducer.Tab.settings)
        }
        .accentColor(.black)
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
            store: Store(
                initialState: TabReducer.State(),
                reducer: TabReducer()
            )
        )
    }
}


