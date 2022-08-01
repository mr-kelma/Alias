import Foundation

protocol JokeManagerDelegate: AnyObject {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: Joke)
    func didFailWithError(error: Error)
}

struct JokeManager {
    
    let jokeURL = "http://rzhunemogu.ru/RandJSON.aspx?CType=1"
    weak var delegate: JokeManagerDelegate?
    
    func performRequest(with jokeURL: String) {
        if let url = URL(string: jokeURL) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    return
                }
                
                if let safeData = data {
                    if let joke = self.parseJSON(safeData) {
                        self.delegate?.didUpdateJoke(self, joke: joke)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> Joke? {
        let decoder = JSONDecoder()
        do {
            let decodeData = try decoder.decode(Joke.self, from: data)
            return decodeData
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
