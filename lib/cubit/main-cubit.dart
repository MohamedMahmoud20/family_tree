// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_state/main_states.dart';

class MainCubit extends Cubit<MainStates> {
  MainCubit() : super(InitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  // http://35.180.41.238:1515/api/users/GetAllusers?api_id=admin&pass=123&user_id=1

}