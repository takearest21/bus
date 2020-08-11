import 'package:boring_flutter_app/bloc/bus/bus_bloc.dart';
import 'package:boring_flutter_app/bloc/bus/bus_info_bloc.dart';
import 'package:boring_flutter_app/ui/pages/bus_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './data/repository/bus_repository.dart';
import 'package:boring_flutter_app/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cricket',
      darkTheme: ThemeData.dark(),
      home: BusHomePage(),
      /*home: BlocProvider(
        create: (context) => BusInfoBloc(repository: BusRepositoryImpl()),
        child: BusHomePage(),
      ),*/
      //theme: ThemeData(textTheme: ThemeIos.themeAndroid),
    );
  }
}
