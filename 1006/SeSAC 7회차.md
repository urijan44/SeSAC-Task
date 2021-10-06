# SeSAC 7회차 2021.10.06

# Enumeration - 열거형

[Enumeration - 열거형](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Enumeration%20-%20%E1%84%8B%E1%85%A7%E1%86%AF%E1%84%80%E1%85%A5%E1%84%92%E1%85%A7%E1%86%BC%2036137c3ac7db490e9a1ca2013427964d.md)

# Alert

[Alert](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Alert%201ed9895c8b074424bf440b3a8f21bb21.md)

앱을 사용하다보면 유저에게 어떤 이슈에 대해서 알람을 알려줄 필요가 있다. 다양한 이슈가 있는데 예를들어 잘못된 데이터에 접근 혹은 데이터에 접근할 수 없다던가, 네트워크 요청이 실패했다던가 혹은

작업 저장시 정말 이 상태를 저장할 것인지?, 또는 파일을 삭제할 때 정말 삭제할 것인지? 그러한 상황에서 알람이 표시되는 걸 앱을 사용하면서 많이들 겪어 보았을 것이다.

![Untitled](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Untitled.png)

![Untitled](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Untitled%201.png)

![Untitled](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Untitled%202.png)

# Storyboard Reference

스토리보드를 통해 UI를 작업하게 되면 코드로 작성하는 것보다 계층과의 관계를 판단하기 쉽고 시각적으로 쉽게 정보를 얻을 수 있지만 뷰컨트롤러가 늘어날 수록 스토리보드 로딩 시간이 오래 걸리고 앱의 Scene 구조를 이해하기에도 복잡해진다. 또 Git을 통해 협업을 할 때 Storyboard 소유자가 달라지거나 해어 앱이 충돌이 발생할 수 있다.

스토리보드를 사용하지 않고 100% 코드로만 작업할 수도 있고, 스토리보드 안에 하나의 뷰컨트롤러를 두어 스토리보드 자체를 나누어서 작업할 수도 있다. 스토리보드 레퍼런스는 스토리보드를 나누어서 작업 하는 방법 중 하나이다.

# OpenSource Licensse

## 오픈소스 란?

오픈소스는 라이선스 방식을 통해 배포된 소스 코드를 자유롭게 복사, 수정, 사용, 재배포할 수 있는 것을 뜻한다. 이로인해 오픈소스는 누구든 버그, 개조 등으로 코드를 만질 수 있으며, 코드 개발에 기여할 수 도 있다. 오픈소스는 해당 소스의 원본 작성자가 아니더라도 코드의 배포, 소스코드 접근, 수정 권리등을 제공한다.

## 그렇다고 막 가져다 쓸 수는 없다!hj

이렇게 사용되는 오픈소스, 그냥 아무렇게나 써도 되나? 라고 생각이 들지만 그렇지 않다. 분명 자유롭게 소스에 접근할 수 있지만 이는 어디까지나 오픈소스의 라이선스를 준수했을 때 이다. 만약 해당 오픈소스의 라이선스가 "아 우린 상업적 이용 절대 안돼!" 라고 명시했는데 이를 모르고 상용 소프트웨어에 사용하게 된다면 자칫 법적 소송에 휘말릴 수 있다.

## 오픈소스 준수 사항

