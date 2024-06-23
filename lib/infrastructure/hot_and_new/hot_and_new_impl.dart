import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_netflix/domain/core/failures/main_failure.dart';
import 'package:flutter_netflix/domain/new_and_hot_resp/model/new_and_hot_resp.dart';
import 'package:flutter_netflix/domain/new_and_hot_resp/new_and_hot_service.dart';
import 'package:injectable/injectable.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: HotAndNewService)
class HotAndNewImplementation implements HotAndNewService{
  @override
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewMovieData() async{
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewMovie);
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }

  @override
  Future<Either<MainFailure, NewAndHotResp>> getHotAndNewTvData() async{
    try {
      final Response response = await Dio(BaseOptions()).get(ApiEndPoints.hotAndNewTv);
      //log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NewAndHotResp.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } on DioException catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
  
}