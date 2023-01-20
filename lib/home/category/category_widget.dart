import 'package:flutter/material.dart';

import 'categories.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;

  CategoryWidget({required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(18),
          topRight: const Radius.circular(18),
          bottomLeft: Radius.circular(index.isEven? 18 : 0),
          bottomRight:Radius.circular(index.isOdd? 18 : 0)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
            height: 120,
            fit: BoxFit.fitHeight,
          ),
          Text(
            category.title,
            style: const TextStyle(fontSize: 22, color: Colors.white),
          )
        ],
      ),
    );
  }
}
