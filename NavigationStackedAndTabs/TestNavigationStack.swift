//
//  TestNavigationStack.swift
//  NavigationStackedAndTabs
//
//  Created by 신승훈 on 2024/03/25.
//

import SwiftUI

struct TestNavigationStack: View {
    var body: some View {
        NavigationStack {
            List(0...6, id: \.self) { index in
                NavigationLink(value: index) {
                    Text("\(index) 버튼")
                        .font(.largeTitle)
                        .bold()
                }
                
            }
            .navigationTitle("네비게이션 연습")
            .navigationDestination(for: Int.self) {
                _ in FirstDestinationView(viewModel: FirstDestinationViewModel())
            }
        }
    }
}

@MainActor
class FirstDestinationViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    
    init() {
        downloadImage()
    }
    
    func downloadImage() {
        Task {
            let url = URL(string: "https://picsum.photos/200")!
            let (data, response) = try await URLSession.shared.data(from: url)
            if let image = UIImage(data: data) {
                self.image = image
                print("이미지가 다운로드 되었습니다.")
            }
        }
    }
}

struct FirstDestinationView: View{
    @StateObject private var viewModel: FirstDestinationViewModel
    
    init(viewModel: FirstDestinationViewModel) {
        print("목적기가 되는 뷰가 생성되었습니다.")
        
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
        }
        
        Text("목적지가 되는 뷰")
    }
}

#Preview {
    TestNavigationStack()
}
