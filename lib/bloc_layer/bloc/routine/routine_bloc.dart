import 'package:acleane/bloc_layer/bloc/api/api_bloc.dart';


class RoutineBloc extends ApiBloc {

  RoutineBloc({name, api, onPending, onSuccess, onFailure}) :
        super(name: name, api: api, onPending: onPending, onSuccess: onSuccess, onFailure: onFailure);

}
