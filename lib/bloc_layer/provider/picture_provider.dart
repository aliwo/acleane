import 'package:acleane/service/main_api.dart';
import 'package:http/http.dart';

class PictureProvider {
  final client = Client();

  Future<dynamic> postPicture() async {
    // 사진을 업로드합니다.
    // TODO: 사진 picker 라이브러 써야 할듯 ㅎ
    return await client.post(
        MainApi.baseUrl + '/pictures',
        headers: {'content-type': 'application/json'}
    );
  }
}
