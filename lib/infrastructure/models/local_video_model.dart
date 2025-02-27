
import 'package:toktik/domain/entities/video_post.dart';

//el obteivo de este local_video_model es que nos ayude a nosotros a mappear 
//como luce el local_video_post.
//tenemos que ser capaces de recibir un objeyo de tipo videoPost
//y crear una instacia de un obtjeto que cumpla esas condicniones 
//la tarea es implementar el constructor 
//las propiedades, el fromJson y tambien el video PostEntity.
class LocalVideoModel {
  
  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes=0,
    this.views=0,
  });

  final String name;
  final String videoUrl;
  final int likes;
  final int views;

   //con este fomJson yo voy a tomar un mapa de tipo <String, dynamic> y voy a crear instacias de mi video model 

   //cual es el objetivo de LocalVideoModel.fromJson
    factory LocalVideoModel.fromJson(Map<String, dynamic> json) => LocalVideoModel(
        name: json['name'] ?? 'No name',//si por alguna razon el video no trae nombre entoces me arrojara un no name 
        videoUrl: json['videoUrl'],
        likes: json['likes'] ?? 0,// si no tienen ningu valor se colocan en crer0
        views: json['views'] ??0,// si no tienen ningu valor se colocan en crer0
      );
 

 //este mapper que estamos creando aca lo colocaremos despues en otro archivo
    VideoPost toVideoPostEntity() => VideoPost(

      //la partde de la derecha son de la instancia que ya va a estar creada en el momento en que llamenos a el metodo
      //las de la parte izquierda son de las propiedades con nombre de mi "videoPost"
      caption: name, 
      videoUrl: videoUrl,
      likes: likes,
      views: views,
      );

      


}




