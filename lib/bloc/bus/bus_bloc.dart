import 'package:bloc/bloc.dart';
import 'bus_event.dart';
import 'bus_state.dart';
import 'bus_info_state.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:boring_flutter_app/data/repository/bus_repository.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';
import 'package:meta/meta.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  BusRepository repository;

  BusBloc({@required this.repository}) : super(null);

  @override
  BusState get initialState => BusInitialState();

  @override
  Stream<BusState> mapEventToState(BusEvent event) async* {
    if (event is FetchAllBussByCompanyEvent) {
      yield BusLoadingState();
      try {
        List<Bus> buss = await repository.getBusETA('', '', '');
        yield BusLoadedState(buss: buss);
      } catch (e) {
        yield BusErrorState(message: e.toString());
      }
    }
    
  }
}