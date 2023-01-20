import 'package:flutter/material.dart';
import 'package:news_app_new/api/api_manager.dart';
import 'package:news_app_new/home/news/news_widget.dart';

import '../../api/model/news_response.dart';


class SearchScreen extends StatefulWidget {
  static const String routeName = 'SEARCH_SCREEN';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  /*=================[Variables]===================*/
  List<News> newsList = [];
  String query = '';

  /*================================================*/
  List<News> search() {
    ApiManager.getNewsBySourceId(query: query)
    .then((newsResponse) {newsList = newsResponse.newsList ?? [];})
    .catchError((error) {print('error during search!!$error');});
    return newsList;
  }

  /*================================================*/
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 30, right: 30, top: 10, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none),
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide.none),
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              size: 30,
                            )),
                        prefixIcon: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.clear,
                              size: 30,
                            )),
                      ),
                      onChanged: ( String? value) {
                        setState(() {
                          query = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: search().length,
                      itemBuilder: (buildContext, index) {
                        return NewsWidget(search()[index]);
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
