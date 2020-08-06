import 'package:bloc/bloc.dart';
import 'bus_event.dart';
import 'bus_state.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:boring_flutter_app/data/repository/bus_repository.dart';
import 'package:meta/meta.dart';

class BusBloc extends Bloc<BusEvent, BusState> {

  BusRepository repository;

  BusBloc({@required this.repository});

  @override
  // TODO: implement initialState
  BusState get initialState => BusInitialState();

  @override
  Stream<BusState> mapEventToState(BusEvent event) async* {
    if (event is FetchBussEvent) {
      yield BusLoadingState();
      try {
        List<Bus> buss = await repository.getBus('');
        yield BusLoadedState(buss: buss);
      } catch (e) {
        yield BusErrorState(message: e.toString());
      }
    }

    if(event is FetchOtherBussEvent){
      print("123");
    }
    
  }

}