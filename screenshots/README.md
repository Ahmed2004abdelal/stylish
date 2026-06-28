<div align="center">

<img src="assets/images/logo.png" alt="Stylish Logo" width="100" />

# Stylish

### A Full-Featured Fashion E-Commerce App Built with Flutter

[![Flutter](https://img.shields.io/badge/Flutter-3.16+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![Stripe](https://img.shields.io/badge/Stripe-635BFF?style=for-the-badge&logo=stripe&logoColor=white)](https://stripe.com)

*Browse. Search. Cart. Checkout — all in one seamless mobile shopping experience.*

[Screenshots](#-screenshots) • [Features](#-features) • [Architecture](#-architecture) • [Getting Started](#-getting-started)

</div>

---

## 📸 Screenshots

<div align="center">

<table>
  <tr>
    <td align="center"><b>Splash</b></td>
    <td align="center"><b>Onboarding</b></td>
    <td align="center"><b>Login</b></td>
    <td align="center"><b>Sign Up</b></td>
    <td align="center"><b>Home</b></td>
  </tr>
  <tr>
    <td><img src="screenshots/01_splash.png" width="160"/></td>
    <td><img src="screenshots/02_onboarding.png" width="160"/></td>
    <td><img src="screenshots/03_login.png" width="160"/></td>
    <td><img src="screenshots/04_signup.png" width="160"/></td>
    <td><img src="screenshots/05_home.png" width="160"/></td>
  </tr>
  <tr>
    <td align="center"><b>Product Details</b></td>
    <td align="center"><b>Search</b></td>
    <td align="center"><b>Cart</b></td>
    <td align="center"><b>Checkout</b></td>
    <td align="center"><b>Stripe Payment</b></td>
  </tr>
  <tr>
    <td><img src="screenshots/06_product_details.png" width="160"/></td>
    <td><img src="screenshots/10_search.png" width="160"/></td>
    <td><img src="screenshots/07_cart.png" width="160"/></td>
    <td><img src="screenshots/08_checkout.png" width="160"/></td>
    <td><img src="screenshots/09_payment.png" width="160"/></td>
  </tr>
</table>

</div>

---

## ✨ Features

| Feature | Description |
|---|---|
| 🌙 **Splash & Onboarding** | Native splash screen and 3-step animated onboarding |
| 🔐 **Authentication** | Email/password + Google Sign-In via Firebase Auth |
| 🏠 **Home Feed** | Promotional banners, Deal of the Day countdown, Trending & All Products |
| 🔍 **Real-time Search** | Instant product search with live suggestions |
| 📦 **Product Details** | Size selector, discount display, ratings, and Add-to-Cart |
| 🛒 **Cart Management** | Add, remove, update quantities, and live total calculation |
| 💳 **Checkout Flow** | Delivery address, shipping method selection (FedEx / DHL) |
| 💰 **Stripe Payment** | Full card payment integration with Stripe SDK |
| 👤 **Profile** | Business address and bank account management |

---

## 🏗️ Architecture

Stylish follows **Feature-First Clean Architecture** separating every feature into its own `data`, `logic`, and `ui` layers.

```
lib/
├── core/
│   ├── di/                  # Dependency injection (GetIt)
│   ├── networking/          # API clients & interceptors
│   ├── routing/             # App router & named routes
│   └── utilities/           # Constants, helpers, extensions
│
└── features/
    ├── auth/
    │   ├── login/
    │   │   ├── data/        # Models, repositories
    │   │   ├── logic/       # Cubit + Freezed states
    │   │   └── ui/          # Screens & widgets
    │   └── signup/
    ├── home/
    ├── search/
    ├── cart/
    ├── check_out/
    ├── profile/
    └── onboarding/
```

### State Management Flow

```
UI Widget  ──▶  Cubit (Business Logic)  ──▶  Repository  ──▶  Firebase / REST
    ▲                     │
    └─────────────────────┘
         Freezed States (emit)
```

Every feature is self-contained — making the codebase highly scalable and testable.

---

## 🛠️ Tech Stack

### Core

| Package | Purpose | Version |
|---|---|---|
| `flutter_bloc` | State management (Cubit pattern) | ^9.1.1 |
| `get_it` | Service locator / Dependency injection | ^9.2.1 |
| `freezed` | Immutable state & sealed unions | ^3.2.5 |
| `json_serializable` | JSON code generation | ^6.13.2 |

### Firebase

| Package | Purpose | Version |
|---|---|---|
| `firebase_core` | Firebase initialization | ^4.9.0 |
| `firebase_auth` | Authentication | ^6.5.1 |
| `cloud_firestore` | NoSQL real-time database | ^6.4.1 |
| `google_sign_in` | Google OAuth | ^7.2.0 |

### UI & Utilities

| Package | Purpose | Version |
|---|---|---|
| `flutter_screenutil` | Responsive sizing | ^5.9.3 |
| `google_fonts` | Typography | ^8.0.2 |
| `flutter_svg` | SVG asset rendering | ^2.2.4 |
| `smooth_page_indicator` | Page dot indicators | ^2.0.1 |
| `flutter_native_splash` | Native splash screen | ^2.4.7 |

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.16.0`
- Dart SDK `>=3.2.0`
- A configured [Firebase](https://console.firebase.google.com) project
- A [Stripe](https://dashboard.stripe.com) account

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/Ahmed2004abdelal/stylish.git
cd stylish

# 2. Install dependencies
flutter pub get

# 3. Generate code (Freezed & JsonSerializable)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

### Firebase Setup

1. Go to [Firebase Console](https://console.firebase.google.com) and create a project
2. Add your Android/iOS app and download the config files:
   - `google-services.json` → `android/app/`
   - `GoogleService-Info.plist` → `ios/Runner/`
3. Enable **Authentication** (Email/Password + Google)
4. Enable **Cloud Firestore**

### Environment Variables

> ⚠️ Never hardcode API keys in your source code.

Pass secrets at build time using `--dart-define`:

```bash
flutter run \
  --dart-define=STRIPE_SECRET_KEY=sk_test_xxxx \
  --dart-define=STRIPE_PUBLISHABLE_KEY=pk_test_xxxx
```

---

## 📁 Key Files

| File | Description |
|---|---|
| `lib/core/di/` | GetIt service locator setup |
| `lib/core/routing/` | App-wide navigation & route definitions |
| `pubspec.yaml` | All dependencies & asset declarations |
| `firebase.json` | Firebase project configuration |
| `flutter_native_splash.yaml` | Splash screen configuration |

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

1. Fork the project
2. Create your branch: `git checkout -b feature/amazing-feature`
3. Commit your changes: `git commit -m 'feat: add amazing feature'`
4. Push to the branch: `git push origin feature/amazing-feature`
5. Open a Pull Request

---

## 👨‍💻 Author

**Ahmed Abdelal**

[![GitHub](https://img.shields.io/badge/GitHub-Ahmed2004abdelal-181717?style=flat-square&logo=github)](https://github.com/Ahmed2004abdelal)

---

<div align="center">
Made with ❤️ using Flutter
</div>
