import '../../../../../data/repositories/i_report_repository.dart';
import '../../../../entities/general_response.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';
import 'set_status_transaction_param.dart';

class SetTransactionStatusUC
    implements UseCase<Result<GeneralResponse>, SetStatusTransactionParam> {
  final IReportRepository reportRepository;

  SetTransactionStatusUC({required this.reportRepository});
  @override
  Future<Result<GeneralResponse>> call(SetStatusTransactionParam param) async {
    return reportRepository.setStatusTransaction(
        transactionId: param.transactionId, status: param.status);
  }
}
