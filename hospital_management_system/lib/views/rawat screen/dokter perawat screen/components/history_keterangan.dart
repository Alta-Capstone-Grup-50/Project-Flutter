import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utilities/common/progress_dialog.dart';
import '../../../../viewModels/rawatJalan viewModel/rawatJalan_viewModel.dart';
import '/utilities/constants/responsive.dart';

class HistoryKeterangan extends StatelessWidget {
  const HistoryKeterangan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RawatJalanViewModel functionProvider = context.read<RawatJalanViewModel>();
    RawatJalanViewModel valueProvider = context.watch<RawatJalanViewModel>();

    functionProvider.getDataApiRawatJalan();

    final ProgressDialog loadingWidget = ProgressDialog(
      context,
      isDismissible: false,
    );
    loadingWidget.style(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30));

    return AlertDialog(
      content: Stack(
        children: [
          SizedBox(
            width: maxWidth / 1.6,
            height: (Responsive.isMobile(context))
                ? MediaQuery.of(context).size.height / 1.3
                : MediaQuery.of(context).size.height / 1.4,
            child: Padding(
                padding: EdgeInsets.only(
                    right: (Responsive.isMobile(context)) ? 0 : 30),
                child: showDetail(context, valueProvider)),
          ),
          (Responsive.isMobile(context))
              ? const SizedBox.shrink()
              : Positioned(
                  right: -5,
                  top: -5,
                  child: InkResponse(
                    radius: 25,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: (Responsive.isMobile(context)) ? 25 : 30,
                    ),
                  ),
                ),
          (!Responsive.isMobile(context))
              ? Positioned(
                  right: -5,
                  top: -5,
                  child: InkResponse(
                    radius: 25,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: (Responsive.isMobile(context)) ? 25 : 30,
                    ),
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }

  Widget showDetail(BuildContext context, RawatJalanViewModel valueProvider) {
    List historyKeteranganLen = [];
    List namaPasien = [];
    valueProvider.listRawatJalanData.forEach((element) {
      if (element.keterangan!.isNotEmpty) {
        historyKeteranganLen.add(element.keterangan);
        namaPasien.add(element.nama);
      }
    });

    return Stack(
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(
              left: (Responsive.isMobile(context)) ? 0 : 40,
              bottom: 20,
              top: 20,
            ),
            child: (Responsive.isMobile(context))
                ? const SizedBox.shrink()
                : Text(
                    'History Keterangan',
                    style: TextStyle(
                        fontSize: (Responsive.isMobile(context)) ? 24 : 26,
                        fontWeight: FontWeight.w700),
                  ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: historyKeteranganLen.length,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: (Responsive.isMobile(context)) ? 0 : 40,
                        right: (Responsive.isMobile(context)) ? 0 : 20),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          '${historyKeteranganLen[index]}',
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text('Nama pasien : ${namaPasien[index]}'),
                      ),
                    ),
                  );
                })),
          ),
        ]),
        (Responsive.isMobile(context))
            ? Positioned(
                left: -15,
                top: -5,
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 2,
                        ),
                        child: IconButton(
                            splashRadius: 1,
                            icon: const Icon(
                              Icons.arrow_back_ios_new,
                              size: 19,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                      const Text(
                        'History Keterangan',
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}

Future openHistoryKeterangan(BuildContext context) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const HistoryKeterangan());
}
