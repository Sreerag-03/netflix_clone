import 'package:dartz/dartz.dart';
import 'package:flutter_netflix/domain/core/failures/main_failure.dart';
import 'package:flutter_netflix/domain/downloads/models/downloads_models.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailure, List<Downloads>>> getDownloadsImages();
}
