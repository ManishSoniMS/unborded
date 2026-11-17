# Unbordered

Flutter app for investing in funds: view account balance, place orders. Feature-first clean architecture, `flutter_bloc` for state.

## Tech stack

| Concern | Package |
|---|---|
| State management | `flutter_bloc` (Cubit / Bloc), `equatable` |
| Error handling | `fpdart` (`Either<Failure, T>`) |
| DI | `get_it` + `injectable` |
| Networking | `dio` |
| Routing | `go_router` |
| Models | `freezed`, `json_serializable` |
| Assets | `flutter_gen_runner` (`lib/gen/assets.gen.dart`), `lottie` |
| i18n / formatting | `intl` |

## Why flutter_bloc

| Concern | How flutter_bloc helps |
|---|---|
| Predictability | One-way flow: UI event → Bloc/Cubit → new immutable state → UI. Every change traceable. |
| Scalability | One Cubit/Bloc per screen or feature. No global store. Teams work in parallel without collisions. |
| Separation of concerns | UI renders state and calls methods/events. Business logic in Bloc, I/O behind repositories. |
| Testability | Blocs are pure Dart. `bloc_test` asserts exact state sequences, no widget tree needed. |
| Debuggability | Single `BlocObserver` hook sees every transition and error. |
| Team fit | Strict conventions reduce style drift. Easy review and onboarding. |

Tradeoff: more boilerplate than Provider/Riverpod. Mitigation: use `Cubit` for simple flows (this repo does, e.g. `InvestmentCubit`), full `Bloc` only when event traceability or transformers (debounce, droppable) are needed.

Rejected: **Provider/ChangeNotifier** (mutable, weak conventions), **Riverpod** (flexible, but teams drift into inconsistent patterns), **GetX** (implicit magic, hard to test).

## Architecture

Per feature, dependencies point inward:

```
presentation  →  domain  ←  data
```

- **domain**: entities, DTOs, repository contracts, use cases. No Flutter/Dio imports.
- **data**: sources (API calls) and repository implementations. Catch exceptions, map to `Failure`.
- **presentation**: Cubits/Blocs, pages, widgets.

Error flow: use cases return `FailureOr<T>` (`Future<Either<Failure, T>>`). Cubit calls `result.fold(...)` and emits failure or success state. No exceptions leak into presentation.

### Directory tree

```
lib/
├── main.dart                         # configureDependencies() + runApp
├── gen/
│   └── assets.gen.dart               # generated, do not edit
└── src/
    ├── app/
    │   ├── app.dart                  # MaterialApp.router
    │   └── injection/
    │       ├── injection.dart        # get_it + injectable init
    │       └── injection.config.dart # generated
    ├── routes/
    │   ├── app_routes.dart           # route names / paths
    │   └── route_manager.dart        # GoRouter config
    ├── external/
    │   ├── dio.dart                  # Dio setup
    │   └── register_module.dart      # third-party DI registrations
    ├── core/
    │   ├── base/
    │   │   ├── type_defs.dart        # FailureOr<T>
    │   │   └── usecase.dart          # IUseCase<R, P>, NoParams
    │   ├── constants/api_constants.dart
    │   ├── error/
    │   │   ├── failure.dart
    │   │   └── map_exception_to_failure.dart
    │   ├── utils/                    # enums, extensions, validator, debouncer
    │   └── widgets/                  # shared widgets (loader, error_widget)
    └── features/
        ├── home/
        │   ├── data/
        │   │   ├── sources/order_source.dart
        │   │   └── repositories/order_repository.dart
        │   ├── domain/
        │   │   ├── dtos/place_order_dto.dart
        │   │   ├── entities/order_response/   # freezed + json
        │   │   ├── repositories/order_repository.dart
        │   │   └── usecases/place_order_usecase.dart
        │   └── presentation/
        │       ├── blocs/invest/investment/   # InvestmentCubit + state
        │       ├── pages/                     # home_page, invest_page
        │       └── widgets/
        └── shared/
            └── account/                       # balance, reused across features
                ├── data/{sources,repostories}/
                ├── domain/{repositories,usecase}/
                └── presentation/blocs/

assets/animations/                    # lottie files
test/                                 # mirrors lib/src structure
```

