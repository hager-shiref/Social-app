import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/bloc/cubit/cubit.dart';
import 'package:social/layout/social_layout.dart';
import 'package:social/modules/login_screen/login_screen.dart';
import 'package:social/shared/constant.dart';
import 'package:social/shared/themes.dart';
import 'bloc/bloc_observer.dart';
import 'firebase_options.dart';
import 'network/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();
  Widget widget;
  uId = CacheHelper.getData(key: 'uId');
  if (kDebugMode) {
    print("uid => $uId");
  }
  if (uId != null) {
    widget = const SocialLayout();
  } else {
    widget = const SocialLoginScreen();
  }

  runApp(SocialApp(
    startWidget: widget,
  ));
}

class SocialApp extends StatelessWidget {
  final Widget startWidget;
  const SocialApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SocialCubit()
              ..getUserData()
              ..getPosts(),
          ),
        ],
        child: MaterialApp(
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          home: startWidget,
        ));
  }
}
