import 'package:flutter/material.dart';

import '../../api/model/sources_response.dart';

class SourceTab extends StatelessWidget {
  Source source;
  bool selected;

  SourceTab({required this.source, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.green, width: 2),
        color: (selected) ? Colors.green : Colors.transparent,
      ),
      child: Text(
        source.name ?? '',
        style: TextStyle(color: (selected) ? Colors.white : Colors.green),
      ),
    );
  }
}
