import 'package:flutter/material.dart';

class Widgets {
  static Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
