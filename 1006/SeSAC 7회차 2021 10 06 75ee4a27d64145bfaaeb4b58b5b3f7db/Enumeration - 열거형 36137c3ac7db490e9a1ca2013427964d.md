# Enumeration - 열거형

## 열거형이란?

코드를 작성할 때 플레잉 카드 무늬의 4종류를 변수로 지정하기 위해 코드로 작성한다고 가정하자. 이를

- 클로버 = 1
- 다이아몬드 = 2
- 하트 = 3
- 스페이드 = 4

하지만 클로버가 1이고, 스페이드가 4이고 직관적이지도 않고 헷갈릴 수 있다.

그러면 이렇게 작성해보면 어떨까?

- 클로버 = "clover"
- 다이아몬드 = "diamond"
- 하트 = "heart"
- 스페이드 = "spade"

처음보다는 훨씬 알아보기 쉬워졌지만 문자열로 이를 저장하다보면 문제가 발생할 수 있다

스페이드 에 pike가 대신 들어갈 수도 있다. 혹은 spde 이런 식으로 오타를 낼 수도 있다.

어떻게 하면 이러한 값들을 더 안전하고 정확하게 사용할 수 있을까에 대한 대안이 바로 열거형이다.

우선 위에서 설명한 상황을 코드로 체험해 보자

```swift
let myCard = ["Clover", "Heart", "Herat", "Diamond"]

func getCardScore(for card: String) -> Int {
  switch card {
  case "Clover":
    return 1
  case "Diamond":
    return 2
  case "Heart":
    return 3
  case "Spade":
    return 4
  default:
    return 0
  }
}

var myScore = 0
for card in myCard {
  myScore += getCardScore(for: card)
}

myScore
```

수중에 있는 카드 패턴에 따라 점수를 부여하고자 한다.

앞서 얘기했 듯 문자열로 작성되었기 때문에 내 수중에 있는 카드를 입력할 때 오타를 낼 수도 있고, 관련된 메소드를 작성할 때 이외의 값이 들어오는 예외처리도 해야할 뿐더러 이 과정에서 또 오타도 날 수 있다.

이제 열거형으로 이를 해결해보자

```swift
enum PlayingCard {
	case Clover, Diamond, Heart, Spade
}
```

이를 이용하여 다시 코드를 작성해보면

```swift
enum PlayingCard {
  case Clover, Diamond, Heart, Spade
}

let myCard: [PlayingCard] = [.Clover, .Clover, .Heart, .Diamond]

func getCardScore(for card: PlayingCard) -> Int {
  switch card {
  case .Clover:
    return 1
  case .Diamond:
    return 2
  case .Heart:
    return 3
  case .Spade:
    return 4
  }
}

var myScore = 0
for card in myCard {
  myScore += getCardScore(for: card)
}

myScore
```

 

전체 코드길이는 열거형을 작성하면서 더 길어지기는 했지만 중요한 것은 열거형을 사용함으로써 자동완성이 된다는 것이다. 실제로 코드 길이는 길어도 자동완성을 통해 훨씬 더 빠르고 정확하게 작성할 수 있었다. 그리고 getCardScore의 경우 PlayingCard 열거형 내부에 있는 케이스만 처리하기 때문에 default라는 예외처리도 없어졌다. 이로인해 사이드 이펙트 또한 방지할 수 있다.

## 열거형 - 원시 값 (Raw values)

getCardScore에서 카드별로 점수를 매겨놓고 총 몇점인지 계산했다. 그런데 다이아몬드가 2점이었는지 하트가 2점이었는지, 케이스가 더 많아지면 헷갈릴 수 있지 않을까? 

열거형은 원시값을 통해 이를 더 간편하게 해결할 수 있다.

```swift
enum PlayingCard: Int {
  case Clover = 1, Diamond, Heart, Spade
}

let myCard: [PlayingCard] = [.Clover, .Clover, .Heart, .Diamond]

func getCardScore(for card: PlayingCard) -> Int {
  return card.rawValue
}

var myScore = 0
for card in myCard {
  myScore += getCardScore(for: card)
}

myScore
```

달라진 점은 PlayingCard 열거형을 선언할 때 프로퍼티의 타입 어노테이션 처럼 자료형을 선언해 주었다는 것이다.

그리고 Clover가 1점이라는 것을 알려주었다. 이를 Swift는 자동으로 Clover를 시작으로 다음 Case는 +1점이고 처리 해준다.

```swift
enum PlayingCard: Int {
  case Clover = 1
	case Diamond = 2
  case Heart = 3
	case Spade = 4
}
```

이렇게만 작성해도 완전히 똑같은 기능을 구현 한다는 것이다.

그리고 getCardScore에서 Switch 분기문이 사라진 것을 볼 수 있다! 메소드에서 카드별로 점수를 매겨주지 않아도 PlayingCard라는 열거형에 이미 원시값이 저장되어 있기 때문에 이런 것이 가능하다.

이처럼 원시값은 rawValue라는 프로퍼티로 접근이 가능하다.