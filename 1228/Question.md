# Foundation Framework
- Foundation Framework는 Swift의 거의 모든 어플리에키션에 필요한 기능 계층이 정리가 된 프레임워크이다. Darwin과 ObjecticeC 브리징의 역할도 있다.
- 그 위에서 말하는 핵심 기능 계층은 진짜 많은데 당장 쓰는 Filemanager, DispatchQ, URLSession등 속해있다.
https://developer.apple.com/documentation/foundation

# Hashable, Equatable
## Equatable
- Equatable 프로토콜은 객체의 같은지 다른지를 비교할 수 있는 내용을 명시하는 프로토콜로 == 타입 메소드를 작성해야 한다., 그래서 서로 같은지 아닌지 비교가 가능한 모든 객체들은 Equatable을 채용하고 있다.
- contains() 메소드는 equatable을 채용해야 사용할 수 있다(당연?)
- 참고로 객체의 모든 속성들이 Equatable을 채용하고 있다면 객체또한 자동으로 채용된다. 

## Hashable
- Hashable을 채용하면 해당 객체는 유일해진다. 즉 해시 값이 생성된다. Equatable 프로토콜 위에 쓰여지며, 마찬가지로 구조체의 경우는 속성들이 모두 Hashable이라면 해당 객체도 Hashable이다.
- 커스텀 모델의 경우 hash 메소드를 통해 combine을 통해서 hashable을 만족할 수 있다.