# Checklist

## Type Inference(타입 추론)
타입 추론으로 번역할 수 있다. Swift는 굉장히 심플하고 안전한 언어이다.

```Swift
let number1: Int = 123
let number2 = 123
```
Swift에서 위 두 코드는 완전히 동일하게 작동 하는데
number1과 같이 타입을 명시하는것이 타입 어노테이션이며 Swift에서는 이를 생략하여 초기값을 자동으로 타입으로 정한다. 이를 타입 추론이라고 한다.

한가지 쟁점은 이 부분은 컴파일러가 수행 하는것이기 때문에 컴파일 속도를 더 빠르게 하기 위해 타입 어노테이션을 모두 명시하는 것이 좋다 라고는 하지만

프로젝트를 하다보면 수백, 수천개 이상의 변수를 생성하고 만들게 된다. 그때마다 작성하는 타입 어노테이션의 시간의 합과, 컴파일러에서 늘어나는 시간의 합, 타입 추론을 포기할 만큼 빠른 성능을 보이는가? 어플리케이션이 충분히 가볍다면 굳이 몇 밀리세컨드 안되는 이점을 얻고자 타입 추론에서 오는 장점을 버릴 수는 없을 것이다.

타입추론 주의

```Swift
let number
```
이러한 경우는 타입 추론이 되지 않는다. 타입 추론은 초기값이 반드시 주어져야 가능하다.

## Type Conversion(타입 변환)
타입 변환 또는 형 변환으로 불린다. Swift는 Type-Safe한 언어로 한번 정해진 타입을 막 휙휙 바꿀 수 없다.

```Swift
var number = 123
number = "123"
```
컴파일 에러가 발생할 것이다. "123"은 Int가 아니다! 라는 식으로 아마 발생하지 싶다.

그렇다고 숫자 리터럴을 문자열 로 못바꾸는 것은 아니다. 바로 타입 변환을 이용하는 것이다.

정수를 문자열로 변환하는 방법은 일반적이고 기초적인 방법으로 문자열 타입의 생성자를 이용하는 것으로

```Swift
let number = 123
let strNumber: String = .init(number)
```

또 다른 방법은 `CustomStringConvertible` 프로토콜을 이용하는 방법으로 iOS 8.0+, Swift Standard Library에 포함되어 있으므로 가볍고 호환성이 좋으며 속도도 빠르다고 한다.

```Swift
let number = 123
let strNumber = 123.description
```
위에서 작성한 코드와 완벽하게 동일하게 동작하며 컴파일 속도도 더 빠르다고 한다.
>https://www.hackingwithswift.com/articles/11/how-to-make-swift-compile-faster

다른 방법은 `String Interpolation`인데 이는 Swift 5.0에서 추가된 것으로

```Swift
let number = 123
let strNumber = "\(number)"
```
이렇게 쓰는 방법이다. 

대부분의 상황에서 숫자를 문자열로 바꾸는 방법은 크게 위험하지 않다. 다만 문자열에서 숫자로 바꾸는 것은 조금 얘기가 달라지는데

가장 처음에 방식을 반대로 해보자

```Swift
let str = "123"
let number: Int = .init(str)
```
잘 될까? 아니다 컴파일 에러가 발생한다. 왜냐하면 
이 방법은 Int라는 구조체에 정의된 생성자를 이용하는 방식인데 문자열을 이용해 생성하는 생성자는 Int를 반환하는게 아니라 Int? 를 반환한다. 따라서 Int? 는 래핑없이 Int가 될 수 없으므로 컴파일 에러가 발생한다.

왜 문자열에서 정수로 바꾸는데 옵셔널을 반환할까, 이유는 심플하다.

```Swift
let str = "abc"
let number: Int = .init(str)
```
문자열 abc를 정수로 어떻게 바꾸나?
물론 C/C++에서는 각각을 아스키코드로 바꾸면 정수로 변경되는 것처럼 보이지만 Swift에서 문자열은 아스키가 아닌 유니코드이다. 그래서 정수로 변환에 실패할 수 있기 때문에 Int?을 반환하는 것이다. 더 자세한 내용은 [요기](https://developer.apple.com/documentation/swift/int/2927504-init)

아무튼 좀더 숫자를 문자열로 바꾸는 것에 비해 좀더 안전한 방법이 필요하다는 것이다. 옵셔널을 논옵셔널로 바꾸는 언래핑 작업이 추가가 될 것이다.

구조체의 생성자를 이용하지 않는 방식도 있을까?

있다. 다만 추천하는 방법은 아니다. 우선 어떻게 하는지 보자

```Swift
import Foundation

let str: NSString = "123"
let number = str.integerValue
```
바로 NString을 사용하는 것으로
NSString은 리드 프로퍼티로 integerValue로 변환하는 것이 있다.

다만 이 방법은 괜찮은 걸까? 123이 아니라 "abc"를 입력하면 어떻게 될까?

```Swift
import Foundation

let str: NSString = "abc"
let number = str.integerValue //0

```
놀랍게도 어떤 런타임 에러도 컴파일 에러도 없이 0을 반환한다. NSString의 integerValue는 옵셔널 작업 없이 곧바로 정수로 가져오고 이를 실패하면 0으로 반환한다. 

근데 이 방법 안전한 것일까? 

만약 문자열 처리를 하는 과정에서 잘못된 입력이 들어와서 결과가 0이 되었다.

0은 숫자가 들어온 것인데 기존에 숫자가 0일때 작업하던 분기는 어떻게 되는걸까? 이 분기에 입력이 문자열이라 작업이 실패한 경우를 추가해야 하는걸까?

애초에 그런걸 생각하는 것 자체가 Swift 스럽지 않다. 이러한 경우 옵셔널로 받고 만약 저 과정이 nil을 반환한 것이라면 올바른 입력이 아니므로 과정 자체를 중단 시키거나 준비해놓은 예외처리를 실시하는게 맞다.

따라서 가능한 안전한 방법을 이용할 것

## Type Alies
이것은 타입의 별칭과 같은 개념이다.

내가 접해본 가장 대표적인 예는 바로 String인데

```Swift
"안녕하세요!".forEach { char in
  print("\(char)-\(char)")
}
```
뭐 대충 위와 같은 코드가 있다고 했을 때 
forEach 클로저안에서 char는 타입을 확인해보면 `String.Element`이다. 근데 이 부분 문서를 보면 알겠지만 다음과 같이 선언 되어 있다.

```Swift
typealias Element = Character
```
즉 String.Element 라고 하는 타입은 사실은 `Character` 였던 것이다.

또 봤던 것이

```Swift
func CLLocationCoordinate2DMake(_ latitude: CLLocationDegrees, 
                              _ longitude: CLLocationDegrees) -> CLLocationCoordinate2D
```
CoreLocation의 `CLLocationDegress` 이라는 개체가 있는데 이것도 사실은

```Swift
typealias CLLocationDegrees = Double
```
Double의 별명이다.
이러한 별칭을 이용해 좀더 직관적으로 코드를 작성하거나 너무 길게된 이름을 단축해서 가독성을 늘릴 수도 있다.

작성자 관점에서의 그러한 장점이 있지만 코드를 리딩하는 사람 잆장에서는
타입 별칭을 모르면 CLLocationDegrees를 보면서 못보던 타입이네 어떻게 생성하는 거지? 할거다 그냥 Double값만 주면 되는데..
