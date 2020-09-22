Laying siege to Everest
=======================

The 1975 British Everest Expedition set out to climb the biggest mountain in the world by its hardest route, the South West Face. It was among the last of the ‘siege’ expeditions, with 18 climbers, 60 porters, and 30 tons of equipment. It was led by [Chris Bonington](https://www.bonington.com/), a former army officer, who used a computer program to help plan the formidable logistics. 

His logistics worked. The expedition put (at that time) more climbers on the summit, by the hardest route, and in the shortest time. 

The computer program was written in APL, the ancestor language of q. It was my first solo software project. Chris would have liked a program that planned the logistics, but writing that was beyond me. Instead I wrote a program that represented the logistics state. Chris did the hard work of generating movement orders, and we used the program together through the winter of 1974-5 to explore the problem space. 

In outline the problem is simple. The final assault on the summit would be made by two climbers from the highest of seven camps: Base Camp and Camps 1-6. (Like coders, mountaineers start counting at zero.) Establishing two climbers at Camp 6 meant building a supply line that would pass upwards food, fuel, gear and oxygen cylinders while also consuming them. The supply chain had to be able to sit out days of bad weather, but the whole thing had to be done in a few weeks between the monsoon and the winter storms. 

The original program was about 150 lines of Sigma APL code, mercifully long vanished. But as I became a more experienced developer, I wondered what it would take to write the program that Chris wanted. And I kept my copy of _Everest The Hard Way_, the book Chris wrote about the expedition, with its appendices full of plans, charts and tables. 

![Everest The Hard Way](book/cover.jpg)
![route to the summit](book/route.jpg)
<br>
<small>_Everest The Hard Way_, and route to the summit</small>


2020
----

This repo contains the first steps towards a solution, written in the [q programming language](https://code.kx.com/). 

Tables in q represent the expedition state handily, leaving one free to concentrate on generating movement orders. 
The script [`swf.q`](swf.q) is already considerably more ambitious than its 1974 ancestor, and manages to stumble through the first few days of expedition time.

The script represents the lead climbing party making a route to the next camp.

The next step is movement orders to bring climbers and porters up behind them. 


Community Action Nepal
----------------------

Please consider maing a donation to [Community Action Nepal](https://www.canepal.org.uk/)


Contact
-------

Stephen Taylor [stephen@kx.com](mailto:stephen@kx.com)

