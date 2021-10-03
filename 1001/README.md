# 1001 SSAC

## Index
- Lecture
- [Checklist](Checklist.md)
- [Assignment](Assignment.md)
- Mission

## Lecture
1. if, if-else, if else<br>
[Swift if statsments](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
2. switch<br>
[Swift switch](https://docs.swift.org/swift-book/LanguageGuide/ControlFlow.html)
3. Function
- Parameter vs Argument
- Parameter name vs Argument Label
- Wildcard pattern
- default parameter value
- Overriding, Overloading

4. DarkMode
다크모드는 iOS 13.0에서 도입된 개념으로 현재는 선택적으로 다크모드를 지원 할것인지 말것인지 선택 할 수 있다.
- Semantic Colors : 애플에서 제공하는 의미적 색채 개념으로, 컬러를 UI에 따라 네이밍하고 시스템화하는 것을 뜻함, 
- System Color의 도입 : iOS 13이전에는 .white, .black등으로 컬러가 존재했다면 13.0이후로는 .systemRed, systemBackground 식으로 의미적 개념을 더함
- UIKit에서 Apperence 모드에 따른 분기
```Swift
if #available (iOS 13.0, *) {
  switch traitCollection.userInterfaceStyle {
  case .light, .unspecified:
    print("now light mode!")
  case .dark:
    print("now dark mode!")
  }
}
```