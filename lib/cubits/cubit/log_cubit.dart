import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:logpage/services.dart';
import 'package:meta/meta.dart';

part 'log_state.dart';

class LogCubit extends Cubit<LogState> {
  final ServiseApi service;

  LogCubit({required this.service}) : super(LogInitial());
  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      emit(Failure(errormessage: "email and password can't be empty"));
      return;
    }
    emit(LoginLoading());
    try {
      final logresponse =
          await service.loguser(email: email, password: password);

      if (logresponse.status == true) {
        emit(Success(message: logresponse.message!));
      } else {
        emit(Failure(errormessage: logresponse.message!));
      }
    } catch (e) {
      emit(Failure(errormessage: e.toString()));
    }
  }

  Future<void> register(
      {required String name,
      required String phone,
      required String email,
      required String password}) async {

if(email.isEmpty||password.isEmpty){

emit(Failure(errormessage: "email and passwordcan't empty"));
return;

}


try {
  final regisrtation=await service.registeruser(name: name, phone: phone, email: email, password: password);
if(regisrtation.status==true){
emit(Success(message: regisrtation.message!));

}else {
 emit(Failure(errormessage: regisrtation.message!)); 
}


} catch (e) {
  emit(Failure(errormessage: e.toString())); 
 
}





      }
}
