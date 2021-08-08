import 'package:data/src/datasource/remote/dto/login_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'authentication_service.g.dart';

@RestApi()
abstract class AuthenticationService {
  factory AuthenticationService(Dio dio, {String baseUrl}) = _AuthenticationService;

  @POST('/login')
  Future<LoginResponse> loginWithEmailAndPassword(@Body() Map<String, String> data);

  @GET('/profile')
  Future<LoginResponse> getUser();
}
