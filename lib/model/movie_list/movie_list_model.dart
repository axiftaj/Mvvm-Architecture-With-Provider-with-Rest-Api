// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
part 'movie_list_model.freezed.dart';
part 'movie_list_model.g.dart';

@Freezed()
class MovieListModel with _$MovieListModel {

  factory MovieListModel({
    @Default('') String total,
    @Default(0) int page ,
    @Default(0) int pages,
    @Default([]) List<TvShows> tv_shows

}) = _MovieListModel;

  factory MovieListModel.fromJson(Map<String, dynamic> json) => _$MovieListModelFromJson(json);
}

@Freezed()
class TvShows with _$TvShows {

  factory TvShows({
    @Default('') String name,
    @Default('') String permalink ,
    @Default('') String endDate,
    @Default('') String network,
    @Default('') String imageThumbnailPath,
    @Default('') String status,

  }) = _TvShows;

  factory TvShows.fromJson(Map<String, dynamic> json) => _$TvShowsFromJson(json);
}