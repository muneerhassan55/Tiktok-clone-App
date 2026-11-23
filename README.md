# Short Video App (TikTok-style clone)

A Flutter short-video app inspired by TikTok, built on Firebase. The account and video upload flows are complete; the feed, search and profile tabs are scaffolded for the next stage.

## Features

**Done**
- Registration with profile photo and login with Firebase Auth
- Bottom navigation with For You, Search, Upload, Following and Profile tabs
- Video upload flow: pick a video from the gallery, preview it with `video_player`, add details, compress it with `video_compress` and upload it to Firebase Storage
- Video details saved in Cloud Firestore
- GetX for state management

**Planned**
- Vertical For You and Following feeds
- User search
- Profile with uploaded videos and follow / unfollow

## Tech stack

Flutter · Dart · GetX · Firebase Auth · Cloud Firestore · Firebase Storage · video_player · video_compress · image_picker

## Project structure

```
lib/
  authentication/   login, registration and auth controller
  home/
    upload_video/   pick, preview, compress and upload videos
    for_you/        feed tab (scaffold)
    following/      following tab (scaffold)
    search/         search tab (scaffold)
    profile/        profile tab (scaffold)
  widgets/          shared widgets
```

## Getting started

1. Install Flutter (3.x) and run `flutter pub get`.
2. Run `flutterfire configure` to connect your own Firebase project, then enable Email/Password sign-in, Firestore and Storage.
3. Run `flutter run`.

## License

Released under the [MIT License](LICENSE).
