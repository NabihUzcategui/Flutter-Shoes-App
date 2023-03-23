import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/zapato_model.dart';
import 'src/pages/pages.dart';

void main() {

  return runApp(
    MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => ZapatoModel(),)
      ],
      child: const MyApp()
    )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shoes App',
      home: ZapatoPage()
      // home: ZapatoDescPage(),
    );
  }
}