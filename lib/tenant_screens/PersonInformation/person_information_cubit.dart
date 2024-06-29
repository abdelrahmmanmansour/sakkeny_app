import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/tenant_screens/Model/MessgeModel.dart';

part 'person_information_state.dart';

class PersonInformationCubit extends Cubit<PersonInformationState> {
  PersonInformationCubit() : super(PersonInformationInitial());

  static PersonInformationCubit get(context) => BlocProvider.of(context);

  Future<void> sendMessage({
    required int postId,
    required String message,
  }) async {
    emit(LoadingPostMessage());
 try{
   http.Response response=  await http.post(
     Uri.parse("http://sakenyapi.runasp.net/api/PostsFeedback"),
     body: jsonEncode({"PostId": postId, "PostFeedText": message}),
     headers: {
       "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
       'Content-Type': 'application/json',


     }
   );
   print(response.statusCode);
   if(response.statusCode==201){
     print(jsonDecode(response.body));
     await getMessage(postId);
     emit(SuccessPostMessage());
   }
   else{
     print(response.statusCode);
   }
 }catch(e){
   print(e.toString());
   emit(ErrorPostMessage(error: e.toString()));
 }
  }

  List<MessgeModel> message = [];

  Future<void> getMessage(int postid) async {
    emit(LoadingGetMessage());
    message.clear();
    try {
      http.Response response = await http.get(
          Uri.parse("http://sakenyapi.runasp.net/api/PostsFeedback/post/${postid}"),
      headers: {
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
        'Content-Type': 'application/json',
      }
      );
      if(response.statusCode==200){
        var jsonBody=jsonDecode(response.body);
        for (var item in jsonBody){
          message.add(MessgeModel.fromJson(item));
        }
        print(message.length);

        emit(SuccessGetMessage());
      }
    } catch (e) {
      emit(ErrorGetMessage(error: e.toString()));

      }
    }
  }

