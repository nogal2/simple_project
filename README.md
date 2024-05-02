<h1>Mustad Test</h1>
<h1>기술스택</h1>
<div><img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white"/> <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white"/></div>
<h2>영상</h2>
<img src="https://github.com/nogal2/simple_project/assets/94533750/a66b3331-e29d-4f11-bee2-363c137b4efa" />
<h2>첫 화면을 시작할때, 로그인 인증 과정을 GoRouter의 redirect와 riverpod을 활용해 관리하는 것을 글로 적어놨습니다. 이 과정은 참고용이므로 실제 과제에 대한 로직을 보시려면 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/view/root_tab.dart" >여기</a>부터 보시면 됩니다.</h2>


<h2>common</h2>
<p>혹시 몰라서 브랜드, 유저 페이지마다 페이징 처리를 해놨고, 둘다 비슷한 화면이라서 공통 컴포넌트로 만들어 놨습니다. 이 페이지는 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/component/pagination/pagination_list_view.dart">pagination_list_view</a> 입니다. </p>

<h2>brand</h2>
<p>각 항목별로 체크박스로 체크할수 있도록 해놨습니다. 이곳은 currentPage 와 totalPages가 같아서 페이징 인디케이터가 나오지 않습니다. 이 페이지는 <a href="href="https://github.com/nogal2/simple_project/blob/main/lib/brand/view/brand_screen.dart"">brand_screen</a>입니다.</p>

<h2>other_user</h2>
<p>brand와 같이 항목별로 체크할수 있도록 해놨습니다. 이곳은 currentPage가 totalPages보다 작아 페이징이 가능하여 페이징 인디케이터가 나옵니다. 실제 파라미터를 넘길수 있다면, 다음 페이지가 나오도록 적용을 해놨습니다. 이 페이지는 <a href="https://github.com/nogal2/simple_project/blob/main/lib/other_user/view/other_user_screen.dart">other_user_screen</a>입니다. </p>

<h2>페이징 처리 비즈니스 로직은 <a href="https://github.com/nogal2/simple_project/blob/main/lib/common/provider/pagination_base_provider.dart">pagination_base_provider</a> 입니다.</h2>