### Team rules

1. Features never import another feature's `data` or `presentation`. Shared code goes in `features/shared/` or `core/`.
2. Cubits/Blocs depend on use cases only. Never on Dio or sources.
3. Use cases return `FailureOr<T>`. Repositories catch and map exceptions via `map_exception_to_failure.dart`.
4. States are immutable (`Equatable` or `freezed`). Always emit new instances via `copyWith`.
5. Widgets: `BlocBuilder` for rendering, `BlocListener` for one-shot effects (navigation, popups).
6. Register classes with `@injectable` / `@lazySingleton`. Regenerate DI after changes.
7. Every Cubit/Bloc gets a `bloc_test`. Every JSON model gets a parsing test.

## API

Base URL: `ApiConstants.baseUrl` (`lib/src/core/constants/api_constants.dart`).

| Method | Path | Purpose |
|---|---|---|
| GET | `/account/balances` | Fetch account balance |
| POST | `/orders` | Place order `{fundId, currency, amount}` |

## Setup

Requirements: Flutter stable with Dart `^3.13.5`.

```bash
git clone <repo-url>
cd unbordered
flutter pub get
```

### Code generation

Required after clone, and whenever you change `@injectable`, `@freezed`, `@JsonSerializable` classes or `assets/`.

```bash
# one-off
dart run build_runner build --delete-conflicting-outputs

# watch mode during development
dart run build_runner watch --delete-conflicting-outputs
```

Generates:
- `*.freezed.dart`, `*.g.dart` (models)
- `injection.config.dart` (DI)
- `lib/gen/assets.gen.dart` (assets)

### Run

```bash
flutter run                 # default device
flutter devices             # list devices
flutter run -d <device-id>
```

### Test

Dev deps already in `pubspec.yaml`: `bloc_test`, `mocktail`, `integration_test`.

```bash
flutter test                                   # unit + bloc + widget (12 tests)
flutter test --coverage                        # coverage/lcov.info
flutter test integration_test -d <device-id>   # end-to-end (1 test), needs emulator/device
```

Kept small on purpose: one test per real risk, no tests for trivial getters, enum fields or generated code.

| Type | File | Why it exists |
|---|---|---|
| Logic | `test/core/utils/validator_test.dart` (2) | Order limits gate real money. Boundary bugs (`>=` vs `>`) are easy and costly. |
| Unit | `test/core/error/map_exception_to_failure_test.dart` (2) | Single place turning every network error into user messages. Wrong mapping = wrong UX everywhere. |
| Unit | `test/features/home/domain/order_models_test.dart` (2) | Guards API contract drift (`fromJson` is generated, so only the payload shape and missing fields matter). |
| Bloc | `.../blocs/investment_cubit_test.dart` (2) | Core flow: loading → loaded / failure, and the exact DTO sent to the API. |
| Bloc | `.../account/.../account_cubit_test.dart` (1) | Balance deduction touches money. Must debit only the matching currency. |
| Widget | `.../widgets/invest_action_button_test.dart` (3) | Button gating (enabled, insufficient funds) and reaction to cubit state stream. Prevents invalid orders from the UI. |
| Integration | `integration_test/place_order_flow_test.dart` (1) | Happy path across router, cubits, DI and UI: home → invest → order → success popup. Catches wiring bugs unit tests cannot. |

Notes:
- Shared fixtures: `test/helpers/fixtures.dart`.
- Integration test fakes only use cases (network edge).
- `App` wraps content in `onDoubleTap`, so single taps are delayed ~300ms. Tests pump 400ms after tapping.

### Analyze / format

```bash
dart format --set-exit-if-changed .
flutter analyze
```

### Build

```bash
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

## Troubleshooting

- **Missing `*.g.dart` / `*.freezed.dart` / `injection.config.dart`**: run build_runner (above).
- **`GetIt: object not registered`**: forgot annotation or did not regenerate DI.
- **Stale generated files**: `dart run build_runner clean` then build again.
