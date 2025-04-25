import '../../../../../data/repositories/i_report_repository.dart';
import '../../../../entities/general_response.dart';
import '../../../../entities/result.dart';
import '../../../usecase.dart';
import 'set_table_reservation_params.dart';

class SetTableReservationUc implements UseCase<Result<GeneralResponse>,SetTableReservationParams>{
  final IReportRepository reportRepository;

  SetTableReservationUc({required this.reportRepository});
  @override
  Future<Result<GeneralResponse>> call(SetTableReservationParams params) async{
    var response = await reportRepository.setTableReservation(tableIds: params.tableIds, status: params.status);
    return switch (response){
      Success(value: final response) => Result.success(response),
      Failed(:final message) => Result.failed(message),
    };
  }

}