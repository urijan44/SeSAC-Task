# Checklist

## Git vs Github
깃헙은 깃의 원격 저장소를 일부 무료로 제공하는 웹 서비스이다.

## Local Repositry vs Remote Repositry
SVN과 다른, 깃의 주요 개념으로 작업자는 자는 항상 원격 저장소와 로컬 저장소를 구분하여, 작업의 효율을 높인다. 설령 인터넷이 끊어졌더라도 로컬 저장소에 저장된 것으로 작업이 가능하며
로컬에서 파일이 망가졌더라도 원격 이라는 보험이 있으므로 한번 더 안전하다.
[깃 찍먹하기](https://github.com/urijan44/TIL-Store/blob/master/Git/Git%EC%B0%8D%EB%A8%B9%ED%95%98%EA%B8%B0/Git%EC%B0%8D%EB%A8%B9%ED%95%98%EA%B8%B0.md)

## Commit vs Push
[깃 찍먹하기](https://github.com/urijan44/TIL-Store/blob/master/Git/Git%EC%B0%8D%EB%A8%B9%ED%95%98%EA%B8%B0/Git%EC%B0%8D%EB%A8%B9%ED%95%98%EA%B8%B0.md)

## Navigation Controller
네비게이션 컨트롤러는 계층적인 성격을 띠는 콘텐츠 구조를 관리하기 위한 뷰 컨트롤러의 특별한 종류로, 앱의 내비게이션을 표시해줄 수 있는 내비게이션 바가 포함되어 있다. <br>
>네비게이션 컨트롤러 속성과 자세한 내용 따로 정리할 것

## TabBarController
텝바 컨트롤러는 네비게이션 컨트롤러와 유사한 특수 목적의 뷰 컨트롤러로 네비게이션이 뷰의 관계가 수직적(Stack)의 형태라면 TabBarController 는 수평적인 관계를 가지고 있다.
>텝바 컨트롤러에 대해 따로 자세히 정리할 것

## App Lifecycle
[앱 생명주기](https://github.com/urijan44/SSAC-Task/blob/master/0929/Checklist.md)

## ViewController Lifecycle
[뷰 컨트롤러 생명주기](https://github.com/urijan44/TIL-Store/blob/master/Swift/UIKit/ViewController/VCLifeCycle.md)

[앱 생명주기, 뷰 컨트롤러 생명주기 읽을거리](https://ugly-developer.tistory.com/5)

## SizeClass : Compact vs Regular
iOS 디바이스는 다양한 종류가 있고, 디바이스의 크기마다 동일한 코드임에도 다르게 보여지는 경우가 있는데 경험했던 가장 대표적인 얘가, 아이패드에서와 아이폰에서의 네비게이션 을 표시하는 방법이다. 그런데 Max가 붙은 계열에서도 landscape모드를 할시 아이패드 처럼 네비게이션이 보이는 경우도 있다. 이처럼 사이즈 클래스는 크기에 따라 콘텐츠 영역에 자동으로 할당되는 특성이 있다.

