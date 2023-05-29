import 'package:flutter/material.dart';
class SmallText extends StatelessWidget {
  String text;
 Color color = Colors.black ;
  SmallText({Key? key,required this.text,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text('$text',style: TextStyle(fontFamily: 'NotoKufiArabic',fontSize: 14,color: color ,fontWeight: FontWeight.normal),);
  }
}
