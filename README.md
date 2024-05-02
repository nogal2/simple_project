<h1>Mustad Test</h1>
<h1>기술스택</h1>
<div><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/> <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/></div>
<h2>영상</h2>
<img src="https://github.com/nogal2/simple_project/assets/94533750/a66b3331-e29d-4f11-bee2-363c137b4efa" style="width:200px; height:auto;" />

<h3>첫 화면을 시작할때, 로그인 인증 과정을 GoRouter의 redirect와 riverpod을 활용해 관리하는 것을 글로 적어놨습니다. 이 과정은 참고용이므로 실제 과제에 대한 로직을 보시려면 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/view/root_tab.dart" >여기</a>부터 보시면 됩니다.</h3>

<h3>로그인 과정 설명 페이지들은 <a href="https://github.com/nogal2/simple_project/blob/main/lib/user/provider/auth_provider.dart">auth_provider</a>와 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/dio/dio.dart">dio</a>에 있습니다.</h3>

<h2>common</h2>
<p>혹시 몰라서 브랜드, 유저 페이지마다 페이징 처리를 해놨고, 둘다 비슷한 화면이라서 공통 컴포넌트로 만들어 놨습니다. 이 페이지는 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/component/pagination/pagination_list_view.dart">pagination_list_view</a> 입니다. </p>

<h2>brand</h2>
<p>각 항목별로 체크박스로 체크할수 있도록 해놨습니다. 이곳은 currentPage 와 totalPages가 같아서 페이징 인디케이터가 나오지 않습니다. 이 페이지는 <a href="href="https://github.com/nogal2/simple_project/blob/main/lib/brand/view/brand_screen.dart"">brand_screen</a>입니다.</p>

<h2>other_user</h2>
<p>brand와 같이 항목별로 체크할수 있도록 해놨습니다. 이곳은 currentPage가 totalPages보다 작아 페이징이 가능하여 페이징 인디케이터가 나옵니다. 실제 파라미터를 넘길수 있다면, 다음 페이지가 나오도록 적용을 해놨습니다. 이 페이지는 <a href="https://github.com/nogal2/simple_project/blob/main/lib/other_user/view/other_user_screen.dart">other_user_screen</a>입니다. </p>

<h3>페이징 처리 비즈니스 로직은 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/provider/pagination_base_provider.dart">pagination_base_provider</a> 입니다.</h3>

<h3>MVVM 패턴</h3>
<p>MVVM(Model-View-ViewModel)패턴은 UI 설계를 위해 사용되는 아키텍처 패턴 입니다. 이 패턴은 위에 나와있듯 세개로 분류하여 각 코드의 관심사를 분리하여 유지보수성을 높이며 개발 프로세스의 효율을 높입니다. 패턴의 각 구성요소는 이렇습니다.</p>
<p>MVVM(Model-View-ViewModel)패턴은 UI 설계를 위해 사용되는 아키텍처 패턴 입니다. 이 패턴은 위에 나와있듯 세개로 분류하여 각 코드의 관심사를 분리하여 유지보수성을 높이며 개발 프로세스의 효율을 높입니다. 패턴의 각 구성요소는 이렇습니다.</p>
<p>Model: 애플리케이션의 데이터 관련 로직입니다. 모델은 비즈니스 로직과 데이터의 상태 그리고 데이터를 조작하고 관리하는 규칙들을 정의합니다. 모델은 View에 대한 어떤 정보도 갖이 않으며 사용자와 상호작용 이벤트를 처리하지 않습니다.</p>
<p>View: 사용자에게 보이는 UI 요소 입니다. View는 사용자와 상호작용하는 부분으로, 사용자의 입력을 받고 데이터를 시각적으로 표현합니다. View는 ViewModel을 통해 데이터를 표현하며, 사용자 입력은 ViewModel에 의해 처리됩니다.</p>
<p>ViewModel: ViewModel은 View와 Model사이의 중재자 역할을 합니다. View에서 보여야 하는 상태를 Model로부터 받아 View에서 필요한 데이터로 가공하는 역할을 합니다. View는 ViewModel을 구독하여 변경된 데이터가 있을시에 다시 데이터 바인딩을 합니다.
</p>
<p>플러터 Riverpod 에서는 Provider, StateNotifier로 비즈니스 로직과 프레젠테이션 로직을 관리하고 View와 데이터 바인딩 해주는 역할을 합니다. 이렇게 View와 ViewModel간의 동기화를 간소화하여 UI와 비즈니스 로직을 쉽게 분리할 수 있어, 유지보수성을 높이며 효율적으로 처리할 수 있습니다.</p>
