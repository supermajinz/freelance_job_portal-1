import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freelance_job_portal/core/utils/size_config.dart';
import 'package:freelance_job_portal/core/widget/space.dart';
import 'package:freelance_job_portal/features/home/data/model/skills/skills.dart';
import 'package:freelance_job_portal/features/projects/presentation/views/widget/custom_project_card.dart';
import 'package:freelance_job_portal/features/searsh/presentation/views/widget/custom_chip_searsh.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widget/custom_search.dart';
import '../../view_models/search_bloc/search_bloc.dart';

class SearshBody extends StatefulWidget {
  const SearshBody({super.key, required this.filters});
  final Map<String, dynamic> filters;

  @override
  State<SearshBody> createState() => _SearshBodyState();
}

class _SearshBodyState extends State<SearshBody> {
  @override
  void initState() {
    _getProject();
    super.initState();
  }

  _getProject() {
    final filters = Map.from(widget.filters);
    if (filters.containsKey("skills")) {
      filters.update(
        "skills",
        (value) => value.map((e) => e.id).toList(),
      );
    }
    if (filters.containsKey("categories")) {
      filters.update("categories", (value) => value.map((e) => e.id).toList());
    }

    context.read<SearchBloc>().add(SearchProjectsEvent(
          filters: {
            ...filters,
            if (searchController.text.isNotEmpty)
              "search": searchController.text,
            "sortBy": _currentSortType.name,
            "sortDes": !_isAscending,
            //sort
          },
        ));
  }

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return ListView(children: [
          Row(
            children: [
              Expanded(
                flex: 6,
                child: CustomSearch(
                  myController: searchController,
                  onPressedNOT: () {},
                  onSubmit: (_) {
                    _getProject();
                  },
                  onPressedSer: () {
                    _getProject();
                  },
                  title: "ابحث....",
                ),
              ),
              Expanded(
                flex: 1,
                child: IconButton(
                  icon: _getSortIcon(),
                  onPressed: () {
                    setState(() {
                      _isAscending = !_isAscending;
                    });
                    // _sortProjects();
                  },
                  iconSize: 24,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  _getSortDescription(),
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                flex: 1,
                child: PopupMenuButton<SortType>(
                  icon: const Icon(Icons.sort_rounded, size: 30),
                  onSelected: (SortType result) {
                    setState(() {
                      if (_currentSortType == result) {
                        _isAscending = !_isAscending;
                      } else {
                        _currentSortType = result;
                        _isAscending = true;
                      }
                    });
                    // _sortProjects();
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<SortType>>[
                    const PopupMenuItem<SortType>(
                      value: SortType.Budget,
                      child: Text('ترتيب حسب الميزانية'),
                    ),
                    const PopupMenuItem<SortType>(
                      value: SortType.NoOfOffers,
                      child: Text('ترتيب حسب عدد العروض'),
                    ),
                    const PopupMenuItem<SortType>(
                      value: SortType.Duration,
                      child: Text('ترتيب حسب المدة'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: SizeConfig.defaultSize! * 1),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                      onPressed: () {
                        GoRouter.of(context)
                            .push("/sort", extra: widget.filters);
                      },
                      icon: Icon(
                        Icons.tune,
                        size: SizeConfig.defaultSize! * 3,
                      )),
                ),
                Expanded(
                  flex: 5,
                  child: Wrap(
                    alignment: WrapAlignment.end,
                    spacing: SizeConfig.defaultSize! * .5,
                    children: [
                      if (widget.filters.containsKey("skills"))
                        ...(widget.filters['skills'] as List<Skills>).map(
                          (e) => CustomChipSearsh(text: e.name),
                        ),
                      if (widget.filters.containsKey("minBudget") &&
                          widget.filters.containsKey("maxBudget"))
                        CustomChipSearsh(
                          text:
                              "${widget.filters['minBudget']} - ${widget.filters['maxBudget']}  ل.س",
                        ),
                      if (widget.filters.containsKey("minDuration") &&
                          widget.filters.containsKey("maxDuration"))
                        CustomChipSearsh(
                          text:
                              "${widget.filters['minDuration']} - ${widget.filters['maxDuration']}  يوم",
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const VirticalSpace(1),
          if (state is SearchLoading)
            const Center(child: CircularProgressIndicator())
          else if (state is SearchSuccess)
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizeConfig.defaultSize! * 1),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.projects.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return CustomProjectCard(project: state.projects[index]);
                },
              ),
            )
          else if (state is SearchFailure)
            Center(child: Text(state.errMessage)),
        ]);
      },
    );
  }
}

enum SortType {
  Budget,
  NoOfOffers,
  Duration,
  CreateDate,
}

SortType _currentSortType = SortType.Budget;
bool _isAscending = true;

// add sort
// void _sortProjects() {
//   final filters = Map.from(widget.filters);
//   String sortField;
//   switch (_currentSortType) {
//     case SortType.budget:
//       sortField = 'budget';
//       break;
//     case SortType.offers:
//       sortField = 'offers_count';
//       break;
//     case SortType.duration:
//       sortField = 'duration';
//       break;
//   }
//   filters['sort'] = _isAscending ? '${sortField}_asc' : '${sortField}_desc';

//   context.read<SearchBloc>().add(SearchProjectsEvent(
//     filters: {
//       ...filters,
//       if (searchController.text.isNotEmpty)
//         "search": searchController.text,
//     },
//   ));
// }

Icon _getSortIcon() {
  return Icon(
    _isAscending ? Icons.arrow_upward : Icons.arrow_downward,
    color: Colors.blue,
  );
}

String _getSortDescription() {
  String direction = _isAscending ? 'الأكثر' : 'الأقل';
  switch (_currentSortType) {
    case SortType.Budget:
      return '$direction ميزانية';
    case SortType.NoOfOffers:
      return '$direction عدد عروض';
    case SortType.Duration:
      return '$direction مدة';
    case SortType.CreateDate:
      return '$direction تاريخ الأنشاء';
    default:
      return 'ترتيب $direction';
  }
}
