import 'dart:math';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:hive_ce/hive.dart';
import 'package:oktoast/oktoast.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entities/customer/customer_model.dart';
import '../../../../domain/entities/transaction/cart/category_model.dart';
import '../../../../domain/entities/transaction/cart/discount_model.dart';
import '../../../../domain/entities/transaction/cart/payment/payment_response_data.dart';
import '../../../../domain/entities/transaction/cart/payment_method/payment_method_model.dart';
import '../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../domain/entities/transaction/cart/receipt_from_enum.dart';
import '../../../../domain/entities/transaction/cart/request/payment/payment_request_model.dart';
import '../../../../domain/entities/transaction/cart/request/producs/products_request_model.dart';
import '../../../../domain/entities/transaction/cart/table_model.dart';
import '../../../../domain/entities/transaction/sale_type/sale_type_enum.dart';
import '../../../../domain/entities/user_model.dart';
import '../../../../insoft/controller/payment_method_controller.dart';
import '../../../pages/dashboard/utils/dashboard_utils.dart';
import 'get_products/get_products_provider.dart';

part 'cart_provider.freezed.dart';
part 'cart_provider.g.dart';
part 'cart_state.dart';

@Riverpod(keepAlive: true)
class Cart extends _$Cart {
  @override
  CartState build() {
    return const CartState();
  }

  void restoreSavedCart(CartState cart) {
    state = cart;
  }

  void setUser(UserModel user) {
    state = state.copyWith(user: user);
  }

  void setTax(double tax) {
    state = state.copyWith(tax: tax);
  }

  void setCategory(CategoryModel category) {
    final ProductsRequestModel request = ProductsRequestModel(
      categoryId: category.id,
    );
    ref
        .read(getProductsProvider.notifier)
        .fetchProducts(request, refresh: true);
    state = state.copyWith(categoryProduct: category);
  }

  void getAllProducts() {
    const ProductsRequestModel request = ProductsRequestModel();
    ref.read(getProductsProvider.notifier).fetchProducts(request);
  }

  void setOrderFee(int orderFee) {
    state = state.copyWith(orderFee: orderFee);
  }

  void setDiscount(DiscountModel discount) {
    state = state.copyWith(discount: discount);
  }

  void setTotalPaid(double totalPaid) {
    state = state.copyWith(totalPaid: totalPaid);
  }

  void setCustomer(CustomerModel customer) {
    state = state.copyWith(
      customer: customer,
    );
  }

  void setPaymentResponse(PaymentResponseData paymentResponse) {
    state = state.copyWith(paymentResponse: paymentResponse);
  }

  void setPaymentMethodCode(String paymentMethodCode) {
    state = state.copyWith(paymentMethodCode: paymentMethodCode);
  }

  void setNote(String note) {
    state = state.copyWith(note: note);
  }

  /// to set the note of spesific cart item
  void setCartItemNote(CartItem cartItem, String note) {
    state = state.copyWith(
        cartItems: state.cartItems.map((item) {
      if (item.id == cartItem.id) {
        return item.copyWith(product: item.product.copyWith(note: note));
      } else {
        return item;
      }
    }).toList());
  }

  void addProduct(
    ProductModel product,
    List<Map<VariantModel, int>> newVariants,
    String note, {
    bool isNewItem = false,
    int? cartItemId,
  }) {
    final bufferedStock = product.bufferedStock ?? 0;
    final currentStock = product.shadowStock;

    // Check stock availability
    if (bufferedStock != 0 && currentStock <= 0) {
      showToast('Stock tidak cukup');
      return;
    }

    // Generate a unique ID for the new cart item
    final id = _generateUniqueId();

    if (newVariants.isEmpty) {
      _handleProductWithoutVariants(product, note, id);
    } else {
      _handleProductWithVariants(
          product, newVariants, note, id, isNewItem, cartItemId);
    }

    // Decrease product quantity in the product provider if buffered stock is not zero
    if (bufferedStock != 0) {
      ref
          .read(getProductsProvider.notifier)
          .updateProductQuantity(product.id, -1);
    }
  }

