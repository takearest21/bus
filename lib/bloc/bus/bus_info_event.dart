import 'package:equatable/equatable.dart';

abstract class BusInfoEvent extends Equatable {}

class FetchBussInfoEvent extends BusInfoEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchAllBussByCompanyEvent extends BusInfoEvent {
  @override
  List<Object> get props => null;
}

