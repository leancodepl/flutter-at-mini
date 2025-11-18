import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:leancode_cubit_utils/leancode_cubit_utils.dart';
import 'package:week6/data/dog.dart';

abstract class HttpRequestCubit<TOut>
    extends RequestCubit<http.Response, String, TOut, int> {
  HttpRequestCubit(super.loggerTag, {required this.client});

  final http.Client client;

  @override
  Future<RequestState<TOut, int>> handleResult(http.Response result) async {
    if (result.statusCode == 200) {
      logger.info('Request success. Data: ${result.body}');
      return RequestSuccessState(map(result.body));
    } else {
      logger.severe('Request error. Status code: ${result.statusCode}');
      try {
        return await handleError(RequestErrorState(error: result.statusCode));
      } catch (e, s) {
        logger.severe(
          'Processing error failed. Exception: $e. Stack trace: $s',
        );
        return RequestErrorState(exception: e, stackTrace: s);
      }
    }
  }
}

class DogListRequestCubit extends HttpRequestCubit<List<Dog>> {
  DogListRequestCubit({required super.client}) : super('DogListRequestCubit');

  final _uri = Uri.parse('https://dog.ceo/api/breed/corgi/images/random/50');

  @override
  List<Dog> map(String data) {
    final body = json.decode(data) as Map<String, dynamic>;
    return (body['message'] as List)
        .cast<String>()
        .map((url) => (url: url))
        .toList();
  }

  @override
  Future<http.Response> request() => client.get(_uri);
}
