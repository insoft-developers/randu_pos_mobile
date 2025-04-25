import '../../domain/entities/general_request_model.dart';
import '../../domain/entities/general_response.dart';
import '../../domain/entities/report/daily_recap/daily_recap_model.dart';
import '../../domain/entities/report/outlet_expense/outlet_expense_model.dart';
import '../../domain/entities/report/qr_table/table_status_enum.dart';
import '../../domain/entities/report/transaction_management/status_payment_enum.dart';
import '../../domain/entities/report/transaction_management/status_transaction_enum.dart';
import '../../domain/entities/report/transaction_management/transaction_management_model.dart';
import '../../domain/entities/result.dart';
import '../../domain/entities/transaction/cart/table_model.dart';

abstract interface class IReportRepository {
  //LIST REPORT
  // GET TRANSACTION MANAGEMENT DATA
  Future<Result<(List<TransactionManagementModel>, int?)>>
      getTransactionManagement({required GeneralRequestModel request});

  // GET DAILY RECAP DATA
  Future<Result<(List<DailyRecapModel>, int?)>> getDailyRecap(
      {required GeneralRequestModel request});

  // GET TABLE DATA
  Future<Result<List<TableModel>>> getTable(
      {required GeneralRequestModel request});

  // GET OUTLET EXPENSES
  Future<Result<(List<OutletExpenseModel>, int?)>> getOutletExpense(
      {required GeneralRequestModel request});

  // CREATE OUTLET EXPENSES
  Future<Result<GeneralResponse>> createOutletExpense(
      {required int amount, required String name});

  //ACTION REPORT

  //SET TABLE RESERVATION
  Future<Result<GeneralResponse>> setTableReservation(
      {required List<int> tableIds, required TableStatusEnum status});

  // SET STATUS TRANSACTION
  Future<Result<GeneralResponse>> setStatusTransaction(
      {required int transactionId, required StatusTransactionEnum status});

  // SET STATUS PAYMENT
  Future<Result<GeneralResponse>> setStatusPayment(
      {required int transactionId, required StatusPaymentEnum status});
}
