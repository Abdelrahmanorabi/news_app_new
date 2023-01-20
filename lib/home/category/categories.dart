import 'package:flutter/material.dart';
import 'category_widget.dart';

class CategoriesFragment extends StatelessWidget {
  Function onCategoryClick;
  List<Category> categories = Category.getAllCategories();
  CategoriesFragment({required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Pick your Category \n of interest',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (buildContext, index) {
                    return InkWell(
                      onTap: (){
                        onCategoryClick(categories[index]);
                      },
                      child: CategoryWidget(
                        category: categories[index],
                        index: index,
                      ),
                    );
                  }),
            )
          ],
        ),

    );
  }
}

class Category {
  String id;
  String title;
  String imageName;
  Color color;

  Category(
      {required this.id,
      required this.title,
      required this.color,
      required this.imageName});

  static List<Category> getAllCategories() {
    return [
      Category(
          id: 'sports',
          title: 'Sports',
          color: const Color(0xFFC91C22),
          imageName: 'sports'),
      Category(
          id: 'general',
          title: 'General',
          color: const Color(0xFF003E90),
          imageName: 'general'),
      Category(
          id: 'health',
          title: 'Health',
          color: const Color(0xFFED1E79),
          imageName: 'health'),
      Category(
          id: 'business',
          title: 'Business',
          color: const Color(0xFFCF7E48),
          imageName: 'business'),
      Category(
          id: 'technology',
          title: 'Technology',
          color: const Color(0xFF4882CF),
          imageName: 'technology'),
      Category(
          id: 'science',
          title: 'Environment',
          color: const Color(0xFFF2D352),
          imageName: 'science'),
    ];
  }
}

/*
* */