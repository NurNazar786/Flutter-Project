
import 'package:flutter/material.dart';
import 'package:live_wallpaper/views/search_screen.dart';

class CustomSearchBar extends StatefulWidget{


  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  var emailText = TextEditingController();

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color:const Color.fromARGB(66, 192, 192, 192),
        border: Border.all(color: const Color.fromARGB(33, 192, 192, 192)),
          borderRadius: BorderRadius.circular(10)
      ),

      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search Wallpapers',
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
              )
              ,cursorColor: Colors.black87,

            ),
          ),

          InkWell(
             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen(query: _searchController.text)));
             },
              child: const Icon(Icons.search)),
        ],
      ),
    );
  }
}