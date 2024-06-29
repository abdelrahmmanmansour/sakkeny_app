import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Model/UserModel.dart';
import 'package:sakeny/tenant_screens/Model/chatmodel.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);
  List<UserModel> getUser = [];

  void getAllUser() async {
    getUser.clear();
    emit(LoadingGetUserChat());
    try {
      http.Response response = await http
          .get(Uri.parse("http://sakenyapi.runasp.net/api/users"), headers: {
        "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        for (var item in responseBody) {
          getUser.add(UserModel.fromJson(item));
        }
        emit(SuccessGetUserChat());
      }
    } catch (e) {
      emit(ErrorGetUserChat());
    }
  }



  Future<void> postChat({required String messages,required String name,required int id}) async {
    try {
      final message = jsonEncode({
        "message": messages
      });

      final headers = {
        'Content-Type': 'application/json',
        'Content-Length': message.length.toString(),
        'Authorization': 'Bearer ${CacheHelper.getData(key: "retToken")}',
      };

      final response = await http.post(
        Uri.parse("http://sakenyapi.runasp.net/api/users/$id/chats?SearchQuery=$name"),
        body: message,
        headers: headers,
      );

      print(response.statusCode);

      if (response.statusCode == 200) {
        await getChat(id: id,name: name);
        emit(SuccessPostChat());
      } else {
        // التعامل مع حالة الخطأ غير 200
        print('Failed to post chat: ${response.body}');
        emit(ErrorPostChat(error: 'Failed to post chat: ${response.body}'));
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorPostChat(error: e.toString()));
    }
  }
  List<Chatmodel> getMessage=[];
  Future<void> getChat({required String name,required int id}) async {
    getMessage.clear();

    try {
      http.Response response = await http.get(
          Uri.parse(
              "http://sakenyapi.runasp.net/api/users/$id/chats?SearchQuery=$name"),
          headers: {
            "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
            'Content-Type': 'application/json',
          });
      print("the getMessage is${getMessage.length}");
      if(response.statusCode==200){
        var responseBody=jsonDecode(response.body);
        for (var item in  responseBody){
          getMessage.add(Chatmodel.fromJson(item));
        }
        print(getMessage.length);
        emit(SuccessGetChat());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorGetChat(error: e.toString()));
    }
  }
}
