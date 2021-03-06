# Alert
앱을 사용하다보면 유저에게 어떤 이슈에 대해서 알람을 알려줄 필요가 있다. 다양한 이슈가 있는데 예를들어 잘못된 데이터에 접근 혹은 데이터에 접근할 수 없다던가, 네트워크 요청이 실패했다던가 혹은

작업 저장시 정말 이 상태를 저장할 것인지?, 또는 파일을 삭제할 때 정말 삭제할 것인지? 그러한 상황에서 알람이 표시되는 걸 앱을 사용하면서 많이들 겪어 보았을 것이다.

![Untitled](Alert/default.png)

알람은 모두 Alert Controller로 시작한다. 알람은 타이틀, 메시지와 각각의 동작을 취한다.

## Alert Style

알람은 두 종류의 알람이 있는데 위 사진과 같은 평범한 '알람' 스타일, 두번째 스타일은 액션 시트 스타일로 알람의 각 동작이 수직으로 표시된다.

![Untitled](Alert/action.png)

## Alert Button Style

알람에 표시되는 버튼에도 스타일이 있는데 3가지 스타일이 있다. default, cancel, destructive 스타일이 있다. destructive 스타일은 해당 버튼이 위험한 동작이라는 것을 명시한다. 위에서 예를 들었듯 무언가 삭제하는 행위에서 사용할 수 있다

## Add Alert

알람을 사용하는 법은 굉장히 쉽다.

위 화면과 같은 인터페이스에서 버튼을 누르면 알람이 출력 되도록 해보자 해당 버튼을 인터페이스 빌더 액션으로 연결한다

그리고 액션 안에 다음과 같이 작성한다.

```swift
@IBAction func showAlert() {
    //1. 
    let alert = UIAlertController(title: "주요!", message: "이것은 알람입니다 자세히보세요!", preferredStyle: .alert)

		//2.
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      print("OK버튼이 눌려짐")
    }
		//3.
    alert.addAction(ok)
    //4.
    let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
      print("취소!")
    }
		//5.
    alert.addAction(cancel)
    //6.
    present(alert, animated: true, completion: nil)
   
  }
```

1. 알람은 앞서 말했든 Alert Controller에서 시작한다. 알람 액션들을 담는 큰 그릇으로 이 알람의 제목과 내용을 입력 할 수 있다.
2. 알람의 버튼들은 UIAlertAction으로 정의된다. 버튼에 표시되는 문구와 스타일, 그리고 핸들러를 지정할 수 있다.
3. 이렇게 추가한 UIAlertAction의 인스턴스는 AlertController에 추가한다.
4. Cancel 스타일로 알람 액션을 추가해보자.
5. 액션 추가
6. 이렇게 완성된 알람 컨트롤러 인스턴스는 present를 통해 표시할 수 있다.

![Untitled](Alert/cancel.png)

알람 버튼의 특성도 여기서 볼 수 있다. 취소 버튼은 확인 버튼과 다르게 살짝 볼드 처리가 된 것을 확인할 수 있다.

destructive 버튼은 어떨까

코드로 돌아가서 ok 액션을 .default가 아닌 .destructive로 바꾸어 보자

![](Alert/distructive.png)

위 사진과 같이 빨갛게 표시되며, 버튼은 항상 우측에 위치하게 된다. 

이러한 액션이 아주 많이 추가가 되면 어떻게 변할까?

![Untitled](Alert/manyActions.png)

액션 시트와 비슷하게 세로 형태로 나온다. 다른 점은 이는 화면 중앙에 위치가 된다.(좌측이 .alert, 우측이 .actionSheet)

## Alert TextField

한가지 알람 컨트롤에는 재밌는 기능이 있는데 바로 Alert TextField이다. 알람 컨트롤러 안에 텍스트필드를 넣어 값을 입력받을 수도 있는데 이를 통해 로그인 화면도 구현이 가능하다 (다들 그렇게 쓰지는 않겠지만, 로그인 화면은 자고로 화려해야 한다.)

![Untitled](Alert/login.png)

```swift
@IBAction func showAlert() {
    let alert = UIAlertController(title: "고양이 카페에 로그인 하기", message: "고양이 카페에 로그인 하기 위한 이메일과 비밀번호를 입력해 주세요", preferredStyle: .alert)
    
    let ok = UIAlertAction(title: "확인", style: .default) { _ in
      let email = alert.textFields?[0].text
      let password = alert.textFields?[1].text
      
      self.welcomLabel.text = email == "admin@email.com" && password == "123456"
      ? "admin님 환영합니다" : "로그인 실패"
    }
    alert.addAction(ok)
    
    let cancel = UIAlertAction(title: "취소", style: .cancel) { _ in
      print("fail")
    }
    alert.addAction(cancel)
    
    alert.addTextField { textField in
      textField.placeholder = "이메일"
    }
    
    alert.addTextField { textField in
      textField.placeholder = "암호"
      textField.isSecureTextEntry = true
    }

    present(alert, animated: true, completion: nil)
  }
```