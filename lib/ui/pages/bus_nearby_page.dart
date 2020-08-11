import 'package:boring_flutter_app/ui/pages/bus_details_map_page.dart';
import 'package:flutter/material.dart';
import '../../bloc/bus/bus_bloc.dart';
import '../../bloc/bus/bus_state.dart';
import 'package:boring_flutter_app/bloc/bus/bus_event.dart';
import '../../bloc/bus/bus_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';
import '../widgets/normal_widget.dart';

import 'package:boring_flutter_app/bloc/bus/bus_bloc.dart';
import '../../data/repository/bus_repository.dart';

class BusNearByPage extends StatefulWidget {
  @override
  _BusNearByPageState createState() => _BusNearByPageState();
}

class _BusNearByPageState extends State<BusNearByPage> {
  BusBloc busBloc;

  String _dropdownValue = 'All';

  @override
  void initState() {
    super.initState();
    busBloc = BlocProvider.of<BusBloc>(context);
    busBloc.add(FetchAllBussByCompanyEvent("","",""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<BusBloc, BusState>(
          listener: (context, state) {
            if (state is BusErrorState) {
              SnackBar(content: Text(state.message));
            }
          },
      
          child: BlocBuilder<BusBloc, BusState>(
            builder: (context, state) {
              print(state);
              if (state is BusInitialState) {
                return Widgets.buildLoading();
              } else if (state is BusLoadingState) {
                return Widgets.buildLoading();
              } else if (state is BusLoadedState) {
                return buildBusList(state.buss);
              } else if (state is BusErrorState) {
                return Widgets.buildErrorUi(state.message);
              } else {
                return Widgets.buildErrorUi("");
              }
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(Icons.search),
          backgroundColor: Colors.orange,
        ),
    );
  }

  Widget selectCmpany() {
    return DropdownButton<String>(
        value: _dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        items: <String>['All', 'City Bus', 'KWB']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String newValue) {
          _dropdownValue = newValue;
          print(newValue);
          setState(() {
            print("123");
            _dropdownValue = newValue;
          });
        });
  }

  _showDialog() async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
                child: SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: selectCmpany(),
                        ),
                        new TextField(
                          autofocus: true,
                          decoration: new InputDecoration(
                              labelText: '巴士BUMBER', hintText: 'eg. 102'),
                        ),
                      ],
                    )))
          ],
        ),
        actions: <Widget>[
          new FlatButton(child: const Text('CANCEL'), onPressed: () {}),
          new FlatButton(
              child: const Text('OPEN'),
              onPressed: () {
                busBloc.add(FetchAllBussByCompanyEvent("","","102"));
                Navigator.of(context, rootNavigator: true).pop();
              })
        ],
      ),
    );
  }
}

Widget buildBusList(List<Bus> buss) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            child: Text("Hong Kong"),
            height: 50,
          ),
          Expanded(
            child: buss.length == 0
                ? Container(
                    child: Column(
                      children: [
                        Text("Out of serverice"),
                        SizedBox(height: 50),
                        Icon(Icons.close)
                      ],
                    ),
                    alignment: Alignment.topCenter,
                  )
                : ListView.builder(
                    itemCount: buss.length,
                    itemBuilder: (ctx, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: ListTile(
                            title: Text(
                              buss[pos].destTc,
                            ),
                            subtitle: Text(
                                DateTime.parse(buss[pos].eta).hour.toString() +
                                    ":" +
                                    DateTime.parse(buss[pos].eta)
                                        .minute
                                        .toString()),
                          ),
                          onTap: () {
                            print('123');
                            Navigator.push(
                                ctx,
                                MaterialPageRoute(
                                    builder: (context) => BusDetailsMapPage()));
                          },
                        ),
                      );
                    }),
          )
        ],
      ));
}
