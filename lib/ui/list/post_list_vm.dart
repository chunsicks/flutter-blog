import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. 창고 만들기 (ViewModel)
class PostListVM extends StateNotifier<PostListModel?>{
  PostListVM(super.state);

  //상태만 바꾸면 되니까 리턴 필요 없다!!  왜 스프링 서버는 MVC로 하냐?
  //내 디바이스에서만 함 상태 저장해도 뭐 없음 스프링에서 하면 너무 많아서 터짐 관리 못함! 사용자마다의 view model을 관리 해야함! 부하가 너무 커진다
  Future<void> notifyInit() async{
    //1. 통신을 해서 응답 받기
    //한건 one 여러건 list
    List<dynamic> list = await PostRepository().findAll();
    //2. 파싱
    List<_Post> posts = list.map((e)=> _Post.fromMap(e)).toList();

    //3. 상태 갱신   지금은 상태 아직 안됨  상태는 api문서 보고 만들면 된다!
    state = PostListModel(posts); // 이게 깊은 복사( 기존 데이터를 건드리지 않는다)
  }
}

//2. 창고 데이터(State)  왜 따로 하냐? 타입이 클래스니까
class PostListModel{
  List<_Post> posts;

  PostListModel(this.posts);
}
class _Post{
  int id;
  String title;
//이름 있는 생성자 만들거미  toEntity같은 것처럼
  //왜 MAP이냐면  스프링한테 요청 통신하면 데이터 타입 json이다
  //문자열이다 문자열 받으면 바트가 dio라는 라이브러리 사용할거임(통신 라이브러리) 패치 같은 것이다
  //자동으로 알아서 MAP타입으로 컨버팅 해준다!  결국 편한게 통신하면 자기 타입으로 바꿔야 하는데 MAP보다 좋은
  //... 객체 연결 쓰는 것 자기 오브젝트 클래스로 바꾸는 거는 해줘야 함
  //MAP은 맵까지 만들어 주니까!!
  _Post.fromMap(map) :
      this.id = map["id"],
      this.title = map["title"];
}

//3. 창고 관리자(Provider) 이 view에 관한것만 화면 빌드 될때 창고 관리자 만들어 지고 그 이후 창고 만들어진다
final postListProvider = StateNotifierProvider <PostListVM, PostListModel?>((ref) {
  return PostListVM(null)..notifyInit();
});