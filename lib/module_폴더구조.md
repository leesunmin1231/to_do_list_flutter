# modules 폴더 구조

- 이 폴더는 모든 앱 모듈을 포함한다.
- 각 모듈에는, 앱의 각 페이지에 필요한 클린코드 레이어를 생성한다.
  - page
    - data
    - domain
    - presentation

**configs**

**core**
- 코드 전체에서 공통으로 사용되는 모든 로직
- components: 공통 컴포넌트
- constants
- utils
- theme
...

**presentation**
- widgets: 보여지는 ui그리는 위젯 클래스 (stateless widget)
  - ~~~.widget.dart
- cubits: 위젯의 상태관리 클래스 (state widget)
  - ~~~_cubit.dart
  - ~~~_state.dart
- views: cubit과 widgets을 조합한 페이지
  - ~~~.view.dart

**domain**
- entities: 데이터 저장 클래스 (store) DTO
   - ~~~_entity.dart
- repositories: 데이터 가져오는 인터페이스 (get, set, delete 등등)
   - ~~~_repository.dart
- usecases: repositories를 감싼 리얼 인터페이스. 외부에서 가져다 쓰는 클래스
   - ~~~_usecase.dart

**data**
- repositories: domain의 repositories를 확장한 클래스(implements). 데이터 변환 및 가공
  - ~~~_repository_impl.dart
- datasources: 외부 API와 연결하는 클래스
  - ~~~_data_source.dart
  - ~~~_data_source_impl.dart
- entities(models): 필요시. api에서 가져오는 데이터 DTO