  void removeProduct(
    ProductModel product,
    List<Map<VariantModel, int>> variantsToRemove,
    String note, {
    int? cartId,
  }) {
    final existingItem =
        _findExistingItem(product, variantsToRemove, note, cartId);

    if (existingItem != null) {
      if (existingItem.quantity > 1) {
        _decreaseItemQuantity(existingItem, cartId);
      } else {
        _removeItemFromCart(existingItem, cartId);
      }
    }

    // Increase the product's quantity in the product provider
    ref.read(getProductsProvider.notifier).updateProductQuantity(product.id, 1);
  }

// Helper function to generate a unique ID for the cart item
  int _generateUniqueId() {
    int id;
    do {
      id = Random().nextInt(1000);
    } while (state.cartItems.any((element) => element.id == id));
    return id;
  }

// Helper function to handle products without variants
  void _handleProductWithoutVariants(
      ProductModel product, String note, int id) {
    final existingItem = state.cartItems.firstWhereOrNull(
      (item) =>
          item.product.id == product.id &&
          item.variants.isEmpty &&
          (item.product.note == note ||
              (item.product.note?.isEmpty ?? true) && note.isEmpty),
    );

    if (existingItem != null) {
      _updateCartItemQuantity(existingItem);
    } else {
      _addNewCartItem(product, [], note, id);
    }
  }

// Helper function to handle products with variants
  void _handleProductWithVariants(
    ProductModel product,
    List<Map<VariantModel, int>> newVariants,
    String note,
    int id,
    bool isNewItem,
    int? cartItemId,
  ) {
    final newCartItem = CartItem(
      product: product.copyWith(note: note),
      variants: newVariants,
      note: note,
      quantity: 1,
      id: id,
    );

    if (cartItemId != null) {
      _updateCartItemQuantityById(cartItemId);
    } else {
      final isExist = state.cartItems.any(
        (element) =>
            element.product.id == newCartItem.product.id &&
            _compareVariants(element.variants, newCartItem.variants) &&
            element.product.note == newCartItem.product.note,
      );

      if (isExist && !isNewItem) {
        _updateCartItemQuantity(newCartItem);
      } else {
        _addNewCartItem(product, newVariants, note, id);
      }
    }
  }

// Helper function to update the quantity of an existing cart item
  void _updateCartItemQuantity(CartItem item) {
    state = state.copyWith(
      cartItems: state.cartItems.map((element) {
        if (element.product.id == item.product.id &&
            _compareVariants(element.variants, item.variants) &&
            element.product.note == item.product.note) {
          final productsForCheker = [...item.product.productForChecker];
          productsForCheker.add(element.product);
          return element.copyWith(
              quantity: element.quantity + 1,
              product: element.product
                  .copyWith(productForChecker: productsForCheker));
        }
        return element;
      }).toList(),
    );
  }

// Helper function to update the quantity of an existing cart item by ID
  void _updateCartItemQuantityById(int cartItemId) {
    state = state.copyWith(
      cartItems: state.cartItems.map((element) {
        if (element.id == cartItemId) {
          // Increment the main quantity
          final updatedQuantity = element.quantity + 1;

          // Increment the variant quantities if they exist
          final updatedVariants = element.variants.map((variantMap) {
            return variantMap.map((variant, quantity) {
              return MapEntry(
                  variant, quantity + 1); // Increment variant quantity
            });
          }).toList();

          return element.copyWith(
            quantity: updatedQuantity,
            variants: updatedVariants,
          );
        }
        return element;
      }).toList(),
    );
  }

// Helper function to add a new cart item
  void _addNewCartItem(ProductModel product,
      List<Map<VariantModel, int>> variants, String note, int id) {
    final productsForCheker = [product.copyWith(note: note)];
    state = state.copyWith(
      cartItems: [
        ...state.cartItems,
        CartItem(
          product: product.copyWith(
              note: note, productForChecker: productsForCheker),
          variants: variants,
          note: note,
          quantity: 1,
          id: id,
        ),
      ],
    );
  }

// Helper function to find an existing item in the cart
  CartItem? _findExistingItem(
    ProductModel product,
    List<Map<VariantModel, int>> variantsToRemove,
    String note,
    int? cartId,
  ) {
    if (cartId != null) {
      return state.cartItems.firstWhereOrNull((item) => item.id == cartId);
    }

    return state.cartItems.firstWhereOrNull(
      (item) =>
          item.product.id == product.id &&
          (variantsToRemove.isEmpty
              ? item.variants.isEmpty
              : _compareVariants(item.variants, variantsToRemove)) &&
          (item.product.note == note ||
              (item.product.note?.isEmpty ?? true) && note.isEmpty),
    );
  }

// Helper function to decrease the quantity of an existing item
  void _decreaseItemQuantity(CartItem item, int? cartId) {
    state = state.copyWith(
      cartItems: state.cartItems.map((cartItem) {
        if (cartId != null) {
          if (cartItem.id == cartId) {
            return cartItem.copyWith(quantity: cartItem.quantity - 1);
          }
        } else if (cartItem.product.id == item.product.id &&
            _compareVariants(cartItem.variants, item.variants) &&
            cartItem.product.note == item.product.note) {
          return cartItem.copyWith(quantity: cartItem.quantity - 1);
        }
        return cartItem;
      }).toList(),
    );
  }

// Helper function to remove an item from the cart
  void _removeItemFromCart(CartItem item, int? cartId) {
    state = state.copyWith(
      cartItems: state.cartItems.where((cartItem) {
        if (cartId != null) {
          return cartItem.id != cartId;
        } else {
          return !(cartItem.product.id == item.product.id &&
              _compareVariants(cartItem.variants, item.variants) &&
              cartItem.product.note == item.product.note);
        }
      }).toList(),
    );
  }

