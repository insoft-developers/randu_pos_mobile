// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemAdapter extends TypeAdapter<_$CartItemImpl> {
  @override
  final int typeId = 7;

  @override
  _$CartItemImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CartItemImpl(
      product: fields[0] as ProductModel,
      variants: fields[1] == null
          ? const []
          : (fields[1] as List)
              .map((e) => (e as Map).cast<VariantModel, int>())
              .toList(),
      note: fields[2] as String,
      quantity: fields[3] == null ? 1 : (fields[3] as num).toInt(),
      id: (fields[4] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, _$CartItemImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.product)
      ..writeByte(1)
      ..write(obj.variants)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SavedCartInfoAdapter extends TypeAdapter<_$SavedCartInfoImpl> {
  @override
  final int typeId = 14;

  @override
  _$SavedCartInfoImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SavedCartInfoImpl(
      id: fields[0] as String?,
      createdAt: fields[1] as DateTime?,
      deletedCartItems: (fields[2] as List?)?.cast<CartItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$SavedCartInfoImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt)
      ..writeByte(2)
      ..write(obj.deletedCartItems);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SavedCartInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartStateAdapter extends TypeAdapter<_$CartStateImpl> {
  @override
  final int typeId = 6;

  @override
  _$CartStateImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CartStateImpl(
      user: fields[0] as UserModel?,
      categoryProduct: fields[1] as CategoryModel?,
      cartItems:
          fields[2] == null ? const [] : (fields[2] as List).cast<CartItem>(),
      orderFee: (fields[3] as num?)?.toInt(),
      discount: fields[4] as DiscountModel?,
      customer: fields[5] as CustomerModel?,
      note: fields[6] as String?,
      table: fields[7] as TableModel?,
      paymentMethod: fields[8] as PaymentMethodModel?,
      paymentMethodCode: fields[9] as String?,
      totalPaid: (fields[10] as num?)?.toDouble(),
      tax: (fields[11] as num?)?.toDouble(),
      priceTax: (fields[12] as num?)?.toDouble(),
      paymentRequest: fields[13] as PaymentRequestModel?,
      paymentResponse: fields[14] as PaymentResponseData?,
      savedCartInfo: fields[15] as SavedCartInfo?,
      saleType: fields[16] == null ? 'price' : fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CartStateImpl obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.categoryProduct)
      ..writeByte(2)
      ..write(obj.cartItems)
      ..writeByte(3)
      ..write(obj.orderFee)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.customer)
      ..writeByte(6)
      ..write(obj.note)
      ..writeByte(7)
      ..write(obj.table)
      ..writeByte(8)
      ..write(obj.paymentMethod)
      ..writeByte(9)
      ..write(obj.paymentMethodCode)
      ..writeByte(10)
      ..write(obj.totalPaid)
      ..writeByte(11)
      ..write(obj.tax)
      ..writeByte(12)
      ..write(obj.priceTax)
      ..writeByte(13)
      ..write(obj.paymentRequest)
      ..writeByte(14)
      ..write(obj.paymentResponse)
      ..writeByte(15)
      ..write(obj.savedCartInfo)
      ..writeByte(16)
      ..write(obj.saleType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartStateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartHash() => r'867cabc683de941e4e79c152e7ed53b1b18beb06';

/// See also [Cart].
@ProviderFor(Cart)
final cartProvider = NotifierProvider<Cart, CartState>.internal(
  Cart.new,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Cart = Notifier<CartState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
