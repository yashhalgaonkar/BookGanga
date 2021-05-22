import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MyErrorWidget extends StatelessWidget {
  final String errorMessage;
  final Function onRefresh;

  MyErrorWidget({
    this.errorMessage,
   @required this.onRefresh,
  });
  @override
  Widget build(BuildContext context) {
   return Center(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              Ionicons.reload,
            ),
            onPressed: onRefresh,
          ),
          Text(errorMessage),
        ],
      ),
    );
  }
}
