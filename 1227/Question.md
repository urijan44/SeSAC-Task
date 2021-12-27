# Collection Type의 종류와 특징

- Collection Type은 말그대로 어떤 자료형의 묶음으로, Swift에서는 Array, Set, Dictionary, (Tuple 은 아님.)가 있다.

- Array
    - Array는 자료형이 일련의 형태로 연속적으로 저장되는 형태이며, 인덱스를 통해 접근이 가능하다. RandomAccess, Iterator등 프로토콜을 채용하고 있음
    - Swift에서 Array를 초기화 선언할 때 원래 선언했던 사이즈 보다 약간 크게 선언한다. 이는 배열 확장에 따른 오버헤드 연산은 효율적으로 감소 시키기 위함
    - Array의 first의 값을 지울 때는 O(N) Last값을 지울때는 O(1)인데, first는 값을 지우고, 인덱싱을 다시해야해서 O(N)만큼의 시간이 소모된다.
- Set
    - Set는 중복을 허용하지 않는 자료형으로 Dictionary와 비슷하나, 키-값으로 이루어져있지는 않다. 값만 있다.
    - Set에 들어가는 자료형은 Hashable을 채용해야 한다. 
- Dictionary
    - Dictionary는 키-값 쌍으로 이루어진 자료를 저장하는 컬렉션 타입으로, Hashable이며 Key를 통해 값 참조가 가능하다.


- Swift에서 Collection은 또한 Collection과 Sequence 프로토콜에 대한 얘기를 빼먹을 수 없는데 Sequence는 Element를 순환참조 가능한 프로토콜이며, 여기에 Collection을 끼얹으면 인덱스로 접근이 가능해 진다. 
- 그 다음 순서로 끼얹어 지는게 MutableCollection, BidirectionalCollection, RangeReplaceableCollection이 있다. 
    - MutableCollection: 요소를 변경 할 수 있다.
    - BidirectionalCollection: 컬렉션을 앞 또는 뒤에서부터 순회할 수 있다.
    - RangeReplaceableCollection: 컬렉션의 일부를 범위로 변경할 수 있다.

- 그 다음 계층이 RandomAccessCollection, StringProtocol이다.
    - RandomAccessCollection: RandomAccess 순회가 가능하다.
    - StringProtocol: 문자열 접근에 관련된 녀석


# Application LifeCycle with Delegate
> https://developer.apple.com/videos/play/wwdc2019/258/

앱의 실행 상태를 나타내는 것으로, 앱이 전면에서 실행중인지, 앱이 켜졌는지, 꺼졌는지, 백그라운드에서 실행중인지, 백그라운드에서 실행중이지 않는등의 상태를 가지고 있다.

## AppState
앱 상태는 아래 단계로 구분한다.
1. Not Running
2. Inactive
3. Active
4. Background
5. Suspended

이러한 앱의 상태에 따른 반응을 전달하기 위해 UIApplicationDelegate가 존재한다.
해당 델리게이트는 주로 앱이 실행되었는지, 백그라운드에 들어가는지 등에 대한 메소드를 제공하고 뿐만 아니라 노티피케이션의 상태, 백그라운드 작업 결과등 정말 많은 메소드를 호출한다.

iOS 13.0을 기준으로 아이패드의 멀티플 윈도우 등의 기능 등장으로 같은앱의 화면을 여러개 사용하거나 하는 동작 때문에 AppDelegate만으로는 라이프사이클 관리가 어려워 UISceneDelegate 개념이 등장했다.

AppDelegate와는 달리 SceneDelegate는 인터페이스 수준의 장면 전환에 대해 발생한다.

만약 하나의 앱이 동시에 두개가 켜져있고 하나만 꺼졌다고 하면
AppDelegate에서 앱이 종료되었다고 호출되지 않고, SceneDelegate에서 해당 앱이 resign되었다고 호출한다. 그리고 앱이 두개 다 꺼지게 되면 마찬가지로 SceneDelegate에서 resign이 호출된 다음 앱이 모두 꺼졌으므로 AppDelegate에서도 앱이 꺼졌다고 반응하게 된다.

핵심은 iOS13을 기준으로 AppDelegate는 여전히 프로세스 ㅇ비벤트 및 수명 주기를 담당하지만 UI는 UISceneDelegate에서 담당하게 되었다는 것