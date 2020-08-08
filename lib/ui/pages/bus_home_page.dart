import 'package:boring_flutter_app/ui/pages/bus_details_map_page.dart';
import 'package:boring_flutter_app/ui/pages/bus_nearby_page.dart';
import 'package:boring_flutter_app/ui/pages/bus_routes_page.dart';
import 'package:flutter/material.dart';
import '../../data/model/api_result_bus_routes_model.dart';
import '../../bloc/bus/bus_bloc.dart';
import '../../bloc/bus/bus_state.dart';
import 'package:boring_flutter_app/bloc/bus/bus_event.dart';
import '../../bloc/bus/bus_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';
import 'dart:collection';

class BusHomePage extends StatefulWidget {
  @override
  _BusHomePageState createState() => _BusHomePageState();
}

class _BusHomePageState extends State<BusHomePage> {
  BusBloc busBloc;
  int _currentIndex = 0;
  final List<Widget> _children = [
    BusNearByPage(),
    BusRoutePage()
    
  ];
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(
      builder: (context) {
        return Material(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Bus Routes"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: () {
                    busBloc = BlocProvider.of<BusBloc>(context);
                    busBloc.add(FetchAllBussByCompanyEvent());
                  },
                )
              ],
            ),
            body: _children[_currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 0, // this will be set when a new tab is tapped
              onTap: onTabTapped,
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.pin_drop),
                  title: new Text('NearBy'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.stop),
                  title: new Text('Bus Route Info'),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
  void onTabTapped(int index) {
   setState(() {
     _currentIndex = index;
   });
 }
}

