import 'package:flutter_bloc/flutter_bloc.dart';
import 'application_state/register_states.dart';
import 'package:dio/dio.dart';

class RegisterCubit extends Cubit<RegisterStates> {





  RegisterCubit() : super(InitialState());






  static RegisterCubit get(context) => BlocProvider.of(context);

  Dio dio = Dio();
  String? repeatedEmailOrMobile;
  String userId = "";
  bool isLoading=false;
  // Future<bool> register(
  //     {required String email,
  //     required String mobile,
  //     required String password,
  //     required String countryId,
  //
  //     required String   countryCode
  //
  //     }) async {
  //   // print("email : $email");
  //   // print("mobile : $mobile");
  //   // print("email : $email");
  //   // print("password : $password");
  //   // print("country : $country");
  //
  //   emit(RegisterLoading());
  //   isLoading=true;
  //   Map<String, dynamic> params = {
  //     "fullname": "عميل جديد",
  //     "mobile": mobile,
  //     "password": password,
  //     "country": countryId,
  //     "email": email,
  //     "countryCode":countryCode
  //   };
  //   // if (email != null && email.isNotEmpty) {
  //   //   params["email"] = email;
  //   // }
  //
  //   try {
  //     var response = await dio.post(baseUrl + "users/register", data: params);
  //
  //     if (response.statusCode == 200) {
  //       userId = response.data["_id"];
  //       emit(RegisterSuccess());
  //       print("Register userId  : $userId");
  //       print("activationCode : ${response.data["activationCode"]}");
  //       print("Sucesssss Register");
  //       isLoading=false;
  //       return true;
  //     }
  //   } on DioError catch (error) {
  //     print(error.toString());
  //
  //     if (error.response!.statusCode == 400) {
  //       repeatedEmailOrMobile = error.response!.data["msg"];
  //       // print(repeated);
  //
  //     }
  //     emit(RegisterError());
  //     isLoading=false;
  //     return false;
  //   }
  //   isLoading=false;
  //   return false;
  // }
///////////////////////////////////////////////////////////////////////////////////////
  String? activationCode;


////////////////////////////////////////////////////////////////////////////////////////
  Future<bool> confirmCode(
      {required String activationCode, required String userId}) async {
    print(" userId  : $userId");
    try {
      var response = await dio.get("baseUrl" +
          "users/checkCodeVerified/$userId?activationCode=$activationCode");

      if (response.statusCode == 200) {
        return true;
      }
    } on DioError catch (error) {
      print(error.toString());

      return false;
    }
    return false;
  }

//////////////////////////////////////////////////////

}
