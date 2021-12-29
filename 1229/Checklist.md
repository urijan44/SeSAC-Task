# Checklist

## WMO
Whole Module Optimizations

포로젝트를 작성하다 보면 Swift파일이 하나가 아니라 여러개가 생성이 될 수 있는데, 기본적으로 Xcode는 이들을 각각 컴파일 한다. (병렬로 빠르게) 

전체 파일을 하나의 파일 인 것 처럼 컴파일 할 수 있는데, 이렇게 되면 컴파일 시간은 조금 더 오래걸리나, 더 빨리 실행할 수 있다.
이 옵션은 swiftc command flag -whole-module-optimization을 사용하여 활성화 할 수 있다.
또는 Xcode BuildSetting, whole module optimization으로 활성화 할 수 있다.

## Dispatch
### Static Dispatch
- Direct Call 이라고도 하며, 이는 컴파일 타임에 호출되는 함수가 무엇인지 결정되고, 런타임에서는 결정된 함수가 그대로 실행이 된다. 런타임에서 판단할 필요가 없기 때문에 성능 상 이점이 있다.
- 값 타임, 참조타입 모두 지원
- 기본적으로 열거형, 구조체 등은 Static Dispatch

### Dynamic Dispatch (Indirect Call)
- 런타임에 호출되는 함수가 결정됨
- 런타임에서 계속 셜정하기 떄문에 성능 상 오버헤드가 발생
- 클래스를 상속받아 부모 클래스의 메서드를 재정의하여 사용할 때 어떤 메소드가 실행되는지 런타임에 결정, 이 때는 vTable을 참조하여 실제 호출할 함수를 결정하게 됩니다.
- 참조타입만 지원
- 기본적으로 클래스의 경우 Dynamic Dispatch

## final
- 기본적으로는 상속을 방지하는 키워드 이지만, 상속을 명시적으로 방지해서 Dynamic Diaptch로 실행되는 클래스를 Static Dispatch로 사용하게 된다.

## static func vs class func
static func 으로 명시된 타입 메소드는 상속에 의한 오버라이딩이 안되는데 class func는 타입 메소드 이면서 오버라이딩이 가능한다. 상속을 가능하게 하기 때문에, final class func 는 static func와 같다.

## fileprivate vs private 
접근 제어자 이면서 명시적으로 파일에 대한 가시성을 결정 하기 때문에 컴파일러가 해당 파일과의 관계를 확인할 수 있다.
따라서 잠재적으로 재정의 여부를 알 수 있어, Dynamic Dispatch를 제거할 수 있다.