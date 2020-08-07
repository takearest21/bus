import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';

abstract class BusState extends Equatable {}

class BusInitialState extends BusState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BusLoadingState extends BusState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BusLoadedState extends BusState {
  List<Bus> buss;

  BusLoadedState({@required this.buss});

  @override
  // TODO: implement props
  List<Object> get props => [buss];
}

class BusErrorState extends BusState {
  String message;

  BusErrorState({@required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
