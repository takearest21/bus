import 'package:boring_flutter_app/ui/pages/bus_nearby_page.dart';
import 'package:boring_flutter_app/ui/pages/bus_routes_page.dart';
import 'package:flutter/material.dart';
import '../../bloc/bus/bus_bloc.dart';
import 'package:boring_flutter_app/bloc/bus/bus_event.dart';
import '../../bloc/bus/bus_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BusHomePage extends StatefulWidget {
  @override
  _BusHomePageState createState() => _BusHomePageState();
}

class _BusHomePageState extends State<BusHomePage> {
  BusBloc busBloc;
  int _currentIndex = 0;
  final List<Widget> _children = [BusNearByPage(), BusRoutePage()];
  @override
  void initState() {
    super.initState();
  }
    String dropdownValue = 'All';

    Widget selectCmpany() {
      return DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['All','City Bus', 'KWB']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      );
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
              currentIndex: _currentIndex==0?0:1, // this will be set when a new tab is tapped
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                        title: selectCmpany(),
                        content: Row(
                          children: [
                            Text('輸入巴士嘅Number'),
                            FlatButton(onPressed: null, child: Text("Search"))
                          ],
                        )));
              },
              child: Icon(Icons.search),
              backgroundColor: Colors.orange,
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

