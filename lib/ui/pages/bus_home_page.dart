import 'package:boring_flutter_app/ui/pages/bus_nearby_page.dart';
import 'package:boring_flutter_app/ui/pages/bus_routes_page.dart';
import 'package:flutter/material.dart';
import '../../bloc/bus/bus_bloc.dart';
import '../../bloc/bus/bus_info_bloc.dart';
import 'package:boring_flutter_app/bloc/bus/bus_event.dart';
import '../../bloc/bus/bus_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/bus_repository.dart';

class BusHomePage extends StatefulWidget {
  @override
  _BusHomePageState createState() => _BusHomePageState();
}

class _BusHomePageState extends State<BusHomePage> {
  BusBloc busBloc;
  int _currentIndex = 0;
  final myController = TextEditingController();
  final List<Widget> _children = [BusNearByPage(), BusRoutePage()];

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
                    //busBloc = BlocProvider.of<BusBloc>(context);
                    //busBloc.add(FetchAllBussByCompanyEvent());
                  },
                )
              ],
            ),
            body: mainContainer(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex == 0
                  ? 0
                  : 1, // this will be set when a new tab is tapped
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

  

  Widget mainContainer() {

    return this._currentIndex == 0
        ? BlocProvider(
            create: (context) => BusBloc(repository: BusRepositoryImpl()),
            child: _children[_currentIndex],
          )
        : BlocProvider(
            create: (context) => BusInfoBloc(repository: BusRepositoryImpl()),
            child: _children[_currentIndex],
          );
  }
}
