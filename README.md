# Flutter Warm Up Project

GetX 학습을 위한 MVVM 패턴 기반의 Flutter 프로젝트입니다.

## 아키텍처

이 프로젝트는 **MVVM (Model-View-ViewModel)** 패턴과 **GetX** 상태 관리를 사용하여 구조화되어 있습니다.

```
lib/
├── app/                # 앱 핵심 로직
│   ├── controllers/    # ViewModel (비즈니스 로직)
│   ├── models/         # 데이터 모델
│   ├── services/       # 외부 데이터 소스
│   ├── views/          # UI 화면
│   └── routes/         # 라우팅 설정
├── core/               # 공통 기능
│   ├── constants/      # 상수
│   ├── themes/         # 테마 설정
│   └── utils/          # 유틸리티
└── main.dart           # 앱 진입점
```

## 시작하기

1. **패키지 설치**
   ```bash
   flutter pub get
   ```

2. **앱 실행**
   ```bash
   flutter run
   ```

## 자세한 정보

프로젝트의 상세한 아키텍처 설명은 [MVVM_Architecture.md](./MVVM_Architecture.md) 파일을 참고하세요.

## 주요 기술

- **Flutter**: UI 프레임워크
- **GetX**: 상태 관리, 라우팅, 의존성 주입
- **MVVM**: 아키텍처 패턴

## 참고 자료

- [Flutter 공식 문서](https://docs.flutter.dev/)
- [GetX 패키지](https://pub.dev/packages/get)
- [MVVM 패턴](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)
