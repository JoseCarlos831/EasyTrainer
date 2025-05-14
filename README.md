# EasyTrainer - Mobile Application
**EasyTrainer** is a fitness-oriented mobile application designed for personal trainers, fitness instructors, gym managers, and everyday users who want to track and organize their workouts. This project was created as part of an academic program and integrates with a backend API and a structured relational database.

This repository contains the **Flutter frontend**, responsible for the mobile user interface and interaction.

---
## Related Repositories
- **Backend (ASP.NET Core + Entity Framework):**  
  [github.com/matheusfarnetani/EasyTrainer-Backend](https://github.com/matheusfarnetani/EasyTrainer-Backend)

- **Database (MySQL with data generated via Mockaroo):**  
  [github.com/matheusfarnetani/EasyTrainer-Database](https://github.com/matheusfarnetani/EasyTrainer-Database)

---
## Technologies Used
- **Flutter** (cross-platform framework)
- **Dart** (programming language)
- **MySQL** (database, via REST API)
- **ASP.NET Core** (API backend - see backend repo)

---
## Getting Started
1. **Clone this repository**

```bash
git clone https://github.com/matheusfarnetani/EasyTrainer-App.git
cd EasyTrainer-App
```

2. Install dependencies

```bash
flutter pub get
```

3. Update API configuration
Edit the lib/config/env.dart file if needed to point to your backend API (local or production).

4. Run the project

```bash
flutter run
```

> You can use an Android emulator or a physical device via adb + adb reverse tcp:<PORT> tcp:<PORT> for localhost connections.


## Academic Project
EasyTrainer was developed as part of a university course in Software Development. It aims to simulate a real-world fitness solution with clean architecture, layered design, and modular development.

## License
This project is for academic and personal use only. Feel free to explore and modify the code, giving proper credit to the original authors.