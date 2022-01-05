# Operator
## repeatElement
지정된 값을 반복적으로 방출한다.
## take
Observable이 방출한 값중 take에서 정한 n개의 값까지만 받고 completed한다.
## interval
시간 단위로 값을 방출하는 Observable을 생성한다
```Swift
let observable = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
      
let subscription = observable.subscribe { value in
  print("next:\(value)")
} onError: { error in
  print(error)
} onCompleted: {
  print("onCompleted")
} onDisposed: {
  print("onDisposed")
}.disposed(by: disposeBag)
```
