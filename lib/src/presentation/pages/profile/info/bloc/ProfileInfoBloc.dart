import 'package:app_proyecto_pccalderon/src/domain/models/AuthResponse.dart';
import 'package:app_proyecto_pccalderon/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:app_proyecto_pccalderon/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<ProfileInfoGetUser>(_onGetUser);
  }

  Future<void> _onGetUser(ProfileInfoGetUser event, Emitter<ProfileInfoState> emit) async {
    AuthResponse authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(
      usuario: authResponse.usuario,
    ));
  }
}
