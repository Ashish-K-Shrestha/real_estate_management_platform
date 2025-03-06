import 'package:dartz/dartz.dart';
import 'package:real_estate_management_platform/core/error/failure.dart';
import 'package:real_estate_management_platform/features/batch/domain/entity/batch_entity.dart';

abstract interface class IBatchRepository {
  Future<Either<Failure, List<BatchEntity>>> getBatches();
  Future<Either<Failure, void>> createBatch(BatchEntity batch);
  Future<Either<Failure, void>> deleteBatch(String id, String? token);
}


