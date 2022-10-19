//
//  ErrorView.swift
//  TestNewsApp
//
//  Created by HoSeon Chu on 2022/08/11.
//

import SwiftUI

struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error,
                  handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Ooopss")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
            Button(action: {
                //액션 동작 정의 필요
                handler()
            }, label: {
                Text("Retry")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
