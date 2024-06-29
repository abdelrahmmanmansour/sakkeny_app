// import 'package:flutter/material.dart';
// import 'package:sakeny/Core/Services/CachedHelper.dart';
// import 'package:sakeny/castom/button.dart';
// import 'package:sakeny/castom/text_filed.dart';
// import 'package:sakeny/checkbox_state/checkbox_state.dart';
// import 'package:sakeny/costant.dart';
//
// class BenefitsAndSecrvises extends StatefulWidget {
//   const BenefitsAndSecrvises({super.key});
//
//   @override
//   State<BenefitsAndSecrvises> createState() => _BenefitsAndSecrvisesState();
// }
//
// class _BenefitsAndSecrvisesState extends State<BenefitsAndSecrvises> {
//   bool value = false;
//   final allbenefits = CheckBoxState(title: 'تحديد الكل');
//   final nobenefits = CheckBoxState(title: 'الغاء تحديد الكل');
//
//   final benefits = [
//     CheckBoxState(title: 'اجهزة مطبخ مدمجة'),
//     CheckBoxState(title: 'مصعد'),
//     CheckBoxState(title: 'شرفة او تراس'),
//     CheckBoxState(title: 'خدمة wifi'),
//     CheckBoxState(title: 'عداد مياه'),
//     CheckBoxState(title: 'غاز طبيعي'),
//     CheckBoxState(title: 'خط ارضي'),
//     CheckBoxState(title: 'عداد كهرباء'),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: null,
//         backgroundColor: Colors.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const ImageIcon(
//                 AssetImage("assets/images/Arrow - Right Square.png"),
//                 color: orange,
//                 size: 30,
//               ),
//             ),
//           ),
//         ],
//         title: const Align(
//           alignment: Alignment.topRight,
//           child: Text(
//             'المزايا والخدمات ',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontFamily: primFont,
//               fontWeight: FontWeight.w400,
//               height: 0,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Flexible(child: buildNoGropCheckBox(nobenefits)),
//                   Flexible(child: buildGropCheckBox(allbenefits)),
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 5, right: 5),
//                 child: Divider(thickness: 1, color: Color(0xFFD0D0D0)),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: benefits.length,
//                     itemBuilder: (context, index) {
//                       return  buildSingleCheckBox(benefits[index]
//
//                       );
//                       CacheHelper.saveData(key: "feature", value: value)
//
//                     }),
//               ),
//               Row(
//                 children: [
//                   Flexible(
//                       child: Container(
//                     width: double.infinity,
//                     height: 46,
//                     decoration: ShapeDecoration(
//                       color: Colors.white,
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                     ),
//                     child: TextField(
//                       textAlign: TextAlign.right,
//                       onChanged: (data) {},
//                       style: const TextStyle(color: Colors.black),
//                       decoration: const InputDecoration(
//                         suffixIcon: Icon(
//                           Icons.add,
//                           color: Color(0xFF858585),
//                         ),
//                         hintText: "اضافه المزيد",
//                         hintStyle: TextStyle(
//                           color: Color(0xFF858585),
//                           fontSize: 15,
//                           fontFamily: primFont,
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white)),
//                         border: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ))
//                 ],
//               ),
//               CastomButton(
//                 onTap: () {
//                   Navigator.pop(context);
//
//                 },
//                 text: "التالى",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildSingleCheckBox(CheckBoxState checkbox) => CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.leading,
//       activeColor: orange,
//       value: checkbox.value,
//       title: Text(
//         checkbox.title,
//         textAlign: TextAlign.right,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontFamily: primFont,
//           fontWeight: FontWeight.w300,
//           height: 0,
//         ),
//       ),
//       onChanged: (value) {
//         setState(() {
//           checkbox.value = value!;
//           allbenefits.value = benefits.every((benefit) => benefit.value);
//           if (value == true) {
//             nobenefits.value = false;
//           }
//         });
//       });
//   Widget buildGropCheckBox(CheckBoxState checkbox) => ListTileTheme(
//       horizontalTitleGap: 0,
//       child: CheckboxListTile(
//           controlAffinity: ListTileControlAffinity.platform,
//           activeColor: orange,
//           value: checkbox.value,
//           title: Text(
//             checkbox.title,
//             textAlign: TextAlign.right,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//               fontFamily: primFont,
//               fontWeight: FontWeight.w300,
//               height: 0,
//             ),
//           ),
//           onChanged: toggleGropCheckBox));
//
//   void toggleGropCheckBox(bool? value) {
//     if (value == null) return;
//     setState(() {
//       allbenefits.value = value;
//       nobenefits.value = !value;
//       benefits.forEach((benefit) => benefit.value = value);
//     });
//   }
//
//   Widget buildNoGropCheckBox(CheckBoxState checkbox) => ListTileTheme(
//       horizontalTitleGap: 0,
//       child: CheckboxListTile(
//           controlAffinity: ListTileControlAffinity.platform,
//           activeColor: orange,
//           value: checkbox.value,
//           title: Text(
//             checkbox.title,
//             textAlign: TextAlign.right,
//             style: const TextStyle(
//               color: Colors.black,
//               fontSize: 14,
//               fontFamily: primFont,
//               fontWeight: FontWeight.w300,
//               height: 0,
//             ),
//           ),
//           onChanged: toggleNoGropCheckBox));
//
//   void toggleNoGropCheckBox(bool? value) {
//     if (value == null) return;
//     setState(() {
//       allbenefits.value = !value!;
//       nobenefits.value = value;
//       benefits.forEach((benefit) => benefit.value = false);
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:sakeny/Core/Services/CachedHelper.dart';
import 'package:sakeny/PostData/UpLoadData/upload_data_cubit.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/checkbox_state/checkbox_state.dart';
import 'package:sakeny/costant.dart';

