import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_court/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'platform_auth_state.dart';

class PlatformAuthCubit extends Cubit<PlatformAuthState> {
  final AuthRepo authRepo;
  PlatformAuthCubit(this.authRepo) : super(PlatformAuthInitial());

  googleAuth() async{
    emit(GoogleAuthLoading());
    final result = await authRepo.signInWithGoogle();
    if(result is UserCredential){
      emit(GoogleAuthSuccessful());
    }
    else{
      emit(GoogleAuthError(error: result.toString()));
    }
  }
}
