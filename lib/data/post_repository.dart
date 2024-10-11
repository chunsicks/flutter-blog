import 'package:blog/core/utils.dart';
import 'package:dio/dio.dart';

class PostRepository {

  Future<List<dynamic>> findAll() async {
    //1. 통신 -> response [header, body]
    Response response = await dio.get("/api/post");

    //이 바디는 map타입이라
    //2. body 부분 리턴
    //body 부분이 컬렉션이면(json array) List<dynamic>으로 받기
    //body 부분이 json이면 Map<String, dynamic>으로 받기
    List<dynamic> responseBody = response.data["body"];

    //이거는 list의 Map타입
    return responseBody;
  }

  //상세보기
  Future<Map<String, dynamic>> findById(int id) async {
    //1. 통신 -> response [header, body]
    Response response = await dio.get("/api/post/$id");

    //이 바디는 map타입이라
    //2. body 부분 리턴
    //body 부분이 컬렉션이면(json array) List<dynamic>으로 받기
    //body 부분이 json이면 Map<String, dynamic>으로 받기
    Map<String, dynamic> responseBody = response.data["body"];

    //이거는 list의 Map타입
    return responseBody;
  }
}
