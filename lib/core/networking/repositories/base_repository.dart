import 'package:get/get.dart';
import '../network_handler.dart';

class BaseRepository {
  late Map<String, dynamic> body;
  final NetworkHandler networkHandler = Get.find();
}
