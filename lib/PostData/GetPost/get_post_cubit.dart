import 'dart:convert';

//
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';

//
part 'get_post_state.dart';

//
class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());

  static GetPostCubit get(context) => BlocProvider.of(context);
  List<GetPostDataUser> getAllPost = [];
  List<GetPostDataUser> searchAllPost = [];

  Map<num,bool> isFavorite={};
  Future<void> getDataSuggest() async {
emit(LoadingGetUserSuggest());
    try {
      http.Response response = await http
          .get(Uri.parse("http://sakenyapi.runasp.net/api/Posts"), headers: {
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",

      });
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        getAllPost.clear();

        for (var item in responseBody) {
          getAllPost.add(GetPostDataUser.fromJson(item));
          isFavorite.addAll({item["postId"]:item["isFavourited"]});
          // idFavorite.add(item["postId"]);
        }

        print("the lenght of list is${getAllPost.length}");
        emit(SuccessGetUserDataSuggest());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetPostSuggest(error: e.toString()));
    }
  }

  // void searchPost(String price) async {
  //   try {
  //     // http.Response response = await http
  //     //     .post(Uri.parse("http://sakenyapi.runasp.net/api/Posts/search"),body: {
  //     //   "PostBedrooms":price,
  //     // });
  //     // if(response.statusCode==200){
  //     //   print(response.body);
  //     //   emit(SuccessSearch());
  //     // }
  //     searchAllPost = getAllPost
  //         .where((element) =>
  //             element.postBody!.toLowerCase().startsWith(price.toLowerCase()))
  //         .toList();
  //     emit(SuccessSearch());
  //   } catch (e) {
  //     emit(ErrorSearch(error: e.toString()));
  //   }
  // }

  void favorite(num id) async {
    // getAllFavorite.clear();
    // isFavorite[id]=!isFavorite[id]!;
    // emit(LoadingFavorite());
    try {
      http.Response response = await http.post(
          Uri.parse("http://sakenyapi.runasp.net/api/Faviourate/$id/favorite"),
          headers: {
            "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
            'Content-Type': 'application/json',
          });
      print(response.statusCode);
      print(id);
      if (response.statusCode == 200) {
        getAllFavorite.clear();

        await getFavorite();
        // await getDataSuggest();
        emit(SuuccessAddFavorite());
      }
    } catch (e) {

      print(e.toString());
      emit(ErrorFavorite(error: e.toString()));
    }
  }

  List<GetPostDataUser> getAllFavorite = [];

  Future<void> getFavorite() async {

    // emit(LoadingGetFavorite());
    try {
      http.Response response = await http.get(
          Uri.parse("http://sakenyapi.runasp.net/api/Faviourate/favorites"),
          headers: {
            "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        getAllFavorite.clear();

        for (var item in responseBody) {
          getAllFavorite.add(GetPostDataUser.fromJson(item));
        }
        print("the length of favorite is${getAllFavorite.length}");
        emit(SuccessGetFavorite());
      }
    } catch (e) {
      emit(ErrorGetFavorite(error: e.toString()));
    }
  }

  Future<void> deleteFavorite(num id) async {
    getAllFavorite.clear();
    emit(LoadingDelete());
    try {
      http.Response response = await http.delete(
          Uri.parse("http://sakenyapi.runasp.net/api/Faviourate/$id/favorite"),
          headers: {
            "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
            'Content-Type': 'application/json',
          });
      if (response.statusCode == 204) {
        print(response.statusCode);
        await getFavorite();

        emit(SuccessDelete());
      } else {
        print("the response is ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorDeleteFavorite(error: e.toString()));
    }
  }
}
