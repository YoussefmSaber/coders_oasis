import 'package:coders_oasis/shared/cubit/settings-cubit/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  SettingsCubit() : super(SettingsInitialState());

  static SettingsCubit get(context) => BlocProvider.of(context);

  bool isNotificationOn = false;

  void changeNotificationState(notificationState) {
    isNotificationOn = notificationState;
    emit(SettingsChangedState());
  }
}
