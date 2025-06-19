import 'package:demo/core/themes/color_palette.dart';
import 'package:demo/core/ui/custom_text_field.dart';
import 'package:demo/features/home/presentation/blocs/shoe_bloc.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:demo/features/home/presentation/widgets/banner_view.dart';
import 'package:demo/features/home/presentation/widgets/shoe_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<ShoeBloc>().add(GetShoesEvent());
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(icon: Icon(Icons.search), hintText: "Search"),
        BannerView(),
        Expanded(
          child: BlocBuilder<ShoeBloc, ShoeState>(
            builder: (context, state) {
              if (state is LoadingShoeState) {
                return Center(
                  child: CircularProgressIndicator(color: ColorPalette.primary),
                );
              } else if (state is LoadedShoeState) {
                return ShoeListView(shoes: state.shoes);
              } else if (state is ErrorShoeState) {
                Text(state.errorMessage);
              }
              return Center();
            },
          ),
        ),
      ],
    );
  }
}
