//
//  TestNavigationStack.swift
//  NavigationStackedAndTabs
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct TestNavigationStack: View {
    var body: some View {
        NavigationView {
            List(0...6, id: \.self) { index in
                NavigationLink {
                    Text("\(index)가 선택되었습니다")
                } label: {
                    Text("\(index)")
                }
                
            }
        }
        .navigationTitle("네비게이션 연습")
    }
}

#Preview {
    TestNavigationStack()
}
