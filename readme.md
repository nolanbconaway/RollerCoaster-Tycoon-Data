# RollerCoaster Tycoon Data

When I was a kid i _loved_ [RollerCoaster Tycoon](https://en.wikipedia.org/wiki/RollerCoaster_Tycoon_Classic). I recently found out that Atari had [ported](http://appleinsider.com/articles/16/12/30/review-rollercoaster-tycoon-classic-for-ios-is-faithful-port-of-90s-title) the classic game for iOS, and I immediately purchased it. Now I play whenever I get a free moment. Usually I manage to play a few games a week while I watch TV or listen to podcasts.

If you do not know, a main aspect of the game involves designing custom roller coasters. When you build something new, you can go to a special window to view the ride statistics:

![](https://vignette1.wikia.nocookie.net/rct/images/3/36/Ride_Window_RCT2_-_7.gif/revision/latest?cb=20120525162507)

The most important metrics are at the top: You want to maximize excitement without making the ride too intense or nauseating. 

When I was a kid I had no patience for numbers (I created rides for maximum _awesomeness_), but these days I'm fond of that sort of thing. After I completed a few park scenarios, I began to wonder If i can use my own data to build better roller coasters. So I started saving my ride stats in a spreadsheet: After completing each scenario, I just logged the stats from each ride into the spreadsheet. This repository contains that data, as well as any analyses I might conduct on it.

## The Data

I still play a few games a week (duh), so occasionally I will update the database with my future creations (feel free to send me your own!). Each ride is cataloged based on the info from the window above:

 - `park_id`: _Integer_. Unique park identifier, zero-indexed.
 - `theme`: _String_. Title of the park scenario.
 - `rollercoaster_type`: _String_. Category of roller coaster.
 - `custom_design`: _Boolean_. True/False on whether _I_ designed the ride, or if it was pre-designed.
 - [`excitement`](http://rct.wikia.com/wiki/Excitement): _Float_. Ride excitement from 0 (very low) with no specified maximum, but it is _very_ rarely above 10.0. Larger numbers are always better.
 - [`intensity`](http://rct.wikia.com/wiki/Intensity):  _Float_. Ride intensity from 0 (very dull) with no specified maximum, though most (well-designed) rides are under 10.0. Each customer has their own intensity preference.
 - [`nausea`](http://rct.wikia.com/wiki/Nausea): _Float_. Ride nausea from 0 (very low) with no specified maximum, but lower is better and rides rarely have values above 10.0.
 - `excitement_rating`, `intensity_rating`, `nausea_rating`: _String_.  Descriptors of the excitement, intensity, and nausea ratings.
 - `max_speed`: _Integer_. Maximum speed (mph).
 - `avg_speed`: _Integer_. Average speed (mph).
 - `ride_time`: _Integer_. Total duration of the ride in seconds.
 - `ride_length`: _Integer_. Length of the ride in feet.
 - `max_pos_gs`, `max_neg_gs`, `max_lateral_gs`: _Float_. Values describing the maximum observed positive, negative, and lateral [G-Forces](https://en.wikipedia.org/wiki/G-force).
 - `total_air_time`: _Float_. Number of seconds in which riders experience weightlessness.
 - `drops`: _Integer_. Number of downhill segments.
 - `highest_drop_height`: _Integer_. Highest height (with 0 being sea-level?) from which a drop takes place. _Note_: rides can drop to -6 in the game.
 - `inversions`: _Integer_. Number of times riders are upside-down during the ride. This accounts for loops, corkscrews, etc. values of `-1` indicate missing information (see caveat #2).


### Caveats 

1. So far I've only been keeping track of _roller coasters_, so the data does not include customizable thrill rides or water rides (excepting the [Dinghy Slide](http://rct.wikia.com/wiki/Dinghy_Slide), which is classified as a roller coaster in the game).
2. It is unfortunate that the first handful of rides I built did not have any inversions, and it took me several weeks to realize that the game does not show this info unless there _are_ inversions. During that time, I simply ignored the inversions count, so we just do not have that info for many rides. Some rides cannot have inversions, and I filled in that information after the fact. So, a value for `inversions = -1` indicates that the ride _could_ have had inversions.



