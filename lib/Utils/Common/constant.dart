class ApiConstant {
  static const String base = "https://wokastaging.in/";

  static const String episdoes = '${base}api/episode_listing';
  static const String season = '${base}api/season_episode_listing';
  static const String soMuchToWatch = '${base}api/watch_show_listing';
  static const String addToFav = '${base}api/favourite_add';
  static const String removeFromFav = '${base}api/favourite_remove';
  static const String addToLike = '${base}api/post_like';
  static const String removeFromLiked = '${base}api/post_unlike';
  static const String continueWatching = '${base}api/continue_watching';
}