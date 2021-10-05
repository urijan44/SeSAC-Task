# SSAC - LEDBoard

# LEDBoard

원하는 텍스트를 입력하면 가운데 텍스트가 출력되는 LED board 어플리케이션

![LEDBoard.mp4](SSAC%20-%20LEDBoard%202985ed4848694957885411190a33721e/LEDBoard.gif)

1. 메시지가 출력되는 부분이 문자가 길어도 표시되길 원함 : ScrollView 적용
    - ScrollView를 추가하고 View에 센터로 정렬함
    - Label을 아래 추가하고 스택뷰로 덮어서 오토레이아웃 설정
    - 메시지가 짧을 경우 정 중앙에 정렬되길 원했는데 코드는 작성했으나 버그가 있음

```swift
func centerLabel() {
    let scrollViewSize = scrollView.bounds.size
    let lableSize = boardMessage.frame.size
    
    let hozirontalSpace = lableSize.width < scrollViewSize.width
    ? (scrollViewSize.width - lableSize.width) / 2
    : 0
    
    stackScrollView.frame.origin.x = hozirontalSpace
  }
```

centerLabel 메소드를 텍스트 필드에서 입력을 완료했을 때 마다 호출하는데 적용이 안되고 다시 텍스트 필드에 문자를 하나 이상 치면 그제서야 중앙으로 정렬됨 이유를 모르겠음

메시지가 긴 경우 스크롤 뷰를 통해서 드래그 하면 모두 표시할 수 있지만 최종적으로 원하는 것은 메시지를 왼쪽 처음부터 시작해서 오른쪽 끝으로 자동으로 스크롤링 되게 바람

1. view를 탭하거나 메시지 입력을 마쳤을 때 텍스트 필드와 키보드가 사라지기 적용

```swift
func viewDidLoad() {
	super.viewDidLoad()
	...
		//MARK: View Tap Gesture
    let hideSearchFieldGesture = UITapGestureRecognizer(target: self, action: #selector(hideSearchField))
    view.addGestureRecognizer(hideSearchFieldGesture)
}

@objc func hideSearchField() {
    let transition = CATransition()
    transition.type = .moveIn
    transition.subtype = .fromBottom
    transition.duration = 0.1
    transition.timingFunction = .init(name: .easeInEaseOut)
    stackSearchField.layer.add(transition, forKey: nil)
    stackSearchField.isHidden.toggle()
    view.endEditing(stackSearchField.isHidden)
    if !stackSearchField.isHidden {
      searchField.becomeFirstResponder()
    }
  }
```

사라질 때는 애니메이션이 적용 되는데 나타날 때는 애니메이션 없이 뿅하고 나타남 다른 애니메이션 방식 적용이 필요해 보임

단일 뷰 어플리케이션으로 전체 코드는 ViewController에 모두 작성

- 전체코드
    
    ```Swift
    //
    //  ViewController.swift
    //  LEDBoard
    //
    //  Created by hoseung Lee on 2021/10/02.
    //
    
    import UIKit
    
    class LedViewController: UIViewController {
      
      @IBOutlet var boardMessage: UILabel!
      @IBOutlet var stackSearchField: UIStackView!
      @IBOutlet var scrollView: UIScrollView!
      @IBOutlet var searchField: UITextField!
      @IBOutlet var sendButton: UIButton!
      @IBOutlet var stackScrollView: UIStackView!
      @IBOutlet var textColorChangeButton: UIButton!
      
      
      let colorSet: [UIColor] = [.systemRed, .systemBlue, .systemPink, .white, .systemYellow]
      
      override var shouldAutorotate: Bool {
        false
      }
      
      override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .landscapeRight
      }
      
      override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        .landscapeRight
      }
      
      override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: TextField UI Init
        stackSearchField.layer.cornerRadius = 5
        stackSearchField.layoutMargins = .init(top: 1, left: 8, bottom: 1, right: 8)
        stackSearchField.isHidden = false
        searchField.borderStyle = .none
    
        
        
        //MARK: Buttons UI Injt
        [sendButton, textColorChangeButton].forEach { button in
          button!.layer.borderWidth = 1
          button!.layer.borderColor = UIColor.black.cgColor
          button!.layer.cornerRadius = 8
          button!.frame.size.height = stackSearchField.frame.height
        }
        
        //MARK: boardMessageUI INIT
        changeTextColor()
        centerLabel()
        boardMessage.textAlignment = .left
        
        //MARK: View Tap Gesture
        let hideSearchFieldGesture = UITapGestureRecognizer(target: self, action: #selector(hideSearchField))
        view.addGestureRecognizer(hideSearchFieldGesture)
        
        //MARK: Delegates
        searchField.delegate = self
      
      }
      
      override func viewWillLayoutSubviews() {
        centerLabel()
      }
      
      //MARK: Help Methods
      func centerLabel() {
        let scrollViewSize = scrollView.bounds.size
        let lableSize = boardMessage.frame.size
        
        let hozirontalSpace = lableSize.width < scrollViewSize.width
        ? (scrollViewSize.width - lableSize.width) / 2
        : 0
        
        stackScrollView.frame.origin.x = hozirontalSpace
      }
      
      @objc func hideSearchField() {
        let transition = CATransition()
        transition.type = .moveIn
        transition.subtype = .fromBottom
        transition.duration = 0.1
        transition.timingFunction = .init(name: .easeInEaseOut)
        stackSearchField.layer.add(transition, forKey: nil)
        stackSearchField.isHidden.toggle()
        view.endEditing(stackSearchField.isHidden)
        if !stackSearchField.isHidden {
          searchField.becomeFirstResponder()
        }
      }
      
      //MARK: - IBActions
      @IBAction func tappedSendButton() {
        boardMessage.text = searchField.text
        searchField.text = ""
        hideSearchField()
        centerLabel()
        view.endEditing(true)
      }
      
      @IBAction func changeTextColor() {
        boardMessage.textColor = colorSet.randomElement()
      }
    }
    
    extension LedViewController: UITextFieldDelegate {
      func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tappedSendButton()
        return true
      }
    }
    ```

# 10월 5일 수정
## 스크롤 뷰 안 콘텐츠가 바로 화면 중앙으로 정렬되지 않은 이유

### Main Run Loop
어플리케이션이 실행되면 UIApplication이 메인 스레드에서 main run loop를 실행시키는데 이녀석은 터치 이벤트, 위치의 변화, 디바이스의 회전 등의 UI에 관한 이벤트 들을 처리하게 된다. 이렇게 UI를 처리하면서 돌아오는 것을 update cycle 이라고 하는데 
그렇다면 업데이트 사이클이 돌아올 때 까지는 UI가 갱신이 안된다는 소리다. 즉시 업데이트가 되지 않는 다는 뜻

### 브레이크 포인트
문자열을 중앙으로 옮겨주는 메소드는 tappedSendButton 메소드에서 메시지가 변경 되고, 난 뒤 호출이 되는데 centerLabel() 메소드에 브레이크 포인트를 걸어보면 프레임 사이즈를 계산하는 부분에서 새롭게 작성된 문자의 너비가 아닌, 이전 문자의 너비를 계산하고 앉아있다!

즉 CenterLabel() 메소드로 텍스트 너비를 계산해서 중앙으로 옮기는데 이 메소드가 실행될 때 update cycle이 돌지 않아. 처리되지 않은 UI정보를 가지고 계산을 해버리는 것이다.
그래서 레이블을 업데이트 한 뒤 cycle을 강제로 돌게하는 view.layoutIfNeeded() 를 호출하여 CenterLabel에 갱신 된 Label 사이즈를 전달해 주어야 한다.

>Referece [군옥수수수님 블로그](https://baked-corn.tistory.com/105)
