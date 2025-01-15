import 'dart:convert';

import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

import '../../constants.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString(kUserData);
  
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));

  return userEntity;
}
