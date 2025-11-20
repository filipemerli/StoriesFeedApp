# StoriesFeedApp

App to show Stories Feed feature, inspired on Instagram.

This is a SwiftUI project. It uses SwiftData to persiste data, the Stories.
Stories are created at app launch, if there are no Stories persisted. If creates 50 Stories, the images are URL fetched from Lorem Picsum public API. FOr now, big imges are fetched so it can be used to display in the full screen view, the StoriesViewerView.

Kingfisher dependency, in SPM, is hanlding network images fetch, so this project does not care about image caching, networks requests queue and abstractions related to this topic.

Current state:
- Home View (StoriesFeedView): Shows, in a 'prototype' view a horizontal scroll feed of Stories.
- Stories Component: Main entry point and main component of this project/feature. Shows Stories with a round indicator, for already seen or not stories, like instagram. Lazy fetch new items and inifinity scroll with pagination of 20 items.
- Detail View (StoryViewerView): Basic shape of Story view. Close button on top and Like Button on bottom. This triggers the 'is seen' logic, to update the color ring on Feed.

- Is seen and is liked logic persisted in SwiftData container

## IMPROVEMENTS ##

- Full screen with 'drag down' dismiss on StoryViewerView
- Animations (transition on views), hapatic feedback on like action.
- Unit tests