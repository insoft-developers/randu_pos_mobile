import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../../domain/entities/transaction/cart/category_model.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../../../core/const/colors.dart';
import '../../../../../core/utils/currency_utils.dart';
import '../../../../../core/utils/misc_util.dart';
import '../../../../../domain/entities/master_data/request/create_product/create_product_request_model.dart';
import '../../../../../domain/entities/transaction/cart/product_model.dart';
import '../../../../providers/main/master_data/products/add/add_master_products_provider.dart';
import '../../../../widgets/core/buttons/primary_button.dart';
import '../../../../widgets/core/dropdown/custom_dropdown_button_form_field.dart';
import '../../../../widgets/core/loading/skeleton.dart';
import '../../../../widgets/core/responsive/responsive_layout.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';

class ProductAddPage extends ConsumerStatefulWidget {
  const ProductAddPage({super.key, this.model});

  final ProductModel? model;

  @override
  ConsumerState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends ConsumerState<ProductAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController skuController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController priceTaController = TextEditingController();
  TextEditingController priceMpController = TextEditingController();
  TextEditingController priceCusController = TextEditingController();
  TextEditingController barcodeController = TextEditingController();
  final CurrencyInputFormatter _formatter =
      CurrencyInputFormatter(symbol: 'Rp ');

  VoidCallback? priceListener;
  VoidCallback? priceTaListener;
  VoidCallback? priceMpListener;
  VoidCallback? priceCusListener;

  void _formatInput(TextEditingController controller) {
    String current = controller.text;

    // Only format if there's a change in the numeric value
    String numericOnly = _formatter.stripFormat(current);
    String formatted = _formatter.formatCurrency(numericOnly);

    if (current != formatted) {
      controller.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(
          offset: formatted.length,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(addMasterProductsProvider.notifier).getCategories();
      if (widget.model != null) {
        CreateProductRequestModel request = CreateProductRequestModel(
          name: widget.model?.name ?? '',
          categoryId: widget.model?.categoryId ?? 0,
          sku: widget.model?.sku ?? '',
          price: widget.model?.price ?? 0,
          priceTa: widget.model?.priceTakeAway ?? 0,
          priceMp: widget.model?.priceMarketPlace ?? 0,
          priceCus: widget.model?.priceCustom ?? 0,
          barcode: widget.model?.barcode ?? '',
        );
        await ref
            .read(addMasterProductsProvider.notifier)
            .setRequestModel(request);
        await ref
            .read(addMasterProductsProvider.notifier)
            .setProduct(widget.model!);

        nameController.text = widget.model?.name ?? '';
        skuController.text = widget.model?.sku ?? '';
        String formatPrice = formatStringIDRToCurrency(
            text: widget.model?.price.toString() ?? '',
            symbol: 'Rp ',
            isDouble: false);
        priceController.text = formatPrice;
        String formatPriceTa = formatStringIDRToCurrency(
            text: widget.model?.priceTakeAway.toString() ?? '',
            symbol: 'Rp ',
            isDouble: false);
        priceTaController.text = formatPriceTa;
        String formatPriceMp = formatStringIDRToCurrency(
            text: widget.model?.priceMarketPlace.toString() ?? '',
            symbol: 'Rp ',
            isDouble: false);
        priceMpController.text = formatPriceMp;
        String formatPriceCus = formatStringIDRToCurrency(
            text: widget.model?.priceCustom.toString() ?? '',
            symbol: 'Rp ',
            isDouble: false);
        priceCusController.text = formatPriceCus;
        barcodeController.text = widget.model?.barcode ?? '';
      }

      priceListener = () => _formatInput(priceController);
      priceTaListener = () => _formatInput(priceTaController);
      priceMpListener = () => _formatInput(priceMpController);
      priceCusListener = () => _formatInput(priceCusController);

      priceController.addListener(priceListener!);
      priceTaController.addListener(priceTaListener!);
      priceMpController.addListener(priceMpListener!);
      priceCusController.addListener(priceCusListener!);
    });
  }

