
import 'package:real_estate_management_platform/features/listing/domain/entity/batch_entity.dart';

abstract interface class IBatchDataSource {
  Future<List<BatchEntity>> getBatches();
  Future<void> createBatch(BatchEntity batch);
  Future<void> deleteBatch(String id, String? token);
}
