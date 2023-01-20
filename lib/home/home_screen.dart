import 'package:flutter/material.dart';
import 'package:news_app_new/home/category/categories.dart';
import 'package:news_app_new/home/news/news_fragment.dart';
import 'package:news_app_new/home/news/search_screen.dart';
import 'package:news_app_new/home/settings/settings.dart';

import '../api/api_manager.dart';
import '../api/model/news_response.dart';
import 'home_side_menu.dart';
import 'news/news_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget? currentWidget;

  /*=================[Methods]===================*/
  void onSideMenuItemClick(String itemType) {
    if (itemType == HomeSideMenu.CATEGORY) {
      currentWidget = CategoriesFragment(onCategoryClick: onCategoryClick);
    } else if (itemType == HomeSideMenu.SETTINGS) {
      currentWidget = SettingsFragment();
    }
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryClick(Category category) {
    currentWidget = NewsFragment(category: category);
    setState(() {});
  }

  /*=============================================*/
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/bg.jpg',
              ))),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Route News App'),
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(35))),
            actions: [
              currentWidget == null
                  ? Container()
                  : IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                        // showSearch(context: context, delegate: NewsSearchDelegate());
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      icon: const Icon(
                        Icons.search,
                        size: 30,
                      ))
            ],
          ),
          drawer: Drawer(
            child: HomeSideMenu(
              onItemClick: onSideMenuItemClick,
            ),
          ),
          body: (currentWidget == null)
              ? CategoriesFragment(onCategoryClick: onCategoryClick)
              : currentWidget),
    );
  }
}




class NewsSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
            Icons.search,
            size: 30,
          )),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.clear,
          size: 30,
        ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
        future: ApiManager.getNewsBySourceId(query: query),
        builder: (buildContext, asyncSnapshot) {
          if (asyncSnapshot.hasError) {
            return Center(
              child: Text(asyncSnapshot.error.toString()),
            );
          } else if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var data = asyncSnapshot.data;
            if (data?.status == 'error') {
              // we got code and message from server
              return Center(child: Text('${data?.message}'));
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: data?.newsList?.length ?? 0,
                  itemBuilder: (buildContext, index) {
                    return NewsWidget((data?.newsList![index])!);
                  },
                ),
              );
            }
          }
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Your Suggestions here.....!!  '),
    );
  }


}
