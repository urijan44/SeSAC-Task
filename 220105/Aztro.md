```Swift
resultAztro
  .map{$0.color}
  .bind(to: label.rx.text)
  .disposed(by: disposeBag)
    
resultAztro
  .map{$0.compatibility}
  .bind(to: compatibility.rx.text)
  .disposed(by: disposeBag)
    
resultAztro
  .map{$0.description}
  .bind(to: descriptionLabel.rx.text)
  .disposed(by: disposeBag)
      
//MARK: - Subscribe
json(.post, urlString)
  .subscribe { value in
    guard let data = try? JSONSerialization.data(withJSONObject: value, options: .prettyPrinted) else { fatalError()}
    do {
      let json = try JSONDecoder().decode(Aztro.self, from: data)
      self.resultAztro.onNext(json)
    } catch let error {
      print(error.localizedDescription)
    }
   }
```