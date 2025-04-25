import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/enum/response_state.dart';
import '../../../core/utils/debouncer.dart';
import '../../../domain/entities/attendance/attendance_model.dart';
import '../../../domain/entities/general_response.dart';
import '../../../core/const/colors.dart';
import '../../../core/utils/date_utils.dart';
import '../../providers/main/attendance/attendance_provider/attendance_provider.dart';
import '../../providers/main/attendance/get_data_attendance_provider/get_data_attendance_provider.dart';
import '../../providers/main/attendance/set_attendance_param_provider/set_attendance_param_provider.dart';
import '../../widgets/core/container/custom_rounded_container.dart';
import '../../widgets/core/extension_dialog/extension_dialog.dart';
import '../../widgets/core/responsive/responsive_layout.dart';
import '../../widgets/core/text/custom_text.dart';
import '../../widgets/shared/header/report_header_mobile.dart';
import 'widgets/widgets.dart';

class AttendancePage extends ConsumerStatefulWidget {
  const AttendancePage({super.key});

  @override
  ConsumerState createState() => _AttendancePageState();
}

class _AttendancePageState extends ConsumerState<AttendancePage> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  @override
  void dispose() {
    _debouncer.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    ref.listen(attendanceProvider, (previous, next) async {
      if (next is AsyncData) {
        final value = next.value;
        if (value != null) {
          context.pop();
          await Future.delayed(const Duration(milliseconds: 100));
          if (context.mounted) {
            context.showResultDialog(baseResponse: value);
          }
        }
      } else if (next is AsyncError) {
        context.pop();
        await Future.delayed(const Duration(milliseconds: 100));
        if (context.mounted) {
          context.showResultDialog(
              baseResponse: GeneralResponse(
                  status: false, message: next.error.toString()));
        }
      } else if (next is AsyncLoading) {
        context.showLoadingDialog();
      }
    });
    ref.listen(setAttendanceParamProvider.select((value)=>value.statePhoto), (previous, next) async {
      _debouncer.run(() async {
        final currentState = ref.read(setAttendanceParamProvider);
        if (currentState.statePhoto == ResponseState.ok) {
          if (currentState.attachment != null) {
            if (context.mounted) {
              final result = await context.showPhoto(
                  title: currentState.type ?? '',
                  attachment: currentState.attachment!,
                  onRetry: () {
                    ref
                        .read(setAttendanceParamProvider.notifier)
                        .pickImage(currentState.type ?? '');
                  });
              if (result != null && result) {
                ref
                    .read(attendanceProvider.notifier)
                    .attendanceIn(currentState.attachment!);
              }
            }
          }
        }
      });

    });

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: CustomColors.primaryColor,
          child: const Column(
            children: [
              SizedBox(height: 12),
              ReportHeaderMobile(),
            ],
          ),
        ),
        // Main content
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ResponsiveLayout(
              mobileBody: AttendanceView(ref: ref),
              tabletBody: CustomRoundedContainer(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width *
                    (MediaQuery.of(context).orientation == Orientation.portrait
                        ? 1
                        : 0.5),
                child: AttendanceView(ref: ref),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key, required this.ref});

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final dateNow = DateTime.now();
    final dataAttendance = ref.watch(getDataAttendanceProvider);

    return dataAttendance.when(
      data: (attendances) {
        final AttendanceModel? attendanceModel = attendances.firstOrNull;
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const RealTimeClock(),
                      const SizedBox(height: 16),
                      CustomText(
                        formatDateInIndonesian(dateNow),
                        style: CustomTextStyle.h5
                            .copyWith(color: Colors.blue[900]),
                      ),
                      const SizedBox(height: 32),
                      InfoAttendanceWidget(
                        type: AttendanceTypeEnum.attendanceIn,
                        value: attendanceModel == null
                            ? '-'
                            : attendanceModel.haveBeenCompleted
                                ? '-'
                                : attendanceModel.clockIn?.isEmpty ?? true
                                    ? '-'
                                    : attendanceModel.clockIn!,
                      ),
                      const SizedBox(height: 16),
                      InfoAttendanceWidget(
                        type: AttendanceTypeEnum.attendanceOut,
                        value: attendanceModel == null
                            ? '-'
                            : attendanceModel.haveBeenCompleted
                                ? '-'
                                : attendanceModel.clockOut?.isEmpty ?? true
                                    ? '-'
                                    : attendanceModel.clockOut!,
                      ),
                      const SizedBox(height: 32),
                      CustomText('Riwayat Absensi Hari Ini',
                          style: CustomTextStyle.body1SemiBold),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      AttendanceModel data = attendances[index];
                      return AttendanceHistoryItem(data: data);
                    },
                    childCount: attendances.length,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(
                      height: 80), // Space to avoid overlap with button
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ButtonAttendance(
                  ref: ref,
                  attendanceModel: attendanceModel,
                ),
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => const Center(child: Text('Error')),
    );
  }
}

class AttendanceHistoryItem extends StatelessWidget {
  const AttendanceHistoryItem({
    super.key,
    required this.data,
  });

  final AttendanceModel data;

  @override
  Widget build(BuildContext context) {
    return CustomRoundedContainer(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomText(
                'Kehadiran',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CustomText(
                formatDateInIndonesian(
                    DateTime.now()), // Assuming you want to show the date
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          const Divider(thickness: 1, color: Colors.grey),
          const SizedBox(height: 8),
          // Masuk and Pulang grouped together
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        'Masuk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText('Waktu'),
                          CustomText(data.clockIn ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (data.noteClockIn != null &&
                          data.noteClockIn!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText('Catatan'),
                            CustomText(data.noteClockIn ?? '-'),
                          ],
                        ),
                      /*const SizedBox(height: 4),
                      TextButton(
                        onPressed: () async {
                          await context.showPhotoUrl(
                              title: 'Masuk',
                              imageUrl: data.attachmentClockIn ?? '',
                              context: context);
                        },
                        child: const Text('Lihat Foto'),
                      ),*/
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        'Pulang',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.green),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CustomText('Waktu'),
                          CustomText(data.clockOut ?? '-'),
                        ],
                      ),
                      const SizedBox(height: 4),
                      if (data.noteClockOut != null &&
                          data.noteClockOut!.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomText('Catatan '),
                            CustomText(data.noteClockOut ?? '-'),
                          ],
                        ),
                      /*const SizedBox(height: 4),
                      TextButton(
                        onPressed: () async {
                          await context.showPhotoUrl(
                              title: 'Pulang',
                              imageUrl: data.attachmentClockIn ?? '',
                              context: context);
                        },
                        child: const Text('Lihat Foto'),
                      ),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
