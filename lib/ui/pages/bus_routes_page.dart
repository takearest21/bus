import 'package:flutter/material.dart';
import '../../bloc/bus/bus_info_bloc.dart';
import '../../bloc/bus/bus_info_state.dart';
import 'package:boring_flutter_app/bloc/bus/bus_info_event.dart';
import 'package:boring_flutter_app/ui/pages/bus_details_map_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/normal_widget.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';

class BusRoutePage extends StatefulWidget {
  @override
  _BusRoutePageState createState() => _BusRoutePageState();
}

class _BusRoutePageState extends State<BusRoutePage> {
  BusInfoBloc busInfoBloc;

  @override
  void initState() {
    super.initState();
    busInfoBloc = BlocProvider.of<BusInfoBloc>(context);
    busInfoBloc.add(FetchAllBussByCompanyEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocListener<BusInfoBloc, BusInfoState>(
        listener: (context, state) {
          if (state is BusInfoErrorState) {
            SnackBar(content: Text(state.message));
          }
        },
        child: BlocBuilder<BusInfoBloc, BusInfoState>(
          builder: (context, state) {
            print(state);
            if (state is BusInfoInitialState) {
              return Widgets.buildLoading();
            } else if (state is BusInfoLoadingState) {
              return Widgets.buildLoading();
            } else if (state is BusInfoLoadedState) {
              return buildBusList(state.bussInfo);
            } else if (state is BusInfoErrorState) {
              return Widgets.buildErrorUi(state.message);
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

Widget buildBusList(List<BusInfo> bussInfo) {
  print(bussInfo.length);
  return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            child: Text("Hong Kong All bus "),
            height: 50,
          ),
          Expanded(
            child: bussInfo.length == 0
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
                    itemCount: bussInfo.length,
                    itemBuilder: (ctx, pos) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: ListTile(
                            title: Text(bussInfo[pos].route, style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.orange),
                            ),
                            subtitle: Text(bussInfo[pos].origTc+" - " +bussInfo[pos].destTc,),
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
