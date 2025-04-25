import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../domain/entities/customer/customer_model.dart';
import '../../../../domain/entities/customer/get_customer_request_model.dart';
import '../../../../core/const/colors.dart';
import '../../../providers/main/cart/cart_provider.dart';
import '../../../providers/main/customer/get_customers/get_customer_provider.dart';
import '../../../providers/misc/dropdown/dropdown_search_customer_key_provider.dart';

class SelectOrInputCustomer extends ConsumerWidget {
  const SelectOrInputCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: CustomColors.primaryColor),
      borderRadius: BorderRadius.circular(8),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: DropdownSearch<CustomerModel>(
        key: ref.watch(dropdownSearchCustomerKeyProvider),
        enabled: true,
        selectedItem: ref.watch(cartProvider.select((value) => value.customer)),
        clearButtonProps: const ClearButtonProps(
            icon: Icon(Icons.clear, color: CustomColors.primaryColor)),
        popupProps: PopupProps.dialog(
            dialogProps: const DialogProps(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            loadingBuilder: (context, isLoading) {
              return const Center(child: CircularProgressIndicator());
            },
            listViewProps: const ListViewProps(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
            title: const SizedBox(
              height: 16,
            ),
            fit: FlexFit.loose,
            isFilterOnline: true,
            searchDelay: const Duration(milliseconds: 500),
            searchFieldProps: TextFieldProps(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: InputDecoration(
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder)),
            emptyBuilder: (context, empty) {
              return ListTile(
                  onTap: () {
                    ref
                        .read(cartProvider.notifier)
                        .setCustomer(CustomerModel(name: empty));
                    context.pop();
                    context.pop();
                  },
                  title: Text(empty));
            },
            showSearchBox: true),
        dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
                focusedBorder: outlineInputBorder,
                iconColor: CustomColors.primaryColor,
                enabledBorder: outlineInputBorder,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: 'Cari Pelanggan',
                border: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: CustomColors.primaryColor),
                    borderRadius: BorderRadius.circular(8)))),
        // dropdownBuilder: (context, state) {
        //   return ListTile(
        //       onTap: () {
        //         ref
        //             .read(cartProvider.notifier)
        //             .setCustomer(CustomerModel(name: state?.name??''));
        //         context.pop();
        //       },
        //       title: Text(state?.name ?? '-'));
        // },
        asyncItems: (String filter) async {
          var response = await ref.read(getCustomersProvider(
              request: GetCustomerRequestModel(search: filter))
              .future);
          if (response.isEmpty) {
            return [
              CustomerModel(name: filter),
            ];
          } else {
            return response;
          }
        },
        itemAsString: (CustomerModel u) => u.name ?? '-',
        onChanged: (CustomerModel? data) {
          print(data);
          if (data == null) return;
          ref.read(cartProvider.notifier).setCustomer(data);
          context.pop();
        },
      ),
    );
  }
}