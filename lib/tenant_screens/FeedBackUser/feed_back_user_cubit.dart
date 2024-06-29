import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/tenant_screens/Model/FeedBackUser.dart';
part 'feed_back_user_state.dart';

class FeedBackUserCubit extends Cubit<FeedBackUserState> {
  FeedBackUserCubit() : super(FeedBackUserInitial());
  static FeedBackUserCubit get(context)=>BlocProvider.of(context);
  Future<void> postFeedBack({required String messages,required String name}) async {
    try {
      final message = jsonEncode({
        "FeedbackText": messages
      });

      final headers = {
        'Content-Type': 'application/json',
        'Content-Length': message.length.toString(),
        'Authorization': 'Bearer ${CacheHelper.getData(key: "retToken")}',
      };

      final response = await http.post(
        Uri.parse("http://sakenyapi.runasp.net/api/userfeedback?name=$name"),
        body: message,
        headers: headers,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        await getFeedBack(name: name);
        emit(SuccessPostFeedBackUser());
      } else {
        // التعامل مع حالة الخطأ غير 200
        print('Failed to post chat: ${response.body}');
        emit(ErrorPostFeedBackUser(error: 'Failed to post chat: ${response.body}'));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorPostFeedBackUser(error: e.toString()));
    }
  }
  List<FeedBackUser> getFeedBackUser=[];
  Future<void> getFeedBack({required String name}) async {
    getFeedBackUser.clear();

    try {
      http.Response response = await http.get(
          Uri.parse(
              "http://sakenyapi.runasp.net/api/userfeedbacks?name=$name"),
          headers: {
            "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
            'Content-Type': 'application/json',
          });
      print("the FeedBack is${getFeedBackUser.length}");
      print("the feedBackResponse is ${response.statusCode}");
      if(response.statusCode==200){
        var responseBody=jsonDecode(response.body);
        for (var item in  responseBody){
          getFeedBackUser.add(FeedBackUser.fromJson(item));
        }
        print(getFeedBackUser.length);
        emit(SuccessGetFeedBackUser());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetFeedBackUser(error: e.toString()));
    }
  }
}
