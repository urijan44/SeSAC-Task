# Question

## Optional
Swift에서 Optional은 Generic Enumeration 으로 이루어져 있다.
옵셔널을 선언할 때 기본적으로
T? = T()으로 선언하는데 이를 풀 신텍스로 펼쳐보면
Optional<T> = T()이다.

```Swift
let number: Int? = Optional.some(42)
let noNumber: Int? = Optional.none
print(noNumber == nil)
```

## Type Casting
인스턴스의 타입을 확인하거나, 해당 인스턴스를 상위 또는 하위 클래스로 인식하고 처리하는 방법이다.

예를들어 A를 상속한 B는 A로서도 볼 수 있다.

```Swift
class A {
    var value: Int

    init(value: Int) {
        self.value = value
    }
}

class B {
    var check: Bool

    init(value: Int, check: Bool) {
        self.check = check
        super.init(value = value)
    }
}

```

클래스 B는 A의 속성을 다 가지고 있기 때문에 A로서도 볼 수 있다. 이때 A로서 판단하려고 하는게 타입 캐스팅이다.

- Checking Type: is
    - B is A는 B타입이 A타입인지 Bool값으로 떨어진다.


- Downcasting: as? as!
    - 하위클래스의 인스턴스를 참조하는 법으로, as?는 옵셔널 값을 반환, as! 강제로 캐스팅을 시도한다.

- Upcasting: as
    - 하위 클래스에서 상위 클래스로 캐스팅 할 때 사용