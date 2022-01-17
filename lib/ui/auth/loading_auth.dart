import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor/features/auth.dart';
import 'package:lettutor/ui/auth/sign_in.dart';
import 'package:lettutor/ui/home/home.dart';

class LoadingAuthUI extends StatelessWidget {
  final AuthCtrl _authCtrl = Get.put(AuthCtrl());

  Future<void> initializeSettings() async {
    _authCtrl.checkLoginStatus();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: initializeSettings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return waitingView();
          } else {
            if (snapshot.hasError)
              return errorView(snapshot);
            else
              return Obx(() {
                return _authCtrl.isLogged.value ? HomeUI() : SignInUI();
              });
          }
        },
      ),
    );
  }

  Scaffold errorView(AsyncSnapshot<Object?> snapshot) {
    return Scaffold(body: Center(child: Text('Error: ${snapshot.error}')));
  }

  Scaffold waitingView() {
    return Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CircularProgressIndicator(),
              ),
              Text('Loading...'),
            ],
          ),
        ));
  }
}
