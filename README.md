# Flutter @ MiNI - 2022/2023
Repository contains information about **Programming mobile applications in Flutter** course.

## Contact info
Jakub Fijałkowski - jakub.fijalkowski@leancode.pl

Mateusz Wojtczak - mateusz.wojtczak@leancode.pl

## Rules
Students need to gather at least 51pt to pass the course:
- 51-60pt - 3
- 61-70pt - 3.5
- 71-80pt - 4
- 81-90pt - 4.5
- 91-100pt - 5

Points can be gained from:
- Project - 100pt
- Activity during lectures - 10pt

### Minimum SDK versions:
- Flutter 3.3.3 (latest stable on 01.10.2022)
- Dart 2.18.2


## Lectures
1. **03.10.2022** - [Intro lecture](lectures/week1_lecture)
2. **10.10.2022** - [What is Flutter?](lectures/week2_lecture)
3. **17.10.2022** - [Let's go deeper into Flutter](lectures/week3_lecture)
4. **24.10.2022** - [State Management](lectures/week4_lecture)
5. **07.11.2022** - [Asynchrony and HTTP](lectures/week5_lecture)
6. **14.11.2022** - [State Management with External Libraries](lectures/week6_lecture)
7. **21.11.2022** - [Firebase](lectures/week7_lecture)
8. **28.11.2022** - [Data persistence](lectures/week8_lecture)
9. **05.12.2022** - [Forms](lectures/week9_lecture)
10. **12.12.2022** - [Testing](lectures/week10_lecture)
11. **19.12.2022** - [Code generation](lectures/week11_lecture)
12. **02.01.2023** - [Flutter Web and Flutter Desktop](lectures/week12_lecture)
13. **09.01.2023** - [Communication with Native](lectures/week13_lecture)
14. **16.01.2023** - [Animations](lectures/week14_lecture)
15. **23.01.2023** - [*Waiting for Proposals*]()


## Labs
1. **03.10.2022** - [Getting started](labs/week1_lab)
2. **10.10.2022** - [Layouts 1](labs/week2_lab)
3. **17.10.2022** - [Layouts 2 & using context](labs/week3_lab)
4. **24.10.2022** - [Context and StatefulWidget](labs/week4_lab)
5. **07.11.2022** - [Communication with API](labs/week5_lab)
6. **14.11.2022** - [State management with external services](labs/week6_lab)
7. **21.11.2022** - [Firebase Auth in action](labs/week7_lab)
8. **28.11.2022** - [Useful widgets](labs/week8_lab)

Week 9-15 lab slots can be used for project consulting.

## Project

### Requirements
- Individual multi-layer Flutter application that works at least on one mobile platform (Android/iOS)
- Application should contain at least two screens
- Application should communicate with 3rd party API OR use other data persistency solution
- Application's topic and scope is defined by the student, should be described in initial documentation and approved by the lecturer
- Project's source code and final documentation is submitted according to the [Timeline](#timeline)

### Assessment Rules
- Implementation of the required project assumptions (50pt)
	- Initial documentation - 5pt
	- Implementation of a multi-layer application - 15pt
	- Code quality - 10pt
	- UI/UX - 10pt
	- Final documentation - 10pt
- Optional requirements (max 50pt)
	- Support for additional platform (Android/iOS/Web/Desktop) - 5pt each
	- Implementing BLoC pattern - 10pt
	- Animations - 10pt
	- Tests - 10pt
	- Signing in process - 10pt
	- Complex form with validation - 10pt
	- CI/CD - 5pt
	- Platform Channels - 10pt
	- Internationalization - 5pt
	- Accessibility - 5pt
	- Custom painting - 10pt
	- Deep links - 10pt
	- Using Camera/Bluetooth/Other platform features - 10pt
	- Offline support - 20pt
- Adherence to the schedule - 10pt


### Timeline
- 24.10.2022 - [Initial documentation](#initial-documentation)
- 23.01.2023 - Project Submission (source code + [final documentation](#final-documentation)
- 06.02.2023 - [Late Project Submission](#late-project-submission)

### Initial Documentation
Initial documentation should contain:
- Project description
- User stories (e.g. As a user, I can sign in; As a user, I can view the list of items)

### Final Documentation
Final documentation should contain:
- Project description
- Integrations
- List of optional requirements
- Instruction
- Test account (if applicable)
- Database/Firestore schema (if applicable)
- CI/CD description/screenshot (if applicable)

But it shouldn't be longer than 1-2 pages. :)

### Examples of projects
#### To-do list app
A to-do list app (like Google Tasks/Todoist/Remember The Milk)
- Firebase Auth
- Cross-device synchronization
- Note sharing

#### Instant messaging app
- Sign in / sign up
- Image messages support
- "Seen" status support
- (optional) Other media messages support
- (optional) Creating rooms or contact list

#### Shopping list app
- Classification using categories
- Fuzzy search
- Item grouping
- History
- Local persistence

#### Feed browser app
- Connected to some public API (like Reddit)
- Favorite posts with local persistence
- Simple actions (likes / comments - depending on the API)
- (optional) Video posts playback support

#### Online store browser app (local / fake API)
- Categories
- Filters
- Sorting
- Item photo pinch-to-zoom
- Local cart
- Sharing items (with deep-links)

#### PoI (Point of Interest) browser app
- PoI map
- PoI list
- Tags
- Categories
- Filters
- Sorting by location
- User geolocation

### Late Project Submission
Students can submit the project until 06.02.2023. Each day of being late will take a decrease of 5pt from the total number of gained points. Projects submitted after the final deadline won't be accepted.

## Resources
- [Flutter Official Documentation](https://flutter.dev/docs)
- [Pub Dev](https://pub.dev)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Inside Flutter (for curious ones)](https://docs.flutter.dev/resources/inside-flutter)
- [Opinionated linter rules used in this codebase](https://github.com/leancodepl/flutter_corelibrary/tree/master/packages/leancode_lint)
