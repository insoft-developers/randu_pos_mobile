import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import '../../../../../domain/entities/transaction/cart/category_model.dart';

import '../../../../../core/utils/misc_util.dart';
import '../../../../../domain/entities/master_data/request/create_category_product/create_category_product_request_model.dart';
import '../../../../providers/main/master_data/categories_product/add/add_master_category_product_provider.dart';
import '../../../../widgets/core/buttons/primary_button.dart';
import '../../../../widgets/core/responsive/responsive_layout.dart';
import '../../../../widgets/core/text/custom_text.dart';
import '../../../../widgets/core/text_fields/custom_text_field.dart';

class CategoryProductAddPage extends ConsumerStatefulWidget {
  const CategoryProductAddPage({super.key, this.model});

  final CategoryModel? model;

  @override
  ConsumerState createState() => _ProductAddPageState();
}

class _ProductAddPageState extends ConsumerState<CategoryProductAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model != null) {
        nameController.text = widget.model?.name ?? '';
        codeController.text = widget.model?.code ?? '';
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(addMasterCategoryProductProvider, (previous, next) {
      final value = next.value;
      if (next is AsyncData) {
        if (value != null) {
          showToast('${value.message}');
          context.pop(true);
        }
      } else if (next is AsyncError) {
        showToast(next.error.toString());
      }
    });

    final addState = ref.watch(addMasterCategoryProductProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            CustomText('${widget.model != null ? 'Ubah' : 'Tambah'} Kategori'),
      ),
      body: ResponsiveLayout(
          mobileBody: _mobileView(context), tabletBody: _mobileView(context)),
    );
  }

  Widget _mobileView(
    BuildContext context,
  ) {
    final isEdit = widget.model != null;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        children: [
          nameCategoryProduct(),
          const SizedBox(
            height: 16,
          ),
          codeCategoryProduct(),
          const SizedBox(
            height: 32,
          ),
          buttonSubmit(isEdit: isEdit, id: widget.model?.id),
        ],
      ),
    );
  }

  PrimaryButton buttonSubmit({bool isEdit = false, int? id}) {
    return PrimaryButton(
      label: 'Simpan',
      isLoading: ref.watch(addMasterCategoryProductProvider).isLoading,
      onTap: () {
        // Validate the form fields
        if (_formKey.currentState!.validate()) {
          // If the form is valid, save the form fields
          _formKey.currentState!.save();
          // print()
          final request = CreateCategoryProductRequestModel(
              name: nameController.text, code: codeController.text);
          ref
              .read(addMasterCategoryProductProvider.notifier)
              .saveCategoryProduct(request, isEdit: isEdit, id: id);
        }
      },
    );
  }

  Column codeCategoryProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Kode'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          hintText: 'Cth: NGIA',
          controller: codeController,
          onChanged: (value) {
            print('set sku $value');
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

  Column nameCategoryProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomText('Nama Kategori'),
        const SizedBox(
          height: 8,
        ),
        CustomTextField(
          controller: nameController,
          hintText: 'Cth: Sembako',
          onChanged: (value) {
            if (value.isNotEmpty) {
              final alias = generateAlias(value);
              codeController.text = alias;
            }
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Harap isi nama kategori';
            }
            return null;
          },
        ),
      ],
    );
  }
}
