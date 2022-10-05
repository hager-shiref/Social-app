abstract class SocialStates {}

class SocialInitialState extends SocialStates {}

//get user
class SocialGetUserLoadingState extends SocialStates {}

class SocialGetUserSuccessState extends SocialStates {}

class SocialGetUserErrorState extends SocialStates {
  final String error;
  SocialGetUserErrorState(this.error);
}

//navbar
class SocialChangeNavBarState extends SocialStates {}

//to go to post screen
class SocialNewPostState extends SocialStates {}

//get picked image & cover
class SocialProfileImagePickedSuccessState extends SocialStates {}

class SocialProfileImagePickedErrorState extends SocialStates {}

class SocialCoverImagePickedSuccessState extends SocialStates {}

class SocialCoverImagePickedErrorState extends SocialStates {}

//update image & cover
class SocialUpdateProfileImageSuccessState extends SocialStates {}

class SocialUpdateProfileImageErrorState extends SocialStates {}

class SocialUpdateCoverImageSuccessState extends SocialStates {}

class SocialUpdateCoverImageErrorState extends SocialStates {}

class SocialUpdateErrorState extends SocialStates {}

class SocialUpdateLoadingState extends SocialStates {}

//create post
class SocialCreatePostLoadingState extends SocialStates {}

class SocialCreatePostSuccessState extends SocialStates {}

class SocialCreatePostErrorState extends SocialStates {
  final String error;
  SocialCreatePostErrorState(this.error);
}

//for posts
class SocialPostPickedSuccessState extends SocialStates {}

class SocialPostPickedErrorState extends SocialStates {}

class SocialRemovePostImageState extends SocialStates {}

//for get posts

class SocialGetPostsLoadingState extends SocialStates {}

class SocialGetPostsSuccessState extends SocialStates {}

class SocialGetPostsErrorState extends SocialStates {
  final String error;
  SocialGetPostsErrorState(this.error);
}
