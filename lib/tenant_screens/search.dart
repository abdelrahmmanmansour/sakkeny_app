import 'package:flutter/material.dart';
import 'package:sakeny/castom/button.dart';
import 'package:sakeny/costant.dart';
import 'package:sakeny/tenant_screens/SearchResult.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int type = 0;
  double maxprice = 0;
  double minprice = 0;
  var priceRange = const RangeValues(500, 10000);
  int numbedroom = 0;
  int numbathroom = 0;
  double maxspace = 0;
  double minspace = 0;
  var spaceRange = const RangeValues(4, 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
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
                size: 33,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 9),
                height: 53,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side:
                        const BorderSide(width: 0.50, color: Color(0xFFD0D0D0)),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: TextField(
                  textAlign: TextAlign.right,
                  onTap: () {},
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      padding: const EdgeInsets.only(bottom: 7),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_rounded,
                        color: orange,
                        size: 25,
                      ),
                    ),
                    hintText: "ابحث عن حي ، شارع ، اشخاص",
                    hintStyle: const TextStyle(
                      color: Color(0x8e808080),
                      fontSize: 13,
                      fontFamily: primFont,
                      fontWeight: FontWeight.w300,
                      height: 0,
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = 1;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color:
                            type == 1 ? Color(0xFFF8F2E9) : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: type == 1
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'استديو',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = 2;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color:
                            type == 2 ? Color(0xFFF8F2E9) : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: type == 2
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'دوبلكس',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = 3;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color:
                            type == 3 ? Color(0xFFF8F2E9) : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: type == 3
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'غرفة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        type = 4;
                      });
                    },
                    child: Container(
                      width: 60,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color:
                            type == 4 ? Color(0xFFF8F2E9) : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: type == 4
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        'شقة',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'نطاق السعر',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: '  ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'ج.م',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 37,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD0D0D0)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'من',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 12,
                              fontFamily: 'Marhey',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: '$minprice',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Marhey',
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 37,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD0D0D0)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'الى',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 12,
                              fontFamily: 'Marhey',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: '$maxprice',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Marhey',
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              RangeSlider(
                values: priceRange,
                min: 500,
                max: 10000,
                divisions: 1000,
                activeColor: minprice == 0 ? const Color(0xFF858585) : orange,
                inactiveColor: minprice == 0 ? const Color(0xFF858585) : orange,
                onChanged: (RangeValues newRange) {
                  setState(() {
                    priceRange = newRange;
                    maxprice = priceRange.end;
                    minprice = priceRange.start;
                  });
                },
              ),
              const Text(
                'غرف النوم',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Marhey',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 6;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 6
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 6
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '+6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 5;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 5
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 5
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 4;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 4
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 4
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 3;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 3
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 3
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 2;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 2
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 2
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbedroom = 1;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbedroom == 1
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbedroom == 1
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'الحمامات',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Marhey',
                  fontWeight: FontWeight.w300,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 6;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 6
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 6
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '+6',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 5;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 5
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 5
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '5',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 4;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 4
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 4
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '4',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 3;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 3
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 3
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '3',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 2;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 2
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 2
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '2',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        numbathroom = 1;
                      });
                    },
                    child: Container(
                      width: 40,
                      height: 37,
                      padding: const EdgeInsets.all(8),
                      decoration: ShapeDecoration(
                        color: numbathroom == 1
                            ? Color(0xFFF8F2E9)
                            : Color(0x3F808080),
                        shape: RoundedRectangleBorder(
                          side: numbathroom == 1
                              ? BorderSide(width: 1, color: Color(0xFFFF8C40))
                              : BorderSide(width: 0, color: Color(0x3F808080)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        '1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF858585),
                          fontSize: 12,
                          fontFamily: 'Marhey',
                          fontWeight: FontWeight.w300,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'نطاق المساحة',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: ' ',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 16,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                    TextSpan(
                      text: 'متر مربع',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontFamily: 'Marhey',
                        fontWeight: FontWeight.w300,
                        height: 0,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 37,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD0D0D0)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'من',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 12,
                              fontFamily: 'Marhey',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: '$minspace',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Marhey',
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 100,
                    height: 37,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xFFD0D0D0)),
                        borderRadius: BorderRadius.circular(9),
                      ),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: 'الى',
                            style: TextStyle(
                              color: Color(0xFF858585),
                              fontSize: 12,
                              fontFamily: 'Marhey',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const TextSpan(
                            text: '  ',
                          ),
                          TextSpan(
                            text: '$maxspace',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Marhey',
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 6,
              ),
              RangeSlider(
                values: spaceRange,
                min: 4,
                max: 1000,
                divisions: 500,
                activeColor: minspace == 0 ? const Color(0xFF858585) : orange,
                inactiveColor: minspace == 0 ? const Color(0xFF858585) : orange,
                onChanged: (RangeValues newRange) {
                  setState(() {
                    spaceRange = newRange;
                    minspace = spaceRange.start;
                    maxspace = spaceRange.end;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Container(
                    width: 160,
                    height: 40.44,
                    child: CastomButton3(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SearchResult();
                        },));
                      },
                      text: "عرض النتائج",
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 160,
                    height: 40.44,
                    child: CastomButton(
                      onTap: () {
                        setState(() {
                          minprice = 0;
                          maxprice = 0;
                          maxspace = 0;
                          minspace = 0;

                          numbathroom = 0;
                          numbedroom = 0;
                          type = 0;
                        });
                      },
                      text: "حذف التحديد",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