// class BenefitsAndSecrvises extends StatefulWidget {
//   const BenefitsAndSecrvises({super.key});
//
//   @override
//   State<BenefitsAndSecrvises> createState() => _BenefitsAndSecrvisesState();
// }
//
// class _BenefitsAndSecrvisesState extends State<BenefitsAndSecrvises> {
//   final allbenefits = CheckBoxState(title: 'تحديد الكل');
//   final nobenefits = CheckBoxState(title: 'الغاء تحديد الكل');
//
//   final benefits = [
//     CheckBoxState(title: 'اجهزة مطبخ مدمجة'),
//     CheckBoxState(title: 'مصعد'),
//     CheckBoxState(title: 'شرفة او تراس'),
//     CheckBoxState(title: 'خدمة wifi'),
//     CheckBoxState(title: 'عداد مياه'),
//     CheckBoxState(title: 'غاز طبيعي'),
//     CheckBoxState(title: 'خط ارضي'),
//     CheckBoxState(title: 'عداد كهرباء'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         leading: null,
//         backgroundColor: Colors.white,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const ImageIcon(
//                 AssetImage("assets/images/Arrow - Right Square.png"),
//                 color: orange,
//                 size: 30,
//               ),
//             ),
//           ),
//         ],
//         title: const Align(
//           alignment: Alignment.topRight,
//           child: Text(
//             'المزايا والخدمات ',
//             style: TextStyle(
//               color: Colors.black,
//               fontSize: 16,
//               fontFamily: primFont,
//               fontWeight: FontWeight.w400,
//               height: 0,
//             ),
//           ),
//         ),
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Flexible(child: buildNoGropCheckBox(nobenefits)),
//                   Flexible(child: buildGropCheckBox(allbenefits)),
//                 ],
//               ),
//               const Padding(
//                 padding: EdgeInsets.only(left: 5, right: 5),
//                 child: Divider(thickness: 1, color: Color(0xFFD0D0D0)),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: benefits.length,
//                   itemBuilder: (context, index) {
//                     return buildSingleCheckBox(benefits[index], index);
//                   },
//                 ),
//               ),
//               Row(
//                 children: [
//                   Flexible(
//                     child: Container(
//                       width: double.infinity,
//                       height: 46,
//                       decoration: ShapeDecoration(
//                         color: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                       ),
//                       child: TextField(
//                         textAlign: TextAlign.right,
//                         onChanged: (data) {
//                           CacheHelper.saveData(key: "textFieldData", value: data);
//                         },
//                         style: const TextStyle(color: Colors.black),
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.add,
//                             color: Color(0xFF858585),
//                           ),
//                           hintText: "اضافه المزيد",
//                           hintStyle: TextStyle(
//                             color: Color(0xFF858585),
//                             fontSize: 15,
//                             fontFamily: primFont,
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                           ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               CastomButton(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 text: "التالى",
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildSingleCheckBox(CheckBoxState checkbox, int index) => CheckboxListTile(
//     controlAffinity: ListTileControlAffinity.leading,
//     activeColor: orange,
//     value: checkbox.value,
//     title: Text(
//       checkbox.title,
//       textAlign: TextAlign.right,
//       style: const TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontFamily: primFont,
//         fontWeight: FontWeight.w300,
//         height: 0,
//       ),
//     ),
//     onChanged: (value) {
//       setState(() {
//         checkbox.value = value!;
//         CacheHelper.saveData(key: "benefit_$index", value: value);
//         allbenefits.value = benefits.every((benefit) => benefit.value);
//         if (value == true) {
//           nobenefits.value = false;
//         }
//       });
//     },
//   );
//
//   Widget buildGropCheckBox(CheckBoxState checkbox) => ListTileTheme(
//     horizontalTitleGap: 0,
//     child: CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.platform,
//       activeColor: orange,
//       value: checkbox.value,
//       title: Text(
//         checkbox.title,
//         textAlign: TextAlign.right,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontFamily: primFont,
//           fontWeight: FontWeight.w300,
//           height: 0,
//         ),
//       ),
//       onChanged: (value) {
//         toggleGropCheckBox(value);
//       },
//     ),
//   );
//
//   void toggleGropCheckBox(bool? value) {
//     if (value == null) return;
//     setState(() {
//       allbenefits.value = value;
//       nobenefits.value = !value;
//       benefits.forEach((benefit) {
//         benefit.value = value;
//         CacheHelper.saveData(key: "benefit_${benefits.indexOf(benefit)}", value: value);
//       });
//     });
//   }
//
//   Widget buildNoGropCheckBox(CheckBoxState checkbox) => ListTileTheme(
//     horizontalTitleGap: 0,
//     child: CheckboxListTile(
//       controlAffinity: ListTileControlAffinity.platform,
//       activeColor: orange,
//       value: checkbox.value,
//       title: Text(
//         checkbox.title,
//         textAlign: TextAlign.right,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontFamily: primFont,
//           fontWeight: FontWeight.w300,
//           height: 0,
//         ),
//       ),
//       onChanged: (value) {
//         toggleNoGropCheckBox(value);
//       },
//     ),
//   );
//
//   void toggleNoGropCheckBox(bool? value) {
//     if (value == null) return;
//     setState(() {
//       allbenefits.value = !value!;
//       nobenefits.value = value;
//       benefits.forEach((benefit) {
//         benefit.value = false;
//         CacheHelper.saveData(key: "benefit_${benefits.indexOf(benefit)}", value: false);
//       });
//     });
//   }
// }
class BenefitsAndSecrvises extends StatefulWidget {
  @override
  _BenefitsAndSecrvisesState createState() => _BenefitsAndSecrvisesState();
}

class _BenefitsAndSecrvisesState extends State<BenefitsAndSecrvises> {
  final List<CheckBoxState> benefits = [
    CheckBoxState(title: 'اجهزة مطبخ مدمجة'),
    CheckBoxState(title: 'مصعد'),
    CheckBoxState(title: 'شرفة او تراس'),
    CheckBoxState(title: 'خدمة wifi'),
    CheckBoxState(title: 'عداد مياه'),
    CheckBoxState(title: 'غاز طبيعي'),
    CheckBoxState(title: 'خط ارضي'),
    CheckBoxState(title: 'عداد كهرباء'),
  ];

  void _submit() {
    List<CheckBoxState> selectedBenefits = benefits.where((benefit) => benefit.value).toList();
    TestCubit.get(context).updateBenefits(selectedBenefits);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        elevation: 0,
        leading: null,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const ImageIcon(
                AssetImage("assets/images/Arrow - Right Square.png"),
                color: orange,
                size: 30,
              ),
            ),
          ),
        ],
        title: const Align(
          alignment: Alignment.topRight,
          child: Text(
            'المزايا والخدمات ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: primFont,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: benefits.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CheckboxListTile(
                    activeColor:const Color(0xFF89ADA3),

                    title: Text(benefits[index].title),
                    value: benefits[index].value,
                    onChanged: (value) {
                      setState(() {
                        benefits[index].value = value!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CastomButton(
                  onTap: _submit,
                  text: "التالى",
                ),
          ),
          // ElevatedButton(
          //   onPressed: _submit,
          //   child: Text('التالي'),
          // ),
        ],
      ),
    );
  }
}