예를들어 Swift의 라이선스를 [읽어보자](https://github.com/apple/swift/blob/main/LICENSE.txt)

오픈소스에 대한 내용이 꽤 방대... [sktelecom 깃헙에 가이드](https://sktelecom.github.io/guide/)가 정리되어있다. 내용이 꽤 많다!

# Swift Package Manaer (SPM)

SPM은 Cocoapods 처럼 패키지를 관리하기 위한 도구로 외부 소스 코드의 메타데이터와 매니페스트 들을 관리할 수 있다.

File - Add Package, 에서 깃헙 주소를 넣는 것으로 패키지를 손쉽게 가져올 수 있다.

모든 Swift 패키지들은 semantic versioning을 준수해야 한다. 이는 패키지의 버전 릴리즈에 따른 사항으로 3구역으로 나뉘어 다음과 같은 포멧을 따른다.

major.minor.patch

예를들어 버전이 3.5.1 이라고 한다면

major 버전은 3이며, minor 버전은 5, patch 버전은 1이된다.

패키지 작성자는 이전 버전과 호환되는 버그 수정을 수행할 때 패치 버전을 수행시킬 수 있다.

마이너 버전은 새 메서드 추가와 같은 이전 버전과 호환이 되는 추가 기능을 작성할 때 증가시킬 수 있다.

마지막으로 기존 API와 호환이 되지 않는 사항이 도입될 때 메이저 버전을 증가시킬 수 있다.

자세한 내용은 [semver](https://semver.org/lang/ko/)에서 볼 수 있다.

 

## 패키지 종속성 업데이트

패키지는 언제든 File - Packages - Update to Lastest  Package Versions 을 이용해 업데이트 할 수 있다.

## Swift Package의 구조

Swift Package는 Package.swift 라는 매니페스트 파일과 소스 코드 파일의 모음으로 구체적으로는 아래의 내용이 포함되어 있다.

```swift
// 1
// swift-tools-version:5.0
// 2
import PackageDescription

// 3
let package = Package(
 // 4
 name: "YourPackageName",
 // 5
 platforms: [.iOS(.v13), .macOS(.v10_14)],
 // 6
 products: [
   .library(name: "YourPackageName", targets: ["YourPackageTarget"])
 ],
 // 7
 dependencies: [
   .package(url: "https://github.com/some/package", from: "1.0.0"),
 ]
 // 8
 targets: [
   .target(name: "YourPackageTarget"),
   .testTarget(
     name: "YourPackageTargetTests", 
     dependencies: ["YourPackageTarget"]
   )
 ]
)
```

1. 매니패스트 첫 번째 줄에는 패키지를 빌드하는 데 필요한 Swift의 컴파일러 최소 버전이 주석으로 작성되어 있다. 이는 지정된 형식이다.
2. PackageDescription 라이브러리를 가져온다. 패키지를 정의하기 위한 Apple 에서 제공하는 라이브러리이다.
3. Package 자체의 생성자로 다음과 같은 인자를 가지고 있다.
4. name: 패키지의 이름
5. platforms: 패키지가 실행될 수 있는 플랫폼
6. products: 패키지가 제공하는 products로 다른 Swift 프로젝트로 가져올 수 있는 library, 코드 또는 운영체제 에서 실행되는 코드일 수 있다. 
7. dependencies: 패키지에 필요한 모든 종속성으로 필요한 버전과 함께 코드가 포함된 Git 저장소의 URL이 있다.
8. targets: 하나 이상의 target으로, target은 독립적으로 빌드된 코드 모듈이다.

## Local Packages

SPM을 통해 다른 사람들이 작성한 오픈 소스 패키지 쉽게 접근하고 매니징 할 수 있다는 것을 알았다. 여기서 한발 더 나아가서 프로젝트 간에 더 쉽게 재사용할 수 있도록 코드를 패캐지로 분할할 수도 있다.

로컬 패키지는 프로젝트 내에서 직접 코드를 편집할 수 있기 때문에 원격 패키지와 다르다. 이는 첫 번째 릴리스를 준비하기 전에 많이 변경될 수 있는 새 패키지를 만들 때 아주 유용하다.

Xcode - File - New - Package로 작성할 수 있다.

![Untitled](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/Untitled%203.png)

패키지를 생성하고 나면 프로젝트에 다음과 같이 패키지 이름으로 들어오게 된다.

# User Defaults
(Mission)
[User Defaults](SeSAC%207%E1%84%92%E1%85%AC%E1%84%8E%E1%85%A1%202021%2010%2006%2075ee4a27d64145bfaaeb4b58b5b3f7db/User%20Defaults%200157b96c3cd84184b3c67e00185f707c.md)

# Assignment
[깃헙 링크](https://github.com/urijan44/SeSAC_EmotionDiary)

후기
- 처음에 슬라임 UI를 어떻게 구성해야 하나 한참을 고민했는데, 배운대로만 해보자 하고 컬랙션 뷰나, 코드로 커스텀 뷰는 안했다. 스택뷰로 감싸고 이를 아웃렛 컬랙션을 통해서 다룰 수 있다는 것을 알게되어 좋았다.
- 그간 UserDefaults에 대해서 잘 몰랐을 때 데이터를 URL을 구하고 객체를 plist 파일로 저장하고 했는데 UserDefaults를 이용하면 URL 작성하는 코드를 줄일 수 있다.
- 솔직히 코테만 할때는 열거형을 잘 사용할 일이 없는데 능력껏 사용해 봤다. 잘 쓴건가?
- selector 인자를 전달할 수 없는 것을 처음 알았다. GestureRecognizer가 상속해서 확장해서 쓸 수 있다는 개념을 알아 도움이 많이 되었다.
- 두 컬렉션을 동시에 for - in 할 수 있는 zip 이라는 함수를 개별 스터디 때 얻은 게 정말 좋았다. 아니까 당장 쓰게 되는 진짜 유용 하다.