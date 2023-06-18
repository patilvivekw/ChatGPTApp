//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Patil, Vivek on 18/06/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {

    @State private var chatText: String = ""

    let openAI = OpenAISwift(authToken: "<ENTER YOUR TOKEN>")

    @EnvironmentObject private var model: Model

    private var isFormValid: Bool {
        !chatText.isEmptyOrWhiteSpace
    }

    private func performSearch() {
        openAI.sendCompletion(with: chatText, maxTokens: 500) { result in // Result<OpenAI, OpenAIError>
            switch result {
            case .success(let success):
                let answer = success.choices?.first?.text ?? ""
                print(answer)
                let query = Query(question: chatText, answer: answer)

                DispatchQueue.main.async {
                    model.queries.append(query)
                }

                do {
                    try model.saveQuery(query)
                } catch {
                    print("Error!!! : \(error.localizedDescription)")
                }
                
                chatText = ""
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    var body: some View {
        VStack {
            
            List(model.queries) { query in
                VStack {
                    Text(query.question)
                        .fontWeight(.bold)
                    Text(query.answer)
                }
            }
            
            Spacer()
            HStack {
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    // action
                    performSearch()
                }, label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }).buttonStyle(.borderless)
                    .tint(.blue)
                    .disabled(!isFormValid)
                
            }
            
        }.padding()
    }
}
 
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}
