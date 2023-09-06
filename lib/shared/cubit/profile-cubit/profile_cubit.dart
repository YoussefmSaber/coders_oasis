import 'package:bloc/bloc.dart';
import 'package:coders_oasis/models/user_model.dart';
import 'package:coders_oasis/shared/cubit/profile-cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../network/local/cahce_helper.dart';

class ProfileCubit extends Cubit<ProfileScreenState> {

  String? name;
  String? email;

  late Future<UserModel> userData;

  ProfileCubit() : super(ProfileScreenInitialState()) {

    userData =  getUserData();
  }

  Future<UserModel> getUserData() async {
    String name = await CacheHelper.getData(key: "displayName") ?? "asd";
    String email = await CacheHelper.getData(key: "userEmail") ?? "asd";
    String userId = await CacheHelper.getData(key: "userId") ?? "asd";

    return UserModel(name, email, userId);
  }

  static ProfileCubit get(context) => BlocProvider.of(context);

  void changeState() {
    emit(ProfileScreenRefreshState());
  }
}
