

import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';


class DiscoverProvider extends ChangeNotifier {


 final VideoPostsRepositoryImpl videosRepository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({
    required this .videosRepository
  });

  //este es un metodo asincrono que simula la craga de una nueva pagina despues de un retrazo de dos segundos 
  Future<void> loadNextPage() async{

    //await Future.delayed (const Duration(seconds: 2) );
    
    //Simula un retraso de 2 segundos antes de continuar con la ejecución del código. Esto es útil para simular una operación de red o una carga lenta.
    //  final List<VideoPost> newVideos = videoPosts.map(
    //     (video) => LocalVideoModel.fromJson(video).toVideoPostEntity() 
    //   ).toList();
    final newVideos = await videosRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading =false;
    notifyListeners();
  }
}