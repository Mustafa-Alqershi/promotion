import 'package:flutter/material.dart';
class MediumText extends StatelessWidget {
  String text;
  Color color=Colors.black;
  MediumText({Key? key,required this.text,Color? color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text('$text',style: TextStyle(fontFamily: 'NotoKufiArabic',fontSize: 18,fontWeight: FontWeight.normal,color:color),overflow: TextOverflow.ellipsis,softWrap: false,textAlign: TextAlign.right,);
  }
}
