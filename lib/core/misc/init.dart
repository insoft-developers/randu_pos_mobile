import 'package:flutter/foundation.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

import '../../domain/entities/customer/customer_model.dart';
import '../../domain/entities/printer/paper_size.dart';
import '../../domain/entities/printer/printer_folder/printer_folder.dart';
import '../../domain/entities/printer/printer_model/printer_model.dart';
import '../../domain/entities/transaction/cart/category_model.dart';
import '../../domain/entities/transaction/cart/discount_model.dart';
import '../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../domain/entities/transaction/cart/product_model.dart';
import '../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../domain/entities/transaction/cart/table_model.dart';
import '../../domain/entities/user_model.dart';
import '../../presentation/providers/main/cart/cart_provider.dart';
import '../const/constant.dart';

Future<void> hiveInitialization() async {
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter());
  Hive.registerAdapter<MlSettingUserModel>(MlSettingUserModelAdapter());
  Hive.registerAdapter<PaymentRequestModel>(PaymentRequestModelAdapter());
  Hive.registerAdapter<ProductModel>(ProductModelAdapter());
  Hive.registerAdapter<VariantModel>(VariantModelAdapter());
  Hive.registerAdapter<CategoryModel>(CategoryModelAdapter());
  Hive.registerAdapter<CartState>(CartStateAdapter());
  Hive.registerAdapter<CartItem>(CartItemAdapter());
  Hive.registerAdapter<DiscountModel>(DiscountModelAdapter());
  Hive.registerAdapter<CustomerModel>(CustomerModelAdapter());
  Hive.registerAdapter<TableModel>(TableModelAdapter());
  Hive.registerAdapter<PaymentMethodModel>(PaymentMethodModelAdapter());
  Hive.registerAdapter<BankModel>(BankModelAdapter());
  Hive.registerAdapter<PaymentResponseData>(PaymentResponseDataAdapter());
  Hive.registerAdapter<SavedCartInfo>(SavedCartInfoAdapter());
  Hive.registerAdapter<PrinterModel>(PrinterModelAdapter());
  Hive.registerAdapter<PrinterFolder>(PrinterFolderAdapter()); 
  Hive.registerAdapter<PaperSizeModel>(PaperSizeModelAdapter());

  if (kDebugMode) {
    print('open hive boxes');
  }
  await Hive.openBox<UserModel>('userBox');
  await Hive.openBox<String>('token'); //header bearer
  await Hive.openBox<bool>('is_locked'); //lock screen
  await Hive.openBox<CartState>(savedTransactionBox);
  await Hive.openBox<ProductModel>(productsBox);
  await Hive.openBox<CategoryModel>(categoriesData);
  await Hive.openBox<bool>(isCashierOpenData);
  await Hive.openBox<bool>(isPettyCashEnabledData);
  await Hive.openBox<bool>(isOnlineData);
  await Hive.openBox<PaymentMethodModel>(paymentMethodsData);
  await Hive.openBox<TableModel>(tableData);
  await Hive.openBox<PrinterModel>(printerBox);
}

Future<void> hiveClear() async {
  await Hive.box<UserModel>('userBox').clear();
  await Hive.box<String>('token').clear();
  await Hive.box<bool>('is_locked').clear();
  await Hive.box<CartState>(savedTransactionBox).clear();
  await Hive.box<ProductModel>(productsBox).clear();
  await Hive.box<CategoryModel>(categoriesData).clear();
  await Hive.box<bool>(isCashierOpenData).clear();
  await Hive.box<bool>(isPettyCashEnabledData).clear();
  await Hive.box<bool>(isOnlineData).clear();
  await Hive.box<PaymentMethodModel>(paymentMethodsData).clear();
  await Hive.box<TableModel>(tableData).clear();
  await Hive.box<PrinterModel>(printerBox).clear();
}
