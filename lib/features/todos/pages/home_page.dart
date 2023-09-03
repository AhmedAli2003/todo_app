import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_app/common/theme/app_colors.dart';
import 'package:todo_app/common/theme/app_style.dart';
import 'package:todo_app/common/widgets/custom_expansion_tile.dart';
import 'package:todo_app/common/widgets/custom_text_field.dart';
import 'package:todo_app/common/widgets/height_spacer.dart';
import 'package:todo_app/common/widgets/reusable_text.dart';
import 'package:todo_app/common/widgets/width_spacer.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> with SingleTickerProviderStateMixin {
  final _searchController = TextEditingController();
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      'Dashboard',
                      style: appStyle(18, AppColors.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.h,
                      decoration: const BoxDecoration(
                        color: AppColors.kLight,
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.add, color: AppColors.kBkDark),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              CustomTextField(
                hintText: 'Search',
                controller: _searchController,
                prefixIcon: Container(
                  padding: const EdgeInsets.all(14),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(AntDesign.search1, color: AppColors.kGreyLight),
                  ),
                ),
                suffixIcon: const Icon(FontAwesome.sliders, color: AppColors.kGreyLight),
              ),
              const HeightSpacer(15),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).w,
          child: ListView(
            children: [
              const HeightSpacer(25),
              Row(
                children: [
                  const Icon(FontAwesome.tasks, size: 20, color: AppColors.kLight),
                  const WidthSpacer(12),
                  ReusableText(
                    'Today\'s Tasks',
                    style: appStyle(18, AppColors.kLight, FontWeight.bold),
                  ),
                ],
              ),
              const HeightSpacer(25),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.kLight,
                  borderRadius: BorderRadius.circular(kRadius),
                ),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: BoxDecoration(
                    color: AppColors.kGreyLight,
                    borderRadius: BorderRadius.circular(kRadius),
                  ),
                  labelPadding: EdgeInsets.zero,
                  isScrollable: false,
                  labelColor: AppColors.kBlueLight,
                  labelStyle: appStyle(24, AppColors.kBlueLight, FontWeight.bold),
                  unselectedLabelColor: AppColors.kLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            'Pending',
                            style: appStyle(16, AppColors.kBkDark, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: kWidth * 0.5,
                        child: Center(
                          child: ReusableText(
                            'Completed',
                            style: appStyle(16, AppColors.kBkDark, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const HeightSpacer(20),
              SizedBox(
                height: kHeight * 0.33,
                width: kWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kRadius),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        color: AppColors.kBkLight,
                        height: kHeight * 0.33,
                      ),
                      Container(
                        color: AppColors.kGreen,
                        height: kHeight * 0.33,
                      ),
                    ],
                  ),
                ),
              ),
              const HeightSpacer(20),
              const CustomExpansionTile(),
            ],
          ),
        ),
      ),
    );
  }
}
