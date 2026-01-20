import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import '../../../domain/repo/auth_repo.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepo authRepo;
  RegisterCubit(this.authRepo) : super(RegisterInitial());

  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController date = TextEditingController();

  Future<void> createAccountWithEmailAndPassword({
    required String fullName,
    required String password,
    required String email,
    required String mobileNumber,
    required String birthDate,
  }) async {
    emit(RegisterLoading());
    final result = await authRepo.createAccountWithEmailAndPassword(
      fullName: fullName,
      password: password,
      email: email,
      mobileNumber: mobileNumber,
      birthDate: birthDate,
    );
    if(result is UserCredential){
      if(!result.user!.emailVerified){
        emit(EmailNotVerified());
        authRepo.emailVerify(user: result.user!);
      }
      else{
        emit(RegisterSuccessful());
      }
    }
    else{
      emit(RegisterError(result.toString()));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    name.dispose();
    mobile.dispose();
    date.dispose();
    return super.close();
  }
}
