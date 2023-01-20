import 'package:flutter/material.dart';

class HomeSideMenu extends StatelessWidget {
  Function onItemClick;
  static const String CATEGORY = 'categories';
  static const String SETTINGS = 'settings';

  HomeSideMenu({required this.onItemClick});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Theme
              .of(context)
              .primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 64),
          alignment: Alignment.center,
          child: const Text(
            'News App',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
        ),
        InkWell(
          onTap: (){
            onItemClick(CATEGORY);
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset('assets/images/ic_categories.jpg'),
                const SizedBox(width: 20,),
                const Text('Categories', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){
            onItemClick(SETTINGS);
          },
          child: Padding(padding: const EdgeInsets.all(20), child: Row(
            children: [
              Image.asset('assets/images/ic_setting.jpg'),
              const SizedBox(width: 20,),
              const Text('Settings', style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),),
            ],
          ),),
        )
      ],
    );
  }
}
