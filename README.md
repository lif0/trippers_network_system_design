<h1 align="center">Trippers Network - System Design(<a href="/docs/README_ru.md">ru</a> | <a href="/">eng</a>)</h1>
<div align="center"> Trippers.net - a social network for travelers</div>
<br>

### Functional Requirements
- Posting travel posts with photos, a brief description, and geotagging to specific travel destinations;
- Rating and commenting on posts by other travelers;
- Following other travelers to track their activity;
- Searching for popular travel destinations and viewing posts from these locations;
- Viewing the feed of other travelers.

### Non-Functional Requirements
<ul>
<li>DAU 10,000,000</li>
<li>Availability: 99.9% (4h 23m) per year</li>
<li>Usage location - worldwide</li>
<li>Seasonality: tourism is twice as active in summer</li>
<li>Posts are stored - permanently</li>
<li>Number of subscriptions/followers - unlimited</li>
<li>One post - one photo</li>
<li>Post:
<ul>
- Photo: 1mb<br>
- Description: 200 characters (utf-8)<br>
- Location: Location ID<br>
- Number of reactions: 4 bytes
</ul></li>
<li>Location: Latitude + Longitude + Radius</li>
<li>Comment: 140 characters (utf-8)</li>
<li>Reaction: Reaction (1 byte) + post ID (16 bytes)</li>
<li></li>
<li>Feed loading time - no more than 5 seconds</li>
<li>User feed load: up to <b>20 posts</b></li>
<li>Popular locations load: up to <b>10 locations</b></li>
<li>Posts from popular locations load: up to <b>20 posts</b></li>
<li>Comments from posts load: up to <b>20 comments</b></li>
<li>User views feed 5 times a day</li>
<li>User uploads 1 post every 5 days</li>
<li>User reads comments only on one post per day</li>
<li>User leaves 1 comment per day</li>
<li>User reacts to 3 posts per day</li>
</ul>

### Basic calculations
<ul>
<li>Post:
<ul>
- RPS(write): DAU * (1/5) / 86400 = ~23rps<br>
- RPS(read): DAU * 5 / 86400 = ~580rps<br>
<br>
- Traffic(text write): 25 * ( 200(description) * ~2(utf8) + 4(locationID)) = ~10kb/s<br>
- Traffic(text read): 580 * (200 * ~2(utf8) + 4(locationID) + 4(number of reactions)) = ~231kb/s<br>
<br>
- Traffic(media write): 25 * 1mb = ~25mb/s<br>
- Traffic(media read): 580 * 1mb = ~580mb/s<br>
</ul></li>
<li>Comments:
<ul>
- RPS(write): DAU * 1 / 86400 = ~115rps<br>
- RPS(read): DAU * 1 / 86400 = ~115rps<br>
<br>
- Traffic(write): 115 * 1 *(140 * ~2(utf8)) = ~31kb/s<br>
- Traffic(read): 115 * 20 * (140 * ~2(utf8)) = ~628kb/s<br>
</ul></li>
<li>Reactions:
<ul>
- RPS(write): DAU * 3 / 86400 = ~347rps<br>
<br>
- Traffic(write): 347 * 16(post ID) = ~5.4kb/s<br>
</ul></li>
</ul>

### Concurrent Connections Calculation
<ul>
<li>Connections: DAU * 0.1 = ~1 000 000 </li>
</ul>