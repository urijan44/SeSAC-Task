# Enum 
## Associated Values
Enum의 Associated Values는 열거형의 표현을 좀더 확장해주는 개념으로, 열거형을 초기화 할때 값을 같이 전달할 수 있다. 연관값으로 에러를 표현하는 열거형 케이스에 에러메시지를 전달할 수도 있다.

## CaseIterable
열거형을 차례로 순회할 수 있는 `allCases`를 호출할 수 있는 프로토콜로, Associated Values, @available 속성이 없으면 자동으로 프로토콜 채용만 해도 allCases를 사용할 수 있다, 있더라고 static var allCases: [Error.Type]의 get을 별도로 정의해 주면 사용할 수 있다.
