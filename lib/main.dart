import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/presentation/Providers/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  

  @override
  Widget build(BuildContext context) {

    final videoPostReposity = VideoPostsRepositoryImpl(
      videoDatasource: LocalVideoDatasource()
      );



    return MultiProvider(

      providers: [

        //por defecto el comportamiento natural de estos "ChangeNotifierProviders"
        //es que hasta que es necesario, Provider va a crear esta instancia. 
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => DiscoverProvider( videosRepository: videoPostReposity )..loadNextPage() ),
        //que es esto: ..loadNextPage()=> Esto es conocido como un operador de cascada, y el operador de casacada que nos perime a nosotro que en lugar de escribir myObject.unMetodo() y asi sucesivamente, simplemte defiinimos el objeto 
        //y despues ..ElMetodo. 
      ],
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
