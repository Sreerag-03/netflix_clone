import 'package:dartz/dartz.dart';
import 'package:flutter_netflix/domain/core/failures/main_failure.dart';
import 'package:flutter_netflix/domain/new_and_hot_resp/model/new_and_hot_resp.dart';

abstract class HotAndNewService{
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewMovieData();
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewTvData();
}
 