import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie/firbase_options.dart';
import 'package:movie/pages/on_board_page.dart';
import 'package:movie/service/create_request_token.dart';
import 'package:movie/service/data_provider.dart';
import 'package:movie/splash/app_constant.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: Defaultfirebaseoptions.currentPlatform);
  await EasyLocalization.ensureInitialized();

  //:创建请求类
  final createtoken = await CreateRequestToken().getRequestToken();
  if (createtoken != null) {
    if (kDebugMode) {
            print('Request Token: $createtoken');
    }
  }else{
     if (kDebugMode) {
           print('Request Token alınamadı.');
    }
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [
        AppConstant.trlocale,
        AppConstant.enlocale
      ],
      path: AppConstant.langpath,
      fallbackLocale: AppConstant.trlocale,
      child: ChangeNotifierProvider(
        create: (_) => DataProvider(),
        child: const MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: OnBoardPage(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}

