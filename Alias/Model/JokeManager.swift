import Foundation

protocol JokeManagerDelegate {
    func didUpdateJoke(_ jokeManager: JokeManager, joke: JokeModel)
    func didFailWithError(error: Error)
}

struct JokeManager {
    
    let baseURL = "https://joke.deno.dev/"
    //let apiKey = "YOUR_API_KEY_HERE"

    
    var delegate: JokeManagerDelegate?
    
    func fetcJoke(with urlString: String) {
        let urlString = baseURL
        performRequest(with: urlString)
    }
    func performRequest (with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    print(error!)
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
    
    func parseJSON(_ data: Data) -> JokeModel? {
        
        //Create a JSONDecoder
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(JokeData.self, from: data)
            let setup = decodedData.joke[0]
            let punchline = decodedData.joke[1]
            return nil
            
            
        } catch {
            
       
            print(error)
            return nil
    
        }

    }
}
