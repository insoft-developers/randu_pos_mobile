import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/entities/customer/customer_model.dart';
part 'dropdown_search_customer_key_provider.g.dart';

@riverpod
GlobalKey<DropdownSearchState<CustomerModel>> dropdownSearchCustomerKey(DropdownSearchCustomerKeyRef ref) {
  return GlobalKey<DropdownSearchState<CustomerModel>>();
}