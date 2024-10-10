import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. 창고 만들기 (ViewModel)
class PostDetailVM extends StateNotifier<PostDetailModel?>{
  PostDetailVM(super.state);


}

//2. 창고 데이터(State)  왜 따로 하냐? 타입이 클래스니까
class PostDetailModel{

}
//3. 창고 관리자(Provider) 이 view에 관한것만   화면 빌드 될때 창고 관리자 만들어 지고 그 이후 창고 만들어진다
final postDetailProvider = StateNotifierProvider <PostDetailVM, PostDetailModel?>((ref) {
  return PostDetailVM(null);
});