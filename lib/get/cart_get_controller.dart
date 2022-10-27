import 'package:flutter/material.dart';
import 'package:food_store/database/controller/cart_db_controller.dart';
import 'package:food_store/models/process_response.dart';
import 'package:food_store/models/product.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class CartGetXController extends GetxController {
  List<Product> carts = <Product>[];
 int values=1;

  CartDbController _dbController = CartDbController();
  static CartGetXController get to =>Get.find<CartGetXController>();


  @override
  void onInit() {
    read();

    super .onInit();

  }

  Future<ProcessResponse> create({required Product cart}) async {
    int newRowId = await _dbController.create(cart);
    if (newRowId != 0) {
      cart.id = newRowId;
      carts.add(cart);
      update();
    }
    return ProcessResponse(
      message: newRowId != 0 ? 'Created successfully' : 'Create failed!',
      success: newRowId != 0,
    );
  }
  Future<ProcessResponse> add({required Product updatedCart}) async {
    bool updated = await _dbController.update(updatedCart);
    if (updated) {
      int index = carts.indexWhere((element) => element.id == updatedCart.id);
      if (index != -1) {
        carts[index] = updatedCart;
        update();
      }
    }
    return ProcessResponse(
        message: updated ? 'Updated successfully' : 'Update failed!',
        success: updated);
  }
  void  addd(){

    values=values+1;
  }
  void  Shortage(){

    values=values-1;
  }
  void read() async {
    carts = await _dbController.read();
    print(carts);
    update();
  }

  Future<ProcessResponse> updateCart({required Product updatedCart}) async {
    bool updated = await _dbController.update(updatedCart);
    if (updated) {
      int index = carts.indexWhere((element) => element.id == updatedCart.id);
      if (index != -1) {
        carts[index] = updatedCart;
        update();
      }
    }
    return ProcessResponse(
        message: updated ? 'Updated successfully' : 'Update failed!',
        success: updated);
  }

  Future<ProcessResponse> delete({required int index}) async {
    bool deleted = await _dbController.delete(carts[index].id);
    if (deleted) {
      carts.removeAt(index);
      update();
    }
    return ProcessResponse(
        message: deleted ? 'Deleted successfully' : 'Delete failed!',
        success: deleted);
  }

}
