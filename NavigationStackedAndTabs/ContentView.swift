//
//  ContentView.swift
//  NavigationStackedAndTabs
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct ContentView: View {
    @State var currentTab: Tab = .home
    
    init() {
        // 탭바를 감췄을때는 터치가 안되도록
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack (alignment: .bottom) {
            TabView(selection: $currentTab){
                Text("홈")
                    .tag(Tab.home)
                Text("게시판")
                    .tag(Tab.forum)
                Text("스터디")
                    .tag(Tab.study)
                Text("프로필")
                    .tag(Tab.profile)
            }
//            기본 탭뷰 사용할때는 이렇게 사용
//            .toolbar(.hidden, for: .tabBar)
            
            CustomTabView(currentTab: $currentTab)
        }
        
    }
}

#Preview {
    ContentView()
}
