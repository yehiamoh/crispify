import 'package:bloc/bloc.dart';
import 'package:crispify/models/user_data_model.dart';
import 'package:crispify/service/shares_prefrence_services.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit() : super(UserDataInitial());
  final dio=Dio();
  Future<void> getProfile() async {
    emit(UserDataLoading());
    try {
    final token=await SharedPrefService.getToken();
      final Map<String, String> headers = {
        'Authorization': 'Bearer $token', // Replace with your token retrieval logic
      };
      final response = await dio.get(
        'https://fried-chicken-restaurant-backend-node-js.onrender.com/api/client/profile',
        options: Options(headers: headers)
      );
      if (response.statusCode == 200) {
        final data = response.data["data"] as Map<String,dynamic>;
        print("user data is $data");
        final userDataModel=UserDataModel.fromJson(data);
        emit(UserDataSuccess(userDataModel));
      } else {
        // Handle non-200 status codes appropriately (e.g., throw an exception)
        throw DioException(
          requestOptions: response.requestOptions,
          error: 'Unexpected response status code: ${response.statusCode}',
          type: DioExceptionType.badCertificate,
        );
      }
    } on DioException catch (e) {
      emit(UserDataFailuer(e.message));
    } catch (e) {
      // Handle other exceptions more generally
      emit(UserDataFailuer(e.toString()));
    }
  }
}
