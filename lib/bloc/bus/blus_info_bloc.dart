import 'package:bloc/bloc.dart';
import 'bus_event.dart';
import 'bus_state.dart';
import 'bus_info_state.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_routes_model.dart';
import 'package:boring_flutter_app/data/repository/bus_repository.dart';
import 'package:boring_flutter_app/data/model/api_result_bus_eta_model.dart';
import 'package:meta/meta.dart';

class BusInfoBloc extends Bloc<BusEvent, BusInfoState> {
  BusRepository repository;

  BusInfoBloc({@required this.repository}) : super(null);

  @override
  BusInfoState get initialState => BusInfoInitialState();

  @override
  Stream<BusInfoState> mapEventToState(BusEvent event) async* {
    if(event is FetchAllBussByCompanyEvent){
      print (456);
      yield BusInfoLoadingState();
            try {
        List<BusInfo> bussinfo = await repository.getBusRoute('');
        yield BusInfoLoadedState(bussInfo: bussinfo);
      } catch (e) {
        yield BusInfoErrorState(message: e.toString());
      }
    }
    
  }
}


