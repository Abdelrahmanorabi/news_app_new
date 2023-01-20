import 'package:flutter/material.dart';
import 'package:news_app_new/home/news/source_tab.dart';

import '../../api/model/sources_response.dart';
import 'news_list.dart';

class SourcesTabs extends StatefulWidget {
  List<Source> sources;

  SourcesTabs({required this.sources});

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              indicatorColor: Colors.transparent,
              onTap: (index) {
                selectedTab = index;
                setState(() {});
              },
              tabs: widget.sources.map((source) {
                bool isSelected = widget.sources.indexOf(source) == selectedTab;
                return SourceTab(
                  source: source,
                  selected: isSelected,
                );
              }).toList()),
          NewsList(
            source: widget.sources[selectedTab],
          ),
        ],
      ),
    );
  }
}
