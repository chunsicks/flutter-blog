import 'package:blog/core/utils.dart';
import 'package:blog/data/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//1. 창고 만들기 (ViewModel)
class PostDetailVM extends StateNotifier<PostDetailModel?>{
  PostDetailVM(super.state);

  Future<void> notifyInit(int id) async{
    Map<String, dynamic> one = await  PostRepository().findById(id);
    //findById에서 바디만 가지고 왔음
    state = PostDetailModel.fromMap(one);
  }
}

//2. 창고 데이터(State)  왜 따로 하냐? 타입이 클래스니까
class PostDetailModel{
  int id;
  String title;
  String content;
  String createdAt;
  String updatedAt;

  PostDetailModel.fromMap(map) :
      this.id = map["id"],
      this.title = map["title"],
      this.content = map["content"],
      this.createdAt = formatDate(map["createdAt"]),
      this.updatedAt = formatDate(map["updatedAt"]);
}
//3. 창고 관리자(Provider) 이 view에 관한것만   화면 빌드 될때 창고 관리자 만들어 지고 그 이후 창고 만들어진다
final postDetailProvider = StateNotifierProvider.autoDispose.family <PostDetailVM, PostDetailModel?, int>((ref, id) {
  print("s나 만들어져? $id" );
  return PostDetailVM(null)..notifyInit(id);
});