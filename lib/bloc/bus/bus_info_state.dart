
import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class BusInfoState extends Equatable {}

class BusInfoInitialState extends BusInfoState {
  @override
  List<Object> get props => [];
}

class BusInfoLoadingState extends BusInfoState {
  @override
  List<Object> get props => [];
}

class BusInfoLoadedState extends BusInfoState {
  List<BusInfo> bussInfo;

  BusInfoLoadedState({@required this.bussInfo});

  @override
  List<Object> get props => [bussInfo];
}

class BusInfoErrorState extends BusInfoState {
  String message;

  BusInfoErrorState({@required this.message});

  @override
  List<Object> get props => [message];
}
