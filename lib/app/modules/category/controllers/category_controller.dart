import 'package:get/get.dart';

import '../../../models/category_model.dart';
import '../../../services/https_client.dart';

class CategoryController extends GetxController {
  //TODO: Implement CategoryController

  RxInt selectIndex = 0.obs;
  RxList<CategoryItemModel> leftCategoryList = <CategoryItemModel>[].obs;
  RxList<CategoryItemModel> rightCategoryList = <CategoryItemModel>[].obs;
  HttpsClient httpsClient = HttpsClient();
  @override
  void onInit() {
    super.onInit();
    getLeftCategoryData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeIndex(int index,id){
    selectIndex.value = index;
    getRightCategoryData(id);
    update();
  }

  getLeftCategoryData() async {
    var response = await httpsClient.get("api/pcate");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      leftCategoryList.value = category.result!;
      getRightCategoryData(leftCategoryList[0].sId!);
      update();
    }
  }

  getRightCategoryData(String pid) async {
    var response = await httpsClient.get("api/pcate?pid=$pid");
    if (response != null) {
      var category = CategoryModel.fromJson(response.data);
      rightCategoryList.value = category.result!;
      update();
    }
  }
}
