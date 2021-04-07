import 'package:flutter/material.dart';
import 'product.dart';

class ProductRepository {
  final ProductApi apiClient;

  ProductRepository({@required this.apiClient}) : assert(apiClient != null);

  getProductList() {
    print('in Repository getProductList');
    return apiClient.getProductList();
  }
// getId(id){
//   return apiClient.getId(id);
// }
// delete(id){
//   return apiClient.delete(id);
// }
// edit(obj){
//   return apiClient.edit( obj );
// }
// add(obj){
//     return apiClient.add( obj );
// }

}
