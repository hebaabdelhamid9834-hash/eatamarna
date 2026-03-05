import 'package:dartz/dartz.dart';
import 'package:eatamarna/core/network/tocken_storage_service.dart';
import 'package:eatamarna/feature/auth/data/model/currency_reponse.dart';
import 'package:eatamarna/feature/auth/data/model/terms_response.dart';
import 'package:eatamarna/feature/auth/data/model/user_response.dart';
import '../../../../core/failure/failures.dart';
import '../../../../core/network/api_service.dart';

class AuthRepositoryImpl {
  final ApiService _apiService;

  AuthRepositoryImpl(this._apiService);
  @override
  Future<Either<Failure, UserResponse>> login({
    required String phone,
    required String countryCode,
    required String password,
  }) async
  {
    try {
      final Map<String, dynamic> loginData = {
        "phone": phone,
        "country_code": countryCode,
        "password": password,
        "device_name": "iPhone 15"

      };
      print("logiNdATA ${loginData}");
      final response = await _apiService.post(
        urlEndPoint: "auth/login",
        data: loginData,
      );
      final userResponse = UserResponse.fromJson(response);

      return  Right(userResponse);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, void>> signUp({
    required String fName,
    required String lName,
    required String countryCode,
    required String phone,
    required String password,
    required String email,
    required String term
  }) async
  {
    try{
    final  body = {
      "first_name": fName,
      "last_name":lName,
      "country_code": countryCode,
      "phone": phone,
      "password": password,
      "email":email,
      "term":term
    };
    print("register${body}");
    final response =await _apiService.post(urlEndPoint: "auth/register",data:body);
    return Right(response);
    } on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,void>>forgetPassword({required String email})async{
    final body={"email":email};
    try{
      final response =await _apiService.post(urlEndPoint: "auth/forgot-password",data:body);
      return Right(response);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,void>>sendCode({required String email,required String code })async{
    final body={"email":email,"code":code};
    try{
      final response =await _apiService.post(urlEndPoint: "auth/send-code",data:body);
      return Right(response);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,void>>resendCode({required String email,required String code })async{
    final body={"email":email,"code":code};
    try{
      final response =await _apiService.post(urlEndPoint: "auth/resend-code",data:body);
      return Right(response);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  //todo
  Future<Either<Failure,void>>resetPassword({required String password,required String confirmPassword })async{
    final body={"password":password,"password_confirmation":confirmPassword,"reset_token":TokenStorageService().getToken()};
    try{
      final response =await _apiService.post(urlEndPoint: "auth/reset-password",data:body);
      return Right(response);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,TermsResponse>>getTerms()async{
    try{
      final response =await _apiService.get(urlEndPoint: "terms",);
      final terms=TermsResponse.fromJson(response);
      return Right(terms);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,CurrencyResponse>>getCurrency()async{
    try{
      final response =await _apiService.get(urlEndPoint: "app/language-currency",);
      final currency=CurrencyResponse.fromJson(response);
      return Right(currency);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,void>>changeLanguageAndCurrency({required String language,required String currency})async{
    try{
      final body={
          "language": language,
          "currency": currency
      };
    await _apiService.post(urlEndPoint: "app/language-currency",data: body);
      return Right(null);
    }on ServerFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
  Future<Either<Failure,void>>logout()async{
    try{
      await _apiService.post(urlEndPoint: "auth/logout");
      return Right(null);
    }
        on ServerFailure catch(e){
      return Left(e);
        }catch (e){
      return Left(ServerFailure(e.toString()));
    }
  }
}
