# 안드로이드 스튜디오 - 에뮬레이터 실행 했는데, 에뮬레이터 목록에 안뜰 경우
- `flutter doctor` 를 해보자


# 안드로이드 스튜디오 - 애뮬레이터에서 코드 빌드 안되는 이슈
## 1. 문제 원인
### 에러 로그
```bash
bug! exception in phase 'semantic analysis' in source unit '_buildscript_' unsupported class file major version 67
```
### 발생 이유
- Java 버전과 Gradle의 지원 버전이 맞지 않다.
- Java 버전을 낮추거나 프로젝트 Gradle 버전을 높여야 함.

## 2. 해결 방법

1. Jdk 17 추가
   1. File -> Project Structure -> Platform Settings -> SDKs 접속 후
   2. 왼쪽 상단 + 클릭
   3. download jdk 후 17 버전 다운로드
2. jdk 17로 세팅해주기
   1. File -> Project Structure -> Project Settings -> Project 에서 SDK 를 다운받은 jdk17로 변경하기
   2. File -> Project Structure -> Project Settings -> Modules 에서 Dependencies에서 Dart SDK, Flutter Plugins 체크
3. 프로젝트에서 java version 변경하기
   1. 실행할 프로젝트에서 android 폴더 -> gradle.properties 파일 열기
   2. 맨 윗줄에 `org.gradle.java.home=C:\\Users\\user\\.jdks\\corretto-17.0.13` 추가
      1. 이때 경로는 새로 설치한 jdk17 버전의 경로를 써야한다.