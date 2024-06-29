import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart'as http;
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/Data/Model/GetPostDataUser.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context)=>BlocProvider.of(context);
  List<GetPostDataUser> getData=[];
void searchDataPost() async{
  try{
    http.Response response=await http.get(Uri.parse("http://sakenyapi.runasp.net/api/Posts/search?bedrooms=2"),  headers: {
      "Authorization": "Bearer ${CacheHelper.getData(key: "retToken")}",
      'Content-Type': 'application/json',
    });
    print(response.statusCode);
    if(response.statusCode==200){
      var responseBody=jsonDecode(response.body);
    for(var item in responseBody){
      getData.add(GetPostDataUser.fromJson(item));
    }
      emit(SuccessSearch());
    }
  }catch(e){
    emit(ErrorSearch(error: e.toString()));
  }
 }


}
