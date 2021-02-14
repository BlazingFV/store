import 'package:Khaldiya/Api/requestApi.dart';
import 'package:Khaldiya/Model/ModelCart.dart';
import 'package:get/get.dart';

class control_Cart extends GetxController {


  var listCart = List<MProduct>().obs;
  var loading = false.obs;
  get conteCrt => listCart.length;


  //====== Fetch Data Cart ============================
  Future fetchCart() async {
    loading(true);
    try {
      var cart = await RemoteServices.apiGetCart();
      if (cart != null) {
        loading(true);
        return listCart.assignAll(cart);
        loading(false);
      }
    } finally {
      loading(false);
    }
    update();
  }

  @override
  void onInit() {
    fetchCart();
  }

  void plus(MProduct product) {
    apiEditQuantity(
      product_order_id: product.id,
      type: "plus",
    );
    update();
  }
}
