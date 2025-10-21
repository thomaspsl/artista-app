import 'package:artista/layouts/modify_profile/modify_profile_content.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyProfile extends StatelessWidget {
  const ModifyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return ModifyProfileContent(data: userManager.auth_user);
  }
}
