# Core Data errors when using subentities with uniqueness constraints
## Description of problem
This project demonstrates a Core Data bug. The project has a Core Data model with one abstract `Event` entity, and five subentities with `Event` as their parent. Most of the subentities have a uniqueness constraint. For example, the `CompletedActivityEvent` has an `activityId` attribute, which must be unique. That is, I should only have one instance of that event with a given `activityId`. The abstract Event entity has no constraints.

The app creates and saves events in a background context, where the merge policy is set to `mergeByPropertyStoreTrump`. For example, if a `CompletedActivityEvent` exists in Core Data with `activtyId` 1, creating another `CompletedActivityEvent` with the same `activtyId` should result in the new entity being ignored in favor of the entity already stored in Core Data.

However, when I try to create new entities, the app crashes with an error like the following:
> *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<OpenedAppDailyEvent 0x600000d8c0f0> valueForUndefinedKey:]: the entity OpenedAppDailyEvent is not key value coding-compliant for the key "activityId".'

In my model, `OpenedAppDailyEvent` is a subentity of `Event`, and it does not have an `activityId` attribute. However, `CompletedActivityEvent`, which also is a subentity of `Event`, does have an `activityId` attribute. I can resolve this error by setting `CompletedActivityEvent` to have no parent entity. I can also resolve it by removing the uniqueness constraint for `activityId`. But neither of these solutions give me the behavior I want.

I understand that when abstract entities are created, Core Data stores all subentities in a single table. But my understanding is that it should be possible for different subentities to have differrent uniqueness constraints. This is mentioned specifically in the WWDC 2015 talk, "What's New in Core Data".

## Steps to reproduce
### Without uniqueness constraints:
1. Check out this repo.
2. Make sure you are on the `main` branch, and open the project in Xcode.
3. Build and run the app. When it launches, tap the "Track Some Events" button. In the console, you should see "Track events" once, followed by "Successfully saved context”, repeated several times. Tapping the button repeatedly produces the same results.

### With uniqueness constraints:
4. Delete the EventTracker app from the simulator or device where it's running.
5. In the Git repository, switch from the `main` branch to the `constraints` branch. Build and run the app.
6. Tap the "Track Some Events" button once. It will behave as it did on the `main` branch.
7. Tap the button a second time. The app will now crash with a Core Data error.
