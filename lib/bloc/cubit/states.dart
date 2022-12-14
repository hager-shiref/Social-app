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

//for likes

class SocialGetLikesSuccessState extends SocialStates {}

class SocialGetLikesErrorState extends SocialStates {
  final String error;
  SocialGetLikesErrorState(this.error);
}

//for comments

class SocialGetCommentsSuccessState extends SocialStates {}

class SocialGetCommentsErrorState extends SocialStates {
  final String error;
  SocialGetCommentsErrorState(this.error);
}

//get all users

class SocialGetAllUsersLoadingState extends SocialStates {}

class SocialGetAllUsersSuccessState extends SocialStates {}

class SocialGetAllUsersErrorState extends SocialStates {
  final String error;
  SocialGetAllUsersErrorState(this.error);
}

//send message

class SocialSendMessageSuccessState extends SocialStates {}

class SocialSendMessageErrorState extends SocialStates {
  final String error;
  SocialSendMessageErrorState(this.error);
}

//get text message

class SocialGetMessageSuccessState extends SocialStates {}

// image message
class SocialmessageImagePickedSuccessState extends SocialStates {}

class SocialmessageImagePickedErrorState extends SocialStates {}

class SocialmessageImageUploadSuccessState extends SocialStates {}

class SocialmessageImageUploadErrorState extends SocialStates {
  final String error;
  SocialmessageImageUploadErrorState(this.error);
}
//signOut

class SocialUserSignOutSuccessState extends SocialStates {}

class SocialUserSignOutErrorState extends SocialStates {
  final String error;
  SocialUserSignOutErrorState(this.error);
}
