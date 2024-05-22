import 'package:al_dana_admin/app/data/data.dart';
import 'package:get/get.dart';

class CarModelController extends GetxController {
  var isLoading = false.obs;
  var selectedBrand = Brand().obs;
  var carModelResult = CarModelResult().obs;
  @override
  void onInit() {
    super.onInit();
    selectedBrand.value = Get.arguments;
    getDetails();
  }



  void getDetails() async{
    isLoading(true);
    await getCarModels();
    isLoading(false);
  }

   getCarModels() async {
    carModelResult.value =
        await CarModelProvider().getCarModelList(selectedBrand.value.id);
    carModelResult.refresh();
  }
}
