import 'package:flutter/material.dart';
import 'package:flutter_application_1/functions/data_functions.dart';
import 'package:flutter_application_1/model/data_model.dart';
import 'package:flutter_application_1/presentation/home.dart';

import 'package:flutter_application_1/provider/image_provider.dart';
import 'package:flutter_application_1/provider/searchProvider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ImageChangeProvider>(
        create: (_) => ImageChangeProvider()),
    ChangeNotifierProvider<DbFunctionsProvider>(
        create: (_) => DbFunctionsProvider()),
    ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: const Color.fromARGB(255, 58, 220, 131)),
      home: HomeScreen(),
    );
  }
}
