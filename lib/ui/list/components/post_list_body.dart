import 'package:blog/ui/detail/post_detail_page.dart';
import 'package:blog/ui/list/post_list_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //1. ViewModel이 만들어져야함   창고관리자, 창고, 데이터 가 만들어 져야지 뿌릴 거니까
    //와치로 만들어져야 데이터 뿌리고 통신해서 null 아닌 것 뿌릴 수 있으니까
    //post list model에 넣아야함
    PostListModel? model = ref.watch(postListProvider);

    if (model == null) {
      return CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text("${model.posts[index].id}"),
                title: Text("${model.posts[index].title}"),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetailPage(model.posts[index].id),),);
                  },
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: model.posts.length),
      );
    }
  }
}
