import 'package:dartz/dartz.dart';
import 'package:flutter_netflix/domain/core/failures/main_failure.dart';
import 'package:flutter_netflix/domain/search/models/search_resp/search_resp.dart';

abstract class SearchService {
  Future<Either<MainFailure, SearchResp>> searchMovies({
    required String movieQuery,
  });
}
