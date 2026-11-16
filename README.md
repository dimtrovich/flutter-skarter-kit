# Starter Kit

A compact Flutter starter app demonstrating:

- French and English localization with GetX, persisted between launches.
- Light and dark themes with persisted preferences.
- Named routes and example login/register screens.
- API requests with Dio, including loading and error states.
- Reusable storage, formatting, currency, and form helpers.

## Run

```sh
flutter pub get
flutter run
```

The app opens directly on the feature showcase. Its API button requests
`posts/1` from JSONPlaceholder. Set `API_BASE_URL` when running or building to
point the API service at your backend:

```sh
flutter run --dart-define=API_BASE_URL=https://api.example.com/
```
