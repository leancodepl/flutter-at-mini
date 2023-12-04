# Flutter @ MiNI - 2023/2024
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
- Top solutions during labs - 5pt each

### Minimum SDK versions:
- Flutter 3.13.4
- Dart 3.1.0


## Lectures
1. **06.10.2023** - [Intro lecture](lectures/week1_lecture)
2. **13.10.2023** - [What is Flutter?](lectures/week2_lecture)
3. **20.10.2023** - [Let's go deeper into Flutter](lectures/week3_lecture)
4. **27.10.2023** - [State Management](lectures/week4_lecture)
5. **03.11.2023** - [Asynchrony and HTTP](lectures/week5_lecture)
6. **17.11.2023** - [State Management with External Libraries](lectures/week6_lecture)
7. **24.11.2023** - [Firebase](lectures/week7_lecture)
8. **01.12.2023** - [Data persistence](lectures/week8_lecture)
9. **08.12.2023** - [Testing](lectures/week9_lecture)
10. **15.12.2023** - [Forms](lectures/week10_lecture)
11. **22.12.2023** - [Code generation](lectures/week11_lecture)
12. **05.01.2024** - [Flutter Web and Flutter Desktop](lectures/week12_lecture)
13. **12.01.2024** - [Communication with Native](lectures/week13_lecture)
14. **19.01.2024** - [Animations](lectures/week14_lecture)
15. **26.01.2024** - [*Waiting for Proposals*]()


## Labs
1. **06.10.2023** - [Getting started](labs/week1_lab)
2. **13.10.2023** - [Layouts 1](labs/week2_lab)
3. **20.10.2023** - [Layouts 2 & using context](labs/week3_lab)
4. **27.10.2023** - [Context and StatefulWidget](labs/week4_lab)
5. **03.11.2023** - [Communication with API](labs/week5_lab)
6. **17.11.2023** - [State management with external services](labs/week6_lab)
7. **24.11.2023** - [Firebase Auth in action](labs/week7_lab)
8. **01.12.2023** - [You decide](labs/week8_lab)

Week 9-15 lab slots can be used for project consulting.

## Project

### Requirements
- Individual multi-layer Flutter application that works at least on one mobile platform (Android/iOS)
- Application should contain at least five screens
- Application should communicate with 3rd party API OR use other data persistence solution
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
- 27.10.2023 - [Initial documentation](#initial-documentation)
- 26.01.2024 - Project Submission (source code + [final documentation](#final-documentation)
- 09.02.2024 - [Late Project Submission](#late-project-submission)

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
Students can submit the project until 09.02.2024. Each day of being late will take a decrease of 5pt from the total number of gained points (not less than 51pts). Projects submitted after the final deadline won't be accepted.

## Resources
- [Flutter Official Documentation](https://flutter.dev/docs)
- [Pub Dev](https://pub.dev)
- [Effective Dart](https://dart.dev/guides/language/effective-dart)
- [Inside Flutter (for curious ones)](https://docs.flutter.dev/resources/inside-flutter)
- [Opinionated linter rules used in this codebase](https://github.com/leancodepl/flutter_corelibrary/tree/master/packages/leancode_lint)
