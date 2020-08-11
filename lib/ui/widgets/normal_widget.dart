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
          "ERROR 404 NOT FOUND THE BUS",
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
