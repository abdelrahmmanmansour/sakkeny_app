import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Core/Constant/Constant.dart';
import 'package:sakeny/castom/tenant_post.dart';
import 'package:sakeny/tenant_screens/Search/search_cubit.dart';
import 'package:sakeny/tenant_screens/tenant_view_post.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
SearchCubit.get(context).searchDataPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("النتائج"),
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubitResult=SearchCubit.get(context);
    return ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount:cubitResult.getData.length ,
            itemBuilder: (context, index) {
            return Post(
              nameText: "postOwnerName",
              ontap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return TenantViewPost(getPostDataUser: cubitResult.getData[index]);
                },));
              },
              colorFavorite: cubitResult.getData[index].isFavourited==true?Colors.red:Colors.grey,
              onPress: () {
                // GetPostCubit.get(context).getDataSuggest();


              },
              // image: Constant.photo,
              image:cubitResult.getData[index].postPicTbls?[0]!=null?cubitResult.getData[index].postPicTbls![0].pictureString.toString():Constant.photo2,
              // image: "assets/images/onboarding one.png",
              price:cubitResult.getData[index].postPriceDisplay
                  .toString(),

              location: "المنصورة ، حي الجامعة",
              description:
              " حمام ${ cubitResult.getData[index].postBathrooms } غرف نوم 2 150م",
            );
          },)
        ],
      );
  },
),
    );
  }
}
