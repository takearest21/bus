import 'package:equatable/equatable.dart';

abstract class BusEvent extends Equatable {
  final String company;
  final String busStop;
  final String busNumber;

  BusEvent(this.company, this.busStop, this.busNumber);


}

class FetchBussEvent extends BusEvent {
  FetchBussEvent(String company, String busStop, String busNumber) : super(company, busStop, busNumber);

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchAllBussByCompanyEvent extends BusEvent {
  FetchAllBussByCompanyEvent(String company, String busStop, String busNumber) : super(company, busStop, busNumber);

  @override
  List<Object> get props => null;
}

class SearchBus extends BusEvent{
  SearchBus(String company, String busStop, String busNumber) : super(company, busStop, busNumber);

  @override
  List<Object> get props => null;
}
