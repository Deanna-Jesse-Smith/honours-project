# Intermittent Fasting Support

A Flutter mobile app that supports beginners in practising intermittent fasting (IF). Built as the artefact for a Computer Science Honours project at Nelson Mandela University, 2026.

> **Status:** Research prototype. Not intended for production or medical use.

## Overview

Intermittent Fasting Support guides new users through choosing an IF plan, then supports them in following it by tracking fasts, meals, weight and hydration, with reminders and streak-based feedback. The artefact was evaluated through usability testing with 5 participants.

## Features

**Onboarding**
- Quiz covering previous fasting history and whether the user struggles more with daily or weekly schedule changes
- Criteria-based scoring that recommends the top three plans
- Fully customisable plan option
- Initial fasting and hydration goals generated from the chosen plan

**Fasting**
- Time-restricted eating (TRE) page with a custom clock painter and drag-to-adjust eating window
- Alternate Day Fasting (ADF) page with day selector and time logged logic
- 5:2 page with day selector and low-calorie-day logic
- Start/break fast, switching between TRE, ADF, and 5:2
- Streak goals with period-gated evaluation
- Fasting history: calendar, monthly totals, cumulative stats

**Food**
- Meal logging by category and time, with items chosen from a bundled set of 10 foods
- Out-of-window warning (logging anyway breaks the current fast)
- Calories, macros and fibre recorded per meal; feeds 5:2 goals and streaks

**Weight and hydration**
- Weight gauge with current/start/goal values and a line-graph history
- Hydration daily total, source type and a line-graph history

**Reminders**
- Local notifications scheduled from fasting window start/end times
- Per-reminder-type toggles

**Feedback**
- Streak-driven dialogue pop-ups and concern prompts (`BasicConcern` sealed hierarchy)

## Tech Stack

| Area | Choice |
|---|---|
| Framework | Flutter (3.44.6), Dart (3.12.2) |
| Local database | drift (SQLite) |
| Notifications | flutter_local_notifications |
| State management | Riverpod |
| Target platform | Android |

## Getting Started

### Prerequisites
- Flutter SDK 3.44.6
- Android Studio and/or Visual Studio Code

### Setup
```bash
git clone https://github.com/Deanna-Jesse-Smith/honours-project.git
cd honours-project
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generates drift code
flutter run
```

## Project Structure

```
lib/
  database/
            daos/
            tables/
  models/
  pages/
        goal_pages/
        nutrition_pages/
  utils/
        Notifiers/
  widgets/
  main.dart
```

## Known Limitations

- **Food data:** Only 10 pre-made foods are bundled. There is no food search and no FDC (USDA FoodData Central) integration.
- **"Repeat yesterday's meal"** is disabled in the final build.
- **Step tracking** is not implemented.
- **Unused schema:** Some tables from the original schema may be unused
- **Build difference:** A toast on reminder toggle was added on 7 October, after the usability sessions.
- **Health disclaimer:** This app is a research prototype and gives no medical advice. Consult a health professional before starting a fasting regimen.

## Evaluation

Usability testing was conducted on 5–6 October 2026 with 5 participants recruited from Nelson Mandela University. Results and analysis are in the accompanying treatise

## Author

Deanna Smith, BSc Hons Computer Science, Nelson Mandela University
Supervisor: Ms Vimbai Matanda

## Licence

"All rights reserved. Submitted for academic assessment."
