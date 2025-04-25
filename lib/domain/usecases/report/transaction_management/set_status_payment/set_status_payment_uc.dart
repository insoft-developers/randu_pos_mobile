import '../../../../../data/repositories/i_report_repository.dart';
import '../../../../entities/general_response.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';
import 'set_status_payment_params.dart';

class SetStatusPaymentUC
    implements UseCase<Result<GeneralResponse>, SetStatusPaymentParams> {
  final IReportRepository reportRepository;

  SetStatusPaymentUC({required this.reportRepository});
  @override
  Future<Result<GeneralResponse>> call(SetStatusPaymentParams param) async {
    return reportRepository.setStatusPayment(
        transactionId: param.transactionId, status: param.status);
  }
}
