import 'package:dio/dio.dart';
import 'package:ejapay/app/core/client/http_client.dart';
import 'package:ejapay/data/remote/auth/auth_service_impl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
 await dotenv.load(fileName: ".env");
  late final HttpClientModk httpClientModk;
  late final AuthServiceImpl authServiceImpl;
  setUp(() {
    httpClientModk = HttpClientModk();
    authServiceImpl = AuthServiceImpl(httpClientModk);
  });

  group("AuthService login", () {
    test("login success", () async {
      // when
      // when(() => httpClientModk.post(any(), any(),
      //     headers: any(
      //       named: "headers",
      //     ))).thenAnswer((invocation) => Future.value(Response));

      // //act
      // await authServiceImpl.login();

      //verify
      // verify(() => httpClientModk.post(any(), any(), headers: any(named: "headers"))).called(1);
    });
  });
}

class HttpClientModk extends Mock implements HttpClient {}
