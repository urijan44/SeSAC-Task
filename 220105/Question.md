# Mutating
Swift에서 구조체는 내부적으로 값을 변경하는 메소드에 대해서 Mutating 키워드를 선언한다
그렇지 않으면 값을 변경할 수 없다.

구조체는 값 타입이기 때문에 시스템은 이 값을 이용하고 변경하려고 할때 값을 복사하는데, 값을 변경하게 되면 원본의 인스턴스가 복사된 인스턴스와 다른 인스턴스가 되어버린다. 그래서 mutating 키워드를 명시해서 컴파일러에서 이렇게 변경된 인스턴스가 복사해서 다른 인스턴스를 만들지 않도록 지시하는 것이다.

# Control transfer statements

- continue: 이번 루프를 생략하고 루프를 맨 윗라인 부터 다시 시작한다.
예를들어서

```Swift
for number in [1,2,3] {
    if number == 2 {
        continue
    }
    print(number)
}
```
위 처럼 작성하게 되면 출력은
```
1
3
```
처럼 2가 생략된다.
조건문에 걸려서 continue되어 중단되고 다음 루프를 시작하기 때문이다.

- break: 루프를 중단하는 상태문으로 for-in, while, switch 등에서 해당 줄에서 즉시 중지시키고 루프를 빠져나갈 수 있다. 중단하는 scope는 괄호안에서 이므로 다음과 같은 경우 바깥 루프가 중단되지 않는다.
```Swift
var array = [1,2,3]
for number in array {
  for number2 in array {
    if number2 == 2 {
      break
    }
    print(number, number2)
  }
}

//print out
1 1
2 1
3 1
```

- fallthrouh: Swift는 Switch문에서 case에 걸린 뒤 자동으로 break된다.C/C++에서는 명시적으로 break하지 않으면 다음 케이스도 실행을 하게 되는데 Swift에서 이를 가능하게 하는것이 fallthrouh이다. case 구문 끝에 fallthourh를 써주면 다음 case도 확인하게 된다.

- label: 제어 흐름 중에 특정 라인으로 이동하게 해주는 기능으로 예를들어 for-in 안에 while이 있고 if도 있고 복잡한 상황에서 단번에 for문 while문 if문 모두 종료하고 즉시 반복의 첫 구문으로 돌아가고 싶을 때 사용해볼 수 있다.

```Swift
<label name>: while <condition> {
    <statements>
}
```