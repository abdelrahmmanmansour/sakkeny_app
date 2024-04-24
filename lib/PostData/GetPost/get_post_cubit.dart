import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sakeny/Data/Model/GetPostDataUser.dart';

part 'get_post_state.dart';

class GetPostCubit extends Cubit<GetPostState> {
  GetPostCubit() : super(GetPostInitial());

  static GetPostCubit get(context) => BlocProvider.of(context);
List<GetPostDataUser> getDataList=[];
  void getDataPost() async {
 try{
   getDataList.clear();
   http.Response response = await http
       .get(Uri.parse("http://sakenyapi.runasp.net/api/Posts/user/10"));
   if(response.statusCode==200){
     var responseBody=jsonDecode(response.body);
     for(var item in responseBody){
       getDataList.add(GetPostDataUser.fromJson(item));

     }
     emit(SuccessGetUserData());
   }
 }catch(e){
   emit(ErrorGetPost(error:e.toString()));
 }
  }
}
