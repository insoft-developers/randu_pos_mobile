part of 'cart_provider.dart';

@Freezed(
  fromJson: false,
)
class CartItem with _$CartItem {
  @HiveType(typeId: 7, adapterName: 'CartItemAdapter')
  const factory CartItem({
    @HiveField(0) required ProductModel product,
    @HiveField(1) @Default([]) List<Map<VariantModel, int>> variants,
    @HiveField(2) required String note,
    @HiveField(3) @Default(1) int quantity,
    @HiveField(4) int? id,
  }) = _CartItem;

  // factory CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);
}

@Freezed(fromJson: false)
class SavedCartInfo with _$SavedCartInfo {
  @HiveType(typeId: 14, adapterName: 'SavedCartInfoAdapter')
  factory SavedCartInfo({
    @HiveField(0) String? id,
    @HiveField(1) DateTime? createdAt,
    @HiveField(2) List<CartItem>? deletedCartItems,
  }) = _SavedCartInfo;
}

@freezed
class CartState with _$CartState {
  const CartState._();

  @HiveType(typeId: 6, adapterName: 'CartStateAdapter')
  const factory CartState({
    @HiveField(0) UserModel? user,
    @HiveField(1) CategoryModel? categoryProduct,
    @HiveField(2) @Default([]) List<CartItem> cartItems,
    @HiveField(3) int? orderFee,
    @HiveField(4) DiscountModel? discount,
    @HiveField(5) CustomerModel? customer,
    @HiveField(6) String? note,
    @HiveField(7) TableModel? table,
    @HiveField(8) PaymentMethodModel? paymentMethod,
    @HiveField(9) String? paymentMethodCode,
    @HiveField(10) double? totalPaid,
    @HiveField(11) double? tax,
    @HiveField(12) double? priceTax,
    @HiveField(13) PaymentRequestModel? paymentRequest,
    @HiveField(14) PaymentResponseData? paymentResponse,
    @HiveField(15) SavedCartInfo? savedCartInfo,
    @HiveField(16) @Default('price') String saleType,
  }) = _CartState;

  //GET SALE TYPE
  SaleTypeEnum get saleTypeEnum => SaleTypeEnum.findByString(saleType);

  // GET TOTAL QUANTITY
  int get totalQuantity {
    return cartItems.fold(0, (total, item) => total + item.quantity);
  }

  // GET SUBTOTAL
  double get subTotal {
    return cartItems.fold(0.0, (total, item) {
      final int priceProduct =
          getProductPrice(item.product, SaleTypeEnum.findByString(saleType));
      // Base price from the product
      double itemTotal = (priceProduct.toDouble()) * item.quantity;

      // Add the price from each variant
      for (final variantWithQuantity in item.variants) {
        variantWithQuantity.forEach((variant, quantity) {
          // final int priceVariant =
          //     getVariantPrice(variant, SaleTypeEnum.findByString(saleType));
          final int priceVariant = variant.varianPrice ?? 0;
          itemTotal += (priceVariant.toDouble()) * quantity;
        });
      }

      return total + itemTotal;
    });
  }

  double get subTotalWithTax {
    final total = subTotal * (tax ?? 0) / 100;
    return total;
  }

  double get calculateDiscount {
    if (discount == null) return 0;
    if (discount?.type == 'nominal') {
      return (discount?.value ?? 0).toDouble();
    } else {
      //PERCENTAGE
      return ((discount!.value ?? 0) / 100) * subTotal;
    }
  }

  double roundToNearestThousand(double total) {
    double rounded = (total / 1000).round() * 1000;
    double difference = rounded - total;
    return difference;
  }

  double get calculatedTotal {
    final double calculatedTotal =
        subTotal + (orderFee ?? 0) + subTotalWithTax - calculateDiscount;
    return calculatedTotal;
  }

  double get totalPrice {
    double total = 0;
    if ((user?.isRounded ?? false)) {
      double remainder = calculatedTotal % 1000;
      if (remainder == 500) {
        total = calculatedTotal;
      } else {
        if (remainder > 500) {
          total = calculatedTotal + (1000 - remainder);
        } else {
          total = calculatedTotal - remainder;
        }
      }
    } else {
      total = calculatedTotal;
    }
    return total > 0 ? total : 0;
  }

  // UANG KEMBALIAN
  double get changePrice {
    return totalPrice - (totalPaid ?? 0);
  }

  double get paymentAmount {
    return totalPaid ?? 0;
  }
}

extension CartStateExtensions on CartState {
  List<ProductModel> toProductList() {
    return cartItems.map((cartItem) {
      final updatedVariants = cartItem.variants
          .map((variantMap) {
            // Assuming that VariantModel has a quantity property
            return variantMap.keys.map((variant) {
              return variant.copyWith(quantity: variantMap[variant] ?? 0);
            }).toList();
          })
          .expand((variantList) => variantList)
          .toList();

      return cartItem.product.copyWith(
        quantity: cartItem.quantity,
        variant: updatedVariants,
      );
    }).toList();
  }

  PaymentRequestModel toPaymentRequest() {
    print('payment method code $paymentMethodCode');
    return PaymentRequestModel(
      customer: customer?.customer ?? 'Walk In Customer',
      paid: double.parse(totalPrice.toString()),
      paymentAmount: paymentAmount ?? 0,
      orderTotal: subTotal,
      tax: subTotalWithTax ?? 0,
      qrCodeId: table == null ? null : (table?.id.toString()),
      branchId: user?.branchId == null ? null : (user?.branchId.toString()),
      staffId: user?.id.toString(),
      paymentMethod: paymentMethodCode ?? '',
      shipping: orderFee == null ? 0 : double.parse(orderFee.toString()),
      discount: calculateDiscount,
      products: toProductList(),
      saleType: saleType,
      instantQris: paymentMethod?.id == 5,
    );
  }

  PaymentReceiptModel toPaymentReceipt(
      {ReceiptFromEnum receiptFromEnum = ReceiptFromEnum.pos}) {
    String roundedTotal = (user?.isRounded ?? false)
        ? 'Rp ${roundToNearestThousand(calculatedTotal)}'
        : '';
    return PaymentReceiptModel(
      createdAt: paymentResponse?.createdAt ?? DateTime.now(),
      receiptFrom: receiptFromEnum,
      referenceId: paymentResponse?.reference,
      customer: customer?.name ?? 'Walk In Customer',
      paid: double.parse(totalPrice.toString()),
      orderTotal: totalPrice,
      tax: tax ?? 0,
      qrCodeId: table?.id.toString(),
      branchId: table?.branchId == null ? '0' : table?.branchId.toString(),
      staffId: user?.id.toString(),
      staffName: user?.fullname,
      paymentMethod: paymentMethodCode ?? '',
      shipping: orderFee == null ? 0 : double.parse(orderFee.toString()),
      discount: calculateDiscount,
      products: toProductList(),
      table: table?.noMeja,
      bussinessName: user?.bussinessName,
      bussinessAddress: user?.bussinessAddress,
      branchName: user?.branchName,
      printerConnection: user?.printerConnection,
      printerCustomFooter: user?.printerCustomFooter,
      subTotal: subTotal,
      statusPayment: paymentResponse?.paymentStatus,
      status: paymentResponse?.status,
      transactionId: paymentResponse?.id,
      priceType: saleType,
      roundedTotal: roundedTotal,
      isRounded: user?.isRounded ?? false,
      paymentAmount: paymentAmount,
    );
  }
}
