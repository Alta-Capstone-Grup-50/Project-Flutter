import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewModels/viewModelGhoib.dart';
import 'package:provider/provider.dart';

import '../../utilities/common/input.dart';
import '../../utilities/constants/color.dart';

class Ghoib extends StatelessWidget {
  Ghoib({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ArtisDetailViewModel function = context.read<ArtisDetailViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Play List'),
          centerTitle: true,
        ),
        body: Consumer<ArtisDetailViewModel>(
          builder: ((context, value, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    margin: const EdgeInsets.only(
                        bottom: 20, top: 25, left: 20, right: 20),
                    child: Input(
                      textInputAction: TextInputAction.done,
                      controller: searchController,
                      onChanged: function.onSearch,
                      hintText: 'Cari lagu',
                      backgroundColor: const Color(0xFFEBEBEB),
                      prefixIcon: Icon(
                        Icons.search,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: value.listResultDetail.length,
                      itemBuilder: ((context, index) {
                        return ListTile(
                          leading: Image.network(
                              value.listResultDetail[index].artworkUrl30!),
                          title:
                              Text(value.listResultDetail[index].artistName!),
                          subtitle:
                              Text(value.listResultDetail[index].trackName!),
                        );
                      }),
                    ),
                  ),
                ]);
          }),
        ));
  }
}
