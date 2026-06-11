# ServicesSample

<p align="center">
  <img src="https://github.com/user-attachments/assets/0636b814-b0a6-4cd7-9ca5-03612afc12c7" width="300" />
  <img src="https://github.com/user-attachments/assets/51e9ea56-68d9-41a7-a4f6-599aad414238" width="300" />
</p>

# Primary Evaluation Focus

* SwiftUI Implementation
* List Management
* Search with Combine (300ms debounce)
* NavigationStack
* Pull-to-Refresh
* MVVM Architecture

## Technical Requirements

* iOS 16.0+
* SwiftUI only
* SPM for package management
* No external libraries
* Proper use of `@State`, `@StateObject`, `@ObservedObject`
* Apple Maps with hardcoded marker
* Tabler Icons

## Features

### Services List

* Real-time search using Combine (300ms debounce)
* Search by title, customer name, and description
* Custom `List` with status, priority, and formatted date
* Pull-to-refresh with async delay (2–3s)
* Native iOS design

### Service Details

* NavigationStack with back navigation
* Sections: Description, Scheduled Time, Location, Service Notes
* Standard iOS detail layout

## Date Formatting

* Today: `Today, 2:30 PM`
* Tomorrow: `Tomorrow, 10:00 AM`
* Yesterday: `Yesterday, 3:00 PM`
* Others: `DD/MM/YYYY, h:mm AM/PM`

## Search Requirements

* Combine with Publishers/Subscribers
* 300ms debounce
* Case-insensitive
* Search across title, customer name, and description
* Optimized performance and proper empty state handling
