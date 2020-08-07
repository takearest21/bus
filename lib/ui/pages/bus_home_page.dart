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

  @override
  void initState() {
    super.initState();
    busBloc = BlocProvider.of<BusBloc>(context);
    busBloc.add(FetchBussEvent());
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
                    busBloc.add(FetchBussEvent());
                  },
                )
              ],
            ),
            body: Container(
              child: BlocListener<BusBloc, BusState>(
                listener: (context, state) {
                  if (state is BusErrorState) {
                    SnackBar(content: Text(state.message));
                  }
                },
                child: BlocBuilder<BusBloc, BusState>(
                  builder: (context, state) {
                    print(state);
                    if (state is BusInitialState) {
                      return buildLoading();
                    } else if (state is BusLoadingState) {
                      return buildLoading();
                    } else if (state is BusLoadedState) {
                      return buildBusList(state.buss);
                    } else if (state is BusErrorState) {
                      return buildErrorUi(state.message);
                    } else {
                      return Container(
                        child: Text(state.toString()),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
        );
      },
    ));
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildBusList(List<Bus> buss) {
  return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            child: Text("123"),
            height: 50,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: buss.length,
                itemBuilder: (ctx, pos) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      child: ListTile(
                        title: Text(
                          buss[pos].destTc,
                        ),
                        subtitle: Text(DateTime.parse(buss[pos].eta)
                                .hour
                                .toString() +
                            ":" +
                            DateTime.parse(buss[pos].eta).minute.toString()),
                      ),
                    ),
                  );
                }),
          )
        ],
      ));
}

Widget buildErrorUi(String message) {
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
