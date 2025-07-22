# GetX를 사용한 MVVM 패턴 아키텍처

## 📁 디렉토리 구조

```
lib/
├── main.dart                    # 앱 진입점
├── app.dart                     # 앱 설정 및 라우팅
├── app/                         # 앱 핵심 로직
│   ├── controllers/             # ViewModel (비즈니스 로직)
│   │   └── home_controller.dart
│   ├── models/                  # 데이터 모델
│   │   └── user_model.dart
│   ├── services/                # 외부 데이터 소스 (API, DB)
│   │   └── user_service.dart
│   ├── views/                   # View (UI 화면)
│   │   └── home_view.dart
│   ├── widgets/                 # 재사용 가능한 UI 컴포넌트
│   └── routes/                  # 라우팅 설정
│       ├── app_routes.dart
│       └── app_pages.dart
├── core/                        # 공통 기능
│   ├── constants/               # 상수
│   │   └── app_constants.dart
│   ├── themes/                  # 테마 설정
│   │   └── app_theme.dart
│   └── utils/                   # 유틸리티
│       └── dependency_injection.dart
├── screens/                     # 기존 화면들 (필요시 views로 이동)
└── widgets/                     # 기존 위젯들 (app/widgets로 이동 권장)
```

## 🎯 MVVM 패턴 구성요소

### 1. **Model** (`lib/app/models/`)
- 데이터 구조를 정의
- JSON 직렬화/역직렬화 메서드 포함
- 비즈니스 데이터의 표현

```dart
class UserModel {
  final int id;
  final String name;
  final String email;
  
  // fromJson, toJson, copyWith 메서드 포함
}
```

### 2. **View** (`lib/app/views/`)
- UI만 담당하는 순수한 화면
- `GetView<Controller>` 상속으로 Controller와 연결
- 상태 변화는 `Obx()` 위젯으로 반응

```dart
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => // 반응형 UI);
  }
}
```

### 3. **ViewModel** (`lib/app/controllers/`)
- `GetxController` 상속
- 비즈니스 로직과 상태 관리
- Observable 변수로 상태 관리
- Service 레이어와 통신

```dart
class HomeController extends GetxController {
  final _isLoading = false.obs;
  final _users = <UserModel>[].obs;
  
  // 비즈니스 로직 메서드들
}
```

## 🔧 GetX 핵심 기능 활용

### 1. **상태 관리**
```dart
// Observable 변수 선언
final _counter = 0.obs;

// Getter로 접근
int get counter => _counter.value;

// UI에서 반응
Obx(() => Text('$counter'))
```

### 2. **의존성 주입**
```dart
// 서비스 등록
Get.lazyPut<UserService>(() => UserService());

// 컨트롤러에서 사용
final UserService _userService = Get.find<UserService>();
```

### 3. **라우팅**
```dart
// 페이지 정의
GetPage(
  name: '/home',
  page: () => HomeView(),
  binding: BindingsBuilder(() {
    Get.lazyPut<HomeController>(() => HomeController());
  }),
)

// 네비게이션
Get.toNamed('/home');
Get.back();
```

## 📋 구현 단계

### 1단계: 기본 설정
- [x] GetX 패키지 추가 (`get: ^4.6.6`)
- [x] 의존성 주입 설정
- [x] 라우팅 시스템 구성
- [x] 테마 설정

### 2단계: 데이터 레이어
- [x] Model 클래스 생성 (`UserModel`)
- [x] Service 클래스 생성 (`UserService`)
- [x] 의존성 주입에 Service 등록

### 3단계: 비즈니스 로직 레이어
- [x] Controller 생성 (`HomeController`)
- [x] Observable 변수로 상태 관리
- [x] Service와 연동

### 4단계: 프레젠테이션 레이어
- [x] View 생성 (`HomeView`)
- [x] `GetView<Controller>` 상속
- [x] `Obx()` 위젯으로 반응형 UI

### 5단계: 확장
- [ ] 추가 화면 개발
- [ ] 공통 위젯 개발
- [ ] API 통신 구현
- [ ] 로컬 저장소 연동

## 🏗️ 아키텍처 장점

### 1. **관심사 분리**
- View: UI만 담당
- ViewModel: 비즈니스 로직
- Model: 데이터 구조
- Service: 데이터 소스

### 2. **테스트 용이성**
- Controller는 UI와 독립적으로 테스트 가능
- Mock Service를 통한 단위 테스트
- 각 레이어별 독립적 테스트

### 3. **코드 재사용성**
- Service는 여러 Controller에서 재사용
- Model은 앱 전체에서 일관된 데이터 구조
- 위젯은 다양한 화면에서 재사용

### 4. **확장성**
- 새로운 기능 추가 시 기존 코드 영향 최소화
- 모듈별 독립적 개발 가능
- 팀 개발에 유리한 구조

## 🚀 시작하기

1. **패키지 설치**
```bash
flutter pub get
```

2. **앱 실행**
```bash
flutter run
```

3. **개발 시작**
- 새로운 화면: `views/` 에서 시작
- 비즈니스 로직: `controllers/` 에서 시작
- 데이터 모델: `models/` 에서 시작
- 외부 연동: `services/` 에서 시작

## 📚 참고 자료

- [GetX 공식 문서](https://pub.dev/packages/get)
- [Flutter MVVM 패턴](https://flutter.dev/docs/development/data-and-backend/state-mgmt)
- [의존성 주입 패턴](https://en.wikipedia.org/wiki/Dependency_injection)

---

이 아키텍처는 확장 가능하고 유지보수가 쉬운 Flutter 앱을 구축하기 위한 기반을 제공합니다. 