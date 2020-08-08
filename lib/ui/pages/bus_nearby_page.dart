import 'package:boring_flutter_app/ui/pages/bus_details_map_page.dart';
import 'package:flutter/material.dart';
import '../../data/model/api_result_bus_routes_model.dart';
import '../../bloc/bus/bus_bloc.dart';
import '../../bloc/bus/bus_state.dart';
import 'package:boring_flutter_app/bloc/bus/bus_event.dart';
import '../../bloc/bus/bus_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';
import 'dart:collection';

class BusNearByPage extends StatefulWidget {
  @override
  _BusNearByPageState createState() => _BusNearByPageState();
}

class _BusNearByPageState extends State<BusNearByPage> {
  BusBloc busBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    busBloc = BlocProvider.of<BusBloc>(context);
    busBloc.add(FetchAllBussByCompanyEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget buildBusList(List<Bus> buss) {
  print(buss.length);
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
                    ),alignment: Alignment.topCenter,
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
