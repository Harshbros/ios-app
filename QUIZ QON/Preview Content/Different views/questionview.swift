import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var questionmanager: File

    var body: some View {
        VStack(spacing: 50) {
            // Title
            HStack {
                Text("QUIZ GAME")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Spacer()
            }

            // Progress Bar
            progress_bar(progress: questionmanager.progress)

            // Question and Answers
            VStack(alignment: .leading, spacing: 20) {
                Text(questionmanager.question)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.purple)

                ForEach(questionmanager.answerChoices, id: \.id) { answer in
                    Actualanswers(answer: answer).environmentObject(questionmanager)
                }
            }

            // Next Button
            Button {
                questionmanager.goToNextQuestion()
            } label: {
                login(
                    text: "Next",
                    background: questionmanager.answerSelected
                        ? Color("AccentColor")
                        : Color(hue: 0.5, saturation: 0.8, brightness: 0.9, opacity: 0.5)
                )
            }
            .disabled(!questionmanager.answerSelected)

            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("AccentColor"))
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

#Preview {
    QuestionView()
        .environmentObject(File())
}

