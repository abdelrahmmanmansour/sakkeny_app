import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_state.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/post_details_screens/ai_suggest_cubit.dart';
import 'package:sakeny/screens/postdetails1.dart';

class AiSuggest extends StatefulWidget {
  AiSuggest({
    super.key,
    required this.value,
    required this.data,
  });

  bool value;
  String data;


  @override
  State<AiSuggest> createState() => _AiSuggestState();
}

class _AiSuggestState extends State<AiSuggest> {
  List<String> selectList = [
    "الاسكندريه ",
    "القاهره",
    "الجيزه",
    "الاقصر ",
  ];
  List<String> selectListRegion = [
    "مطروح",
    "الدقهليه",
    "كفر الشيخ",
    "الغربية",
    "المنوفية",
    "دمياط"
  ];

  String selectedValue = "اختار المدينه";

  TextEditingController selectCity = TextEditingController();
  TextEditingController selectRegion = TextEditingController();
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios)),
        title: const Text(
          "ادخل المعلومات ",
          style: TextStyle(
            fontFamily: "Marhey",
            fontSize: 16,
            fontWeight: FontWeight.w900,
            height: 2,
            letterSpacing: 0.23,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TestCubit, UploadDataState>(
        listener: (context, state) {
          if (state is SuccessGetSuggestAi) {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return Post(value: widget.value, data: widget.data);
              },
            ));
          }
        },
        builder: (context, state) {
          var cubit = TestCubit.get(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  "من فضلك اختار المعلومات لتساعدنا على اختيار افضل سعر 😊",
                  style: TextStyle(
                    fontFamily: "Marhey",
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    height: 2,
                    letterSpacing: 0.23,
                    color: Colors.black,
                  ),
                ),
              ),
              DefaultDropdown(
                  hintText: "اختيار البلد",
                  errorMassage: "من فضلك اختار البلد",
                  controllerName: selectCity,
                  listName: selectList,
                  onChanged: (value) {
                    selectCity.text = value!;
                  }),
              DefaultDropdown(
                  hintText: "اختيار المنطقه",
                  errorMassage: "من فضلك اختار المنطقه",
                  controllerName: cubit.selectCity,
                  listName: selectListRegion,
                  onChanged: (value) {
                    cubit.selectCity.text = value!;
                  }),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: CheckboxListTile(
                  activeColor:const Color(0xFF89ADA3),

                  title: const Text(
                    "مجهزه",
                    style: TextStyle(
                      fontFamily: "Marhey",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      height: 2,
                      letterSpacing: 0.23,
                      color: Colors.black,
                    ),
                  ),
                  value: checkbox1,
                  onChanged: (value) {
                    setState(() {
                      checkbox1 = !checkbox1;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: CheckboxListTile(
                  activeColor:const Color(0xFF89ADA3),

                  title: const Text(
                    "للإيجار",
                    style: TextStyle(
                      fontFamily: "Marhey",
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      height: 2,
                      letterSpacing: 0.23,
                      color: Colors.black,
                    ),
                  ),
                  value: checkbox3,
                  onChanged: (value) {
                    setState(() {
                      checkbox3 = !checkbox3;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: CastomButton(
                  onTap: () {
                    TestCubit.get(context).getSuggest(
                      postArea: int.parse(cubit.PostArea.text),
                        postBathrooms:int.parse(cubit.PostBathrooms.text) ,
                        postBedrooms: int.parse(cubit.PostBedrooms.text),
                        postKitchens: int.parse(cubit.PostKitchens.text),
                        apartment:widget.data,
                        region: selectRegion.text,
                        city: selectCity.text,
                        furnished: checkbox2,
                        house_Type: checkbox2);
                  },
                  text:state is LoadingGetSuggestAi ?"تحميل .....": "التالى "
                ),
              )
            ],
          );
        },
      ),
    );
  }

  String? selectedItem;

  Widget DefaultDropdown(
          {required List<String> listName,
          required void Function(String?) onChanged,
          required String errorMassage,
          required TextEditingController controllerName,
          required String hintText}) =>
      Container(
        margin: const EdgeInsets.all(20),
        height: 46,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ]),
        child: Center(
            child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: const InputDecoration(border: InputBorder.none),
          hint: Text(
            hintText,
            style: const TextStyle(
              fontFamily: "Marhey",
              fontSize: 16,
              fontWeight: FontWeight.w900,
              height: 2,
              letterSpacing: 0.23,
              color: Colors.black,
            ),
          ),
          items: listName
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return errorMassage;
            }
            return null;
          },
          onChanged: onChanged,
          onSaved: (value) {
            controllerName.text = value.toString();
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 20,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 250,
            isOverButton: false,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        )),
      );
}
