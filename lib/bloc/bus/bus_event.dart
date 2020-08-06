import 'package:equatable/equatable.dart';

abstract class BusEvent extends Equatable{}

class FetchBussEvent extends BusEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class FetchOtherBussEvent extends BusEvent {
    @override
    List<Object> get props => null;
}