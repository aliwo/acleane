import 'dart:convert';

import 'package:acleane/bloc_layer/model/picture.dart';
import 'package:acleane/bloc_layer/provider/picture_provider.dart';

class PictureRepository {
  final PictureProvider pictureProvider = PictureProvider();

  Future<dynamic> postPicture() async {
    final response = await pictureProvider.postPicture();
    return Picture.fromJson(jsonDecode(response.body));
  }

}
