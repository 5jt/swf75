Besieging Everest
=================




[![Mount Everest](https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Panoramique_mont_Everest.jpg/1280px-Panoramique_mont_Everest.jpg)](https://en.wikipedia.org/wiki/Mount_Everest)

A [coding competition](competition.md) in the [q programming language](https://code.kx.com) for the benefit of [Community Action Nepal](https://canepal.org.uk).

_Everest The Hard Way_:
watch the 45th anniversary [screening and Q&A](https://www.eventbrite.co.uk/e/everest-the-hard-way-45th-anniversary-screening-and-qa-tickets-121337996213?utm_campaign=post_old_publish&utm_medium=email&utm_source=eventbrite&utm_content=shortLinkViewMyEvent) on 2020.09.24. 


Background
----------
The [1975 British Everest Expedition](https://en.wikipedia.org/wiki/1975_British_Mount_Everest_Southwest_Face_expedition#Preparations) set out to climb the biggest mountain in the world by its hardest route, the South West Face. It was among the last of the ‘siege’ expeditions, with 18 climbers, 60 porters, and 24 tons of equipment. It was led by [Chris Bonington](https://www.bonington.com/), a former army officer, who used a computer program to help plan the formidable logistics. 

His logistics worked. The expedition put (at that time) more climbers on the summit, by the hardest route, and in the shortest time. 

The computer program was written in APL, the ancestor language of q. It was my first solo software project. Chris would have liked a program that planned the logistics, but writing that was beyond me. Instead I wrote a program that represented the logistics state. Chris did the hard work of generating movement orders, and we used the program together through the winter of 1974-5 to explore the problem space. 

In outline the problem is simple. The final assault on the summit would be made by two climbers from the highest of seven camps: Base Camp and Camps 1-6. (Like coders, mountaineers start counting at zero.) Establishing two climbers at Camp 6 meant building a supply line that would pass upwards food, fuel, gear and oxygen cylinders while also consuming them. The supply chain had to be able to sit out days of bad weather, but the whole thing had to be done in a few weeks between the monsoon and the winter storms. 


A partial solution
------------------

> In my innocence I had originally imagined that the computer would be able to tell me how to plan the expedition, an illusion which I suspect is shared by most laymen. Whilst planning our 1972 expedition, [Ian McNaught Davis](https://en.wikipedia.org/wiki/Ian_McNaught-Davis "Wikipedia"), a climbing friend of mine and managing director of [Comshare](https://en.wikipedia.org/wiki/Geac_Computer_Corporation "Wikipedia"), had suggested that we might like to use one of his computers to help in planning. Because the expedition had been organised in such a rush, we had been unable to make full use of this facility; it had, however, shown me its value as a means, not so much of finding the perfect logistic answer, but of checking out one’s own planning thinking.
> 
> In the spring of 1975 Ian McNaught Davis once again offered his help making available one of his programmers, Stephen Taylor, and through the spring and early summer we played out a series of computer games, simulating the movement of men and supplies up the mountain. We never actually reached the top, since we always seemed to get stuck in a logistic bottleneck round about the time that Camp 4 was established, the reason being that I was moving my men and supplies by intuition rather than by logic based on a clearcut formula. 
> 
> — _Everest The Hard Way_, p169

That original program was about 150 lines of Sigma APL code, mercifully long vanished. But in later years, as I gained experience as a developer, I ocasionally wondered what it would take to write the program that Chris wanted. And I kept my copy of _Everest The Hard Way_, the book Chris wrote about the expedition, with its appendices full of plans, charts and tables. 

![Everest The Hard Way](book/cover.jpg)
<br>
<small>_Everest The Hard Way_</small>

![route to the summit](book/route.jpg)
<br>
<small>Route to the summit</small>


45 years on
-----------
This repo contains the first steps towards a full solution, written in the [q programming language](https://code.kx.com/), a modern programming language derived from APL. 

Tables in q represent the expedition state handily, leaving one free to concentrate on generating movement orders. 
The script [`swf.q`](swf.q) is already considerably more ambitious than its 1974 ancestor, and manages to stumble through the first few days of expedition time.

The script represents the lead climbing party making a route to the next camp.
The function `day` advances the clock one day and returns the new state.

```q
❯ q swf.q
KDB+ 4.0 2020.08.03 Copyright (C) 1993-2020 Kx Systems
m64/ 12()core 65536MB sjt mackenzie.local 127.0.0.1 EXPIRE 2021.05.27 stephen@kx.com #59875

"Logistics, British Everest Expedition, 1975"
q)day S
climbers haps porters sleep tent food gear o2
----------------------------------------------
18       26   34      50    3098 3734 915  888
0        0    0       0     0    0    153  0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
```

Above, on the first day, climbers made 1/3 of the route from Base Camp to Camp 1. 

The next development step is movement orders to bring climbers and porters up behind them. 

An implicit challenge is to retain the array-programming style, avoiding loops and other control structures. 

The Scan and Over iterators suffice to cycle through the days of expedition time.

```q
q)5 day/S
climbers haps porters sleep tent food gear o2
----------------------------------------------
14       26   34      50    346  416  68   100
4        0    0       20    2752 3258 954  788
0        0    0       0     0    0    46   0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
0        0    0       0     0    0    0    0
```


Community Action Nepal
----------------------
Please consider making a donation to [Community Action Nepal](https://www.canepal.org.uk/)


Contact
-------
Stephen Taylor [stephen@kx.com](mailto:stephen@kx.com)