  void addProductForBarcode(ProductModel product,
      List<Map<VariantModel, int>> newVariants, String note) {
    int id = Random().nextInt(1000);
    final bufferedStock = product.bufferedStock ?? 0;
    final currentStock = product.shadowStock;

    while (state.cartItems.any((element) => element.id == id)) {
      id = Random().nextInt(1000);
    }

    if (bufferedStock == 0 || currentStock > 0) {
      if (newVariants.isEmpty) {
        // For products without variants
        final existingItem = state.cartItems.firstWhereOrNull(
          (item) => item.product.id == product.id && item.variants.isEmpty,
        );

        if (existingItem != null) {
          // Update quantity of existing item
          state = state.copyWith(
            cartItems: state.cartItems.map((item) {
              if (item.product.id == product.id && item.variants.isEmpty) {
                return item.copyWith(quantity: item.quantity + 1);
              }
              return item;
            }).toList(),
          );
        } else {
          // Add new item
          state = state.copyWith(
            cartItems: [
              ...state.cartItems,
              CartItem(
                  product: product,
                  variants: [],
                  note: note,
                  quantity: 1,
                  id: id),
            ],
          );
        }
      } else {
        // For products with variants:
        // Add a new item when the product is same but the variants are different
        // Add Quantity when the product is same and the variants are same
        var newCartItem = CartItem(
          product: product,
          variants: newVariants,
          note: note,
          quantity: 1,
          id: id,
        );

        // check if the product is already in the cart and the variants are same
        bool isExist = state.cartItems.any((element) {
          return (element.product.id == newCartItem.product.id) &&
              _compareVariants(element.variants, newCartItem.variants) &&
              element.product.note == newCartItem.product.note;
        });

        if (isExist) {
          state = state.copyWith(
            cartItems: state.cartItems.map((element) {
              if (element.product.id == newCartItem.product.id &&
                  _compareVariants(element.variants, newCartItem.variants) &&
                  element.product.note == newCartItem.product.note) {
                return element.copyWith(
                  quantity: element.quantity + 1,
                );
              }
              return element;
            }).toList(),
          );
        } else {
          state = state.copyWith(
            cartItems: [
              ...state.cartItems,
              newCartItem,
            ],
          );
        }
      }

      if (bufferedStock != 0) {
        // Decrease the product's quantity in the product provider
        ref
            .read(getProductsProvider.notifier)
            .updateProductQuantity(product.id, -1);
      }
    } else {
      showToast('Stock tidak cukup');
    }
  }

  void updateQuantity(CartItem cartItem, int newQuantity) {
    // because we can change quantity in both products with and without variants
    // so we can use same logic to update
    state = state.copyWith(
      cartItems: state.cartItems.map((item) {
        bool flag = item.id == cartItem.id;
        if (flag) return item.copyWith(quantity: newQuantity);
        return item;
      }).toList(),
    );
  }

