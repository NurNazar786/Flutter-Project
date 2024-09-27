
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {

    return RichText(
      textAlign: TextAlign.center,

      text: const TextSpan(
            text: 'Dynamic',
            style: TextStyle(color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w600),

        children: [
       TextSpan(
      text: ' Wallpaper',
          style: TextStyle(color: Colors.orangeAccent,
              fontSize: 22,
              fontWeight: FontWeight.w600),
       )
        ]
      ),

    );
     }

}