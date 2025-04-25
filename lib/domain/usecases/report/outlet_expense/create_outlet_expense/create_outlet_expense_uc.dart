import '../../../../../data/repositories/i_report_repository.dart';
import '../../../../entities/general_response.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';

part 'create_outlet_expense_params.dart';

class CreateOutletExpenseUC
    implements UseCase<Result<GeneralResponse>, CreateOutletExpenseParams> {
  final IReportRepository reportRepository;

  CreateOutletExpenseUC({required this.reportRepository});
  @override
  Future<Result<GeneralResponse>> call(CreateOutletExpenseParams params) async {
    print('create expenses use case');
    var response = await reportRepository.createOutletExpense(
        amount: params.amount, name: params.name);
    if (response is Success) {
      return switch (response) {
        Success(value: final response) => Result.success(response),
        Failed(:final message) => Result.failed(message),
      };
    } else {
      return const Result.failed('Gagal mencatat pengeluaran');
    }
  }
}
