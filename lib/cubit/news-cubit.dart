// ignore_for_file: file_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_state/news_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  // http://35.180.41.238:1515/api/users/GetAllusers?api_id=admin&pass=123&user_id=1

}