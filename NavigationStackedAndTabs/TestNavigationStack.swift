//
//  TestNavigationStack.swift
//  NavigationStackedAndTabs
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct TestNavigationStack: View {
    let appleProducts = ["Mac", "Macbook", "iPhone", "iPad"]
    
    // NavigationPath를 사용하면타입에 상관없이 넣을 수 있다
    @State private var stackPath: NavigationPath = .init()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List(appleProducts, id: \.self) { product in
//                NavigationLink(value: product) {
//                    Text(product)
//                }
                Button {
                    stackPath.append(product)
                } label: {
                    Text(product)
                        .font(.largeTitle)
                        .bold()
                }
                
                Button {
                    stackPath.append(1)
                } label: {
                    Text("넘버로 네비게이션")
                }
                
            }
            .navigationTitle("네비게이션 스택")
            .navigationDestination(for: String.self) { product in
//                Text("\(product) has Clicekd!")
                AppleProductView(product: product, path: $stackPath)
            }
            .navigationDestination(for: Int.self) { number in
                Text("넘버가 선택되었습니다")
            }
            
            
            
        }
      
    }
}

struct AppleProductView: View{
    let product: String
    @Binding var path: NavigationPath
    
    var body: some View {
        VStack(spacing: 20) {
            Text(product)
                .font(.largeTitle)
                .onTapGesture {
                    path.append("세번째 혹은 더 깊이")
                }
            
            Text("모두 없애버리기")
                .onTapGesture {
                    path = .init()
                }
        }
    }
}

#Preview {
    TestNavigationStack()
}