  // update product is printed to true
  void updatePrintedProduct(bool value) {
    state = state.copyWith(
      cartItems: state.cartItems.map((item) {
        final productsForChecker = [...item.product.productForChecker];
        final newProductForChecker = productsForChecker.map((product) {
          if (product.id == item.product.id) {
            return product.copyWith(isPrinted: value);
          }
          return product;
        }).toList();
        return item.copyWith(
            product:
                item.product.copyWith(productForChecker: newProductForChecker));
      }).toList(),
    );
  }

  void updatePrice(CartItem cartItem, int newPrice) {
    state = state.copyWith(
      cartItems: state.cartItems.map((item) {
        bool flag = item.id == cartItem.id;
        if (flag) {
          return item.copyWith(
              product: item.product.copyWith(
            priceEdit: newPrice,
            price: newPrice,
          ));
        }
        return item;
      }).toList(),
    );
  }

  void removeCartItem(CartItem cartItem) {
    // because we can change quantity in both products with and without variants
    // so we can use same logic to update

    for (int i = 1; i <= cartItem.quantity; i++) {
      removeProduct(cartItem.product, cartItem.variants, cartItem.note);
    }
    state = state.copyWith(
      cartItems: state.cartItems
          .where((element) => element.id != cartItem.id)
          .map((item) => item)
          .toList(),
    );
  }

  List<Map<VariantModel, int>> _updateVariants(
      List<Map<VariantModel, int>> existingVariants,
      List<Map<VariantModel, int>> newVariants) {
    final updatedVariants = <VariantModel, int>{};

    // Aggregate existing variants
    for (var variantMap in existingVariants) {
      for (var entry in variantMap.entries) {
        updatedVariants.update(entry.key, (value) => value + entry.value,
            ifAbsent: () => entry.value);
      }
    }

    // Add new variants
    for (var variantMap in newVariants) {
      for (var entry in variantMap.entries) {
        updatedVariants.update(entry.key, (value) => value + entry.value,
            ifAbsent: () => entry.value);
      }
    }

    // Convert back to List<Map<VariantModel, int>>
    return updatedVariants.entries
        .map((entry) => {entry.key: entry.value})
        .toList();
  }

  void setTable(TableModel? table) {
    state = state.copyWith(table: table);
  }

  bool _compareVariants(
      List<Map<VariantModel, int>> a, List<Map<VariantModel, int>> b) {
    if (a.length != b.length) return false;

    // Convert lists of maps to a single map for easier comparison
    final mapA = _convertListOfMapsToMap(a);
    final mapB = _convertListOfMapsToMap(b);

    // Compare the maps
    return mapA.length == mapB.length &&
        mapA.entries.every((entry) =>
            mapB.containsKey(entry.key) && mapB[entry.key] == entry.value);
  }

  Map<VariantModel, int> _convertListOfMapsToMap(
      List<Map<VariantModel, int>> list) {
    final result = <VariantModel, int>{};
    for (final map in list) {
      for (final entry in map.entries) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  void setPaymentMethod(PaymentMethodModel paymentMethod) {
    state = state.copyWith(paymentMethod: paymentMethod);
  }

  void setPaymentRequest() {
    PaymentMethodController pmc = Get.put(PaymentMethodController());
    state = state.copyWith(
        paymentRequest: PaymentRequestModel(
            customer: state.customer?.customer,
            paid: double.parse(state.totalPrice.toString()),
            paymentAmount: double.parse(state.totalPaid?.toString() ?? '0.8'),
            orderTotal: state.subTotal,
            tax: state.subTotalWithTax ?? 0,
            qrCodeId: state.table?.qrId,
            branchId: state.user?.branchId == null
                ? '0'
                : state.user?.branchId.toString(),
            staffId: state.user?.id.toString(),
            paymentMethod: state.paymentMethod?.code ?? 'kas',
            shipping: double.parse(state.orderFee.toString()),
            discount: double.parse(state.discount?.value.toString() ?? '0'),
            products: state.toProductList(),
            flag: '2'));
  }

  void resetCart() {
    final user = Hive.box<UserModel>('userBox').get('userBox');
    state = CartState(tax: user?.tax ?? 0, user: user);
  }

  void setSaleType(String? saleType) {
    state = state.copyWith(saleType: saleType ?? SaleTypeEnum.dineIn.value);
  }
}
