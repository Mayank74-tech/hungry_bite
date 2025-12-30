import 'package:flutter/material.dart';

import '../common/color_extension.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool isSelected;
  final String icon;


  const TabButton({super.key, required this.onTap, required this.title, required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(icon,width: 20,height: 20,color: isSelected?TColor.primary:TColor.placeholder,),
        SizedBox(width: 20,),
        Text(title,style: TextStyle(color:isSelected? TColor.primary :TColor.placeholder,fontSize: 15,fontWeight: FontWeight.w500))
        ] ));
  }
}