  @override
  void dispose() {
    // Remove the listeners using the variables
    if (priceListener != null) {
      priceController.removeListener(priceListener!);
    }
    if (priceTaListener != null) {
      priceTaController.removeListener(priceTaListener!);
    }
    if (priceMpListener != null) {
      priceMpController.removeListener(priceMpListener!);
    }
    if (priceCusListener != null) {
      priceCusController.removeListener(priceCusListener!);
    }
    nameController.dispose();
    skuController.dispose();
    priceController.dispose();
    priceTaController.dispose();
    priceMpController.dispose();
    priceCusController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addMasterProductsProvider, (previous, next) {
      final value = next.value;
      if (next is AsyncData) {
        if (value?.response != null) {
          showToast('${value?.response?.message}');
          context.pop(true);
        }
      } else if (next is AsyncError) {
        showToast(next.error.toString());
      }
    });

    final addState = ref.watch(addMasterProductsProvider);
    final categories = addState.value?.categoriesProduct;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText('${widget.model != null ? 'Ubah' : 'Tambah'} Produk'),
      ),
      body: ResponsiveLayout(
          mobileBody: _mobileView(categories, context, addState),
          tabletBody: _tabletView(categories, context, addState)),
    );
  }

  Widget _mobileView(List<CategoryModel>? categories, BuildContext context,
      AsyncValue<AddMasterProductsState> addState) {
    final isEdit = widget.model != null;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          productName(),
          const SizedBox(
            height: 16,
          ),
          productCategory(categories, context, addState),
          const SizedBox(
            height: 16,
          ),
          productSku(),
          const SizedBox(
            height: 16,
          ),
          productPrice(),
          const SizedBox(
            height: 16,
          ),
          productPriceTa(),
          const SizedBox(
            height: 16,
          ),
          productPriceMp(),
          const SizedBox(
            height: 16,
          ),
          productPriceCus(),
          const SizedBox(
            height: 16,
          ),
          barcodeProduct(context),
          const SizedBox(
            height: 32,
          ),
          buttonSubmit(isEdit: isEdit),
        ],
      ),
    );
  }

  Widget _tabletView(List<CategoryModel>? categories, BuildContext context,
      AsyncValue<AddMasterProductsState> addState) {
    final isEdit = widget.model != null;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          productName(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(child: productCategory(categories, context, addState)),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: productSku()),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          productPrice(),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(child: productPriceTa()),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: productPriceMp()),
              const SizedBox(
                width: 16,
              ),
              Expanded(child: productPriceCus()),
            ],
          ),
          const SizedBox(height: 16),
          barcodeProduct(context),
          const SizedBox(
            height: 32,
          ),
          buttonSubmit(isEdit: isEdit),
        ],
      ),
    );
  }

  PrimaryButton buttonSubmit({bool isEdit = false}) {
    return PrimaryButton(
      label: 'Simpan',
      isLoading: ref.watch(addMasterProductsProvider).isLoading,
      onTap: () {
        // Validate the form fields
        if (_formKey.currentState!.validate()) {
          // If the form is valid, save the form fields
          _formKey.currentState!.save();
          // print()
          ref
              .read(addMasterProductsProvider.notifier)
              .saveProduct(isEdit: isEdit);
        }
      },
    );
  }

  Column barcodeProduct(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Barcode produk'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Barcode',
          controller: barcodeController,
          maxLine: 1,
          textInputAction: TextInputAction.done,
          onChanged: (value) async {
            if (value.isEmpty) return;
            print('barcode $value');
            ref.read(addMasterProductsProvider.notifier).setBarcode(value);
          },
          suffixIcon: GestureDetector(
              child: const Icon(Icons.qr_code_scanner),
              onTap: () async {
                String? res = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Scan Barcode',
                    centerTitle: true,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: true,
                  delayMillis: 100,
                  scanType: ScanType.barcode,
                  scanFormat: ScanFormat.ONLY_BARCODE,
                  cameraFace: CameraFace.back,
                  child: const Icon(Icons.camera_alt),
                );
                barcodeController.text = res!;
                ref.read(addMasterProductsProvider.notifier).setBarcode(res);
                FocusManager.instance.primaryFocus?.unfocus();
              }),
        ),
      ],
    );
  }

  Column productPriceCus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Harga Custom'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Cth: Rp. 100.000',
          textInputType: TextInputType.number,
          controller: priceCusController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              final priceRaw = formatIDRCurrencyToStringDigit(value);
              final price = int.parse(priceRaw);
              ref.read(addMasterProductsProvider.notifier).setPriceCus(price);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan harga custom';
            }
            return null;
          },
        ),
      ],
    );
  }

  Column productPriceMp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Harga MarketPlace'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Cth: Rp. 100.000',
          textInputType: TextInputType.number,
          controller: priceMpController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              final priceRaw = formatIDRCurrencyToStringDigit(value);
              final price = int.parse(priceRaw);
              ref.read(addMasterProductsProvider.notifier).setPriceMp(price);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan harga marketplace';
            }
            return null;
          },
        ),
      ],
    );
  }

  Column productPriceTa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Harga Take Away'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Cth: Rp. 100.000',
          textInputType: TextInputType.number,
          controller: priceTaController,
          onChanged: (value) {
            if (value.isNotEmpty) {
              final priceRaw = formatIDRCurrencyToStringDigit(value);
              final price = int.parse(priceRaw);
              ref.read(addMasterProductsProvider.notifier).setPriceTa(price);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan harga take away';
            }
            return null;
          },
        ),
      ],
    );
  }

  Column productPrice() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Harga Produk'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          controller: priceController,
          hintText: 'Cth: Rp. 100.000',
          textInputType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty) {
              final priceRaw = formatIDRCurrencyToStringDigit(value);
              final price = int.parse(priceRaw);
              ref.read(addMasterProductsProvider.notifier).setPrice(price);
              ref.read(addMasterProductsProvider.notifier).setPriceTa(price);
              ref.read(addMasterProductsProvider.notifier).setPriceMp(price);
              ref.read(addMasterProductsProvider.notifier).setPriceCus(price);
              priceTaController.text = value;
              priceMpController.text = value;
              priceCusController.text = value;
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan harga';
            }
            return null;
          },
        ),
      ],
    );
  }

  Column productSku() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('SKU Produk'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Cth: NGIA',
          controller: skuController,
          onChanged: (value) {
            print('set sku $value');
            ref.read(addMasterProductsProvider.notifier).setSku(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap masukkan SKU';
            }
            return null;
          },
        ),
      ],
    );
  }

  CategoryModel? findCategory(int? id, List<CategoryModel>? categories) {
    if (categories == null || categories.isEmpty) {
      return null;
    }
    return categories.firstWhereOrNull((element) => element.id == id);
  }

  Column productCategory(List<CategoryModel>? categories, BuildContext context,
      AsyncValue<AddMasterProductsState> addState) {
    CategoryModel? categoryModel = widget.model == null
        ? null
        : findCategory(widget.model?.categoryId, categories);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Kategori'),
        const SizedBox(
          height: 8,
        ),
        categories == null
            ? const Skeleton(
                width: double.infinity,
                height: 40,
                radius: 8,
              )
            : categories.isEmpty
                ? const CustomText('Tidak ada kategori')
                : CustomDropdownButtonFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Harap pilih kategori';
                      }
                      return null;
                    },
                    context: context,
                    color: CustomColors.white,
                    items: categories
                        .map((value) => DropdownMenuItem(
                            value: value,
                            child: CustomText(
                              value.name ?? '',
                              style: const TextStyle(
                                  color: CustomColors.black, fontSize: 14),
                            )))
                        .toList(),
                    hint: const CustomText('Pilih Kategori'),
                    value: categoryModel ?? addState.value?.selectedCategory,
                    onChanged: (value) {
                      print(value);
                      ref
                          .read(addMasterProductsProvider.notifier)
                          .selectCategory(value);
                    }),
      ],
    );
  }

  Column productName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Nama Produk'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          controller: nameController,
          hintText: 'Cth: Nasi Goreng Ikan Asin',
          onChanged: (value) {
            ref.read(addMasterProductsProvider.notifier).setName(value);
            if (value.isNotEmpty) {
              final alias = generateAlias(value);
              skuController.text = alias;
              ref.read(addMasterProductsProvider.notifier).setSku(alias);
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap isi nama produk';
            }
            return null;
          },
        ),
      ],
    );
  }
}
