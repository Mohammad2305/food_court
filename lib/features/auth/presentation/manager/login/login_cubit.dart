import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../../domain/repo/auth_repo.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo authRepo;
  LoginCubit(this.authRepo) : super(LoginInitial());

  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  Future<void> signInEmailAndPassword({
    required String password,
    required String email,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      password: password,
      email: email,
    );
    if(result is UserCredential){
      emit(LoginSuccessful());
    }
    else{
      emit(LoginError(result.toString()));
    }
  }

  @override
  Future<void> close() {
    email.dispose();
    password.dispose();
    return super.close();
  }
}
