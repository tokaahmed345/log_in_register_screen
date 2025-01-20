import 'package:dio/dio.dart';
import 'package:logpage/model.dart';

class ServiseApi{


final Dio dio =createsetup() ;

  static Dio createsetup() {
    Dio dio = Dio();


    dio.interceptors.add(LogInterceptor(
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
    ));

    return dio;
  }


 Future <Register> registeruser({    required String name,
    required String phone,
    required String email,
    required String password,})async{
try {
  final response= await dio.post('https://student.valuxapps.com/api/register',
  
  data: {
    "name":name,
    "email":email,
    "phone":phone,
    "password": password,
  
  
  }
  );
if(response.statusCode==200){
  return Register.fromJson(response.data);
}else{
 throw Exception('failed register:${response.data}');
}


}  catch (e) {

throw Exception(e.toString());
}






}


  Future<Register> loguser ({ required String  email, required String password})async{
try {
  final response= await dio.post('https://student.valuxapps.com/api/login',
  data:{
  'email':email,
  
  'password':password,
  } 
  
  
  
  );

if(response.statusCode==200){
  return Register.fromJson(response.data);
}else{
  throw Exception("failed ${response.data}");
}

}  catch (e) {
throw Exception(e.toString());
}



}




}