import 'package:flutter/material.dart';
import 'my_colors.dart';
import 'my_text_style.dart';

class MyButtons{
 static MaterialButton buildMaterialButton({
  required String buttonName,
   required VoidCallback onTap,
  })
 {
   return MaterialButton(
       onPressed: onTap,
       splashColor: MyColors.lawGreen,
       padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
    shape: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    hoverColor: MyColors.aqua,
    elevation: 7,
     height: 46,
    minWidth: 130,
    focusElevation: 12,
    child: Text(
    buttonName,
    style: MyTextStyle.headerTextStyle(color: Colors.black),
    ),
   );
 }
    }

