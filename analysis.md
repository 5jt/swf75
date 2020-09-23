Analysis
========


The function `day` takes the state table `S` as its argument and returns a state table for the next day. 


Goal
----
The goal is to put two climbers and full supplies in Camp 6, ready for a summit attempt. The full supplies are required to allow them to wait for good weather. 

At that point the logistics plan has been achieved.


Breaking trail
--------------
Time is of the essence, so push the route out as fast as possible. At any time, at the top camp, the lead climbing party of four (except two to force the Rock Band between Camps 5 and 6) works to make the route to the next camp.

That entails attaching ropes and gear to the mountain. The weight of ropes and gear needed for the route to each camp is shown in ``R`gear``. Allow three days to make the route from one camp to the next, so each day of climbing moves a third of that gear from the top camp to the next. The lead climbers may need porters to carry some of that gear. 

On the third day of breaking trail to the new camp, the lead climbing party can be joined by climbers and porters carrying other supplies, which will include food and tentage to establish the new camp. On that day the next lead climbing party (which may be of a different size) moves up to the new camp to begin breaking trail the day after. Everyone else should stay no higher than the camp below, to carry supplies upwards. 


Carrying loads
--------------
Most people on the expedition spend most days carrying a load. The weight they can carry varies between porters (Sherpas) and climbers (Europeans), and between camps, as shown in ``R`loads`loadc``.

A successful carry moves its load from one camp to the next. The carrier returns to the camp he left, unless also ordered to move up. 

Only HAPs (high-altitude porters) carry above Camp 1. They also prefer to carry from Camp 2 to Camp 4 without staging overnight at Camp 3. 

Weather, health and morale cause some carries to fail. 
The percentage varies by camp, as shown in ``R`fail``.


What supplies to carry
----------------------
Table `R` shows the weight of supplies at each camp when fully established. 

From it derives table `CASCADE`, which shows the total weight of supplies to be carried to each camp; i.e. including supplies to be carried further. 


Tentage
-------
Table `R` shows the weight of tentage at each camp and the number of people who can sleep in them. 

Movement orders cannot put more people in a camp than it will hold.


Consumption
-----------
Weights (lbs) of food and fuel are shown in ``R`food``. 
Each person consumes 5lbs of food and fuel each night. 

Oxygen is carried in 12lb bottles and is used above Camp 4. 
A bottle lasts for a day’s climbing or a night’s sleep. 


Resilience
----------
Bad weather days occur without warning and stop activity.
Everyone stays where he is, consuming food, fuel and (at high camps) oxygen. 

At all times ensure each camp has food and oxygen for its occupants for at least two days.

Set a global variable for a 4% probability of bad weather on a day and introduce bad-weather days at random.


Descents
--------
Allow a day to descend from one camp to another, except for porters, who can descend from Camp 4 to Camp 2. 


Resting
-------
The model does not attempt to represent individuals, who tire and must rest. 

Instead it unrealistically assumes individuals are interchangeable and resting can be approximated by making a proportion of people unavailable at any time.

**FIXME**: Introduce rest rates as shown in [Appendix 2](book/Appendix2.pdf).


Display
-------
An expedition history for the first 5 days: `h:5 day\S`.

Bonington drew in [Appendix 2 of his book](book/Appendix2.pdf) movement charts for his plan and for the actual progress. 

Write a function `chart` that takes `h` as its argument and returns a movement chart (text, HTML, SVG…). 

