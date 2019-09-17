//
//  GameModel.swift
//  jeapordus
//
//  Created by God on 9/13/19.
//  Copyright © 2019 Jeapordus Team. All rights reserved.
//

import Foundation

struct TriviaWrapper: Codable {
  let trivia: [Trivia]
  
  private enum CodingKeys: String, CodingKey {
    case trivia = "results"
  }
  
    static func fetchTriviaData(mode: String, id: Int,completionHandler: @escaping (Result<Trivia,AppError>) -> ()) {
    let url = "https://opentdb.com/api.php?amount=1&category=\(id)&difficulty=\(mode)&type=multiple"

    NetWorkManager.shared.fetchData(urlString: url) { (result) in
      switch result {
      case .failure(let error):
        completionHandler(.failure(error))
      case .success(let data):
        do {
          let trivia = try JSONDecoder().decode(TriviaWrapper.self, from: data)
                    dump(data)
          completionHandler(.success(trivia.trivia[0]))
        } catch {
          completionHandler(.failure(.networkError))
          print(error)
        }
      }
    }
  }
}

struct Trivia: Codable {
  let category: String
  //"multiple" ?? "boolean"
  let type: String
  let difficulty: String
  let question: String
  let correctAnswer: String
  let incorrectAnswer: [String]
    func answersShuffle()-> [String]{
        var shuffle = incorrectAnswer.map{$0.stringByDecodingHTMLEntities}
    shuffle.append(correctAnswer.stringByDecodingHTMLEntities)
    return shuffle.shuffled()
    }
  
  private enum CodingKeys: String, CodingKey {
    case category
    case type
    case difficulty
    case question
    case correctAnswer = "correct_answer"
    case incorrectAnswer = "incorrect_answers"
  }
}
