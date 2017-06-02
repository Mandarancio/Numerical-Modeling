<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Multi-Agents Model>|<doc-author|<author-data|<author-name|Martino
  Ferrari>>>>

  <subsection|Implementation>

  In this TP we will implement a simple multi-agent model of a bacteria. The
  bacteria at each iteration can continue on its direction or randomly change
  direction.<next-line>The probability of each behaviors depends from the
  density of nutriment on its position.

  To model this agent I choose to use a simple class:

  <\python-code>
    class Agent:

    \ \ \ \ """Bacterial agent."""

    \ \ \ \ def __init__(self, pos):

    \ \ \ \ \ \ \ \ self.pos = np.array(pos)

    \ \ \ \ \ \ \ \ self.speed = 2 # 20 um/s

    \ \ \ \ \ \ \ \ self.direction = __randir__()

    \ \ \ \ \ \ \ \ self.density = 0

    \ \ \ \ \ \ \ \ self.alpha = 0.01

    \;

    \ \ \ \ def move(self, dt):

    \ \ \ \ \ \ \ \ """Move bacteria."""

    \ \ \ \ \ \ \ \ self.pos += self.speed * dt * self.direction

    \ \ \ \ \ \ \ \ 

    \ \ \ \ def update(self, density):

    \ \ \ \ \ \ \ \ """Update direction."""

    \ \ \ \ \ \ \ \ p = 0.9 if density \<gtr\> self.density else 0.5

    \ \ \ \ \ \ \ \ self.density = density

    \ \ \ \ \ \ \ \ if rnd.rand() \<gtr\> p:

    \ \ \ \ \ \ \ \ \ \ \ \ self.direction = __randir__()

    \ \ 
  </python-code>

  <subsection|Results><label|results>

  In this section I will comment the results of different experiment I did.

  <subsubsection|Continuous density><label|continuous-density>

  First to be able to update the bacteria we need to define the nutriment
  density in function of the position. In this first part I will consider the
  following:

  <\equation*>
    \<rho\><around|(|<wide|x|\<bar\>>|)>=<frac|1|1+<around|\||<wide|x|\<bar\>>-<wide|c|\<bar\>>|\|>>
  </equation*>

  where <math|<wide|x|\<bar\>>> is the current position and
  <math|<wide|c|\<bar\>>> is the center of the simulation.

  <big-figure|<with|par-mode|center|<image|/home/martino/git/Numerical-Modeling/TP5-Agents/report/output_4_0.png|200pt|||>
  >|Nutrition density>

  <subsubsection|1 Bacteria Itinerary><label|bacteria-itinerary>

  The first experience we were asked to do is to draw the itinerary of a
  single bacteria in our simulation, after 30 iterations the results is the
  following:

  <big-figure|<with|par-mode|center|<image|output_6_0.png|200pt|||> >|Single
  bacteria intinerary>

  It's interesting to see how the bacteria in our simulation moves at a
  constant speed, and how it's somehow attracted by the nutriment (as the
  probability of direction change is smaller).

  <subsubsection|100 Bacteria><label|bacteria>

  In this experiment we were asked to analyze a simulation with 100 bacteria,
  the first experimentation I did was to see how the population evolve during
  the time (100 iterations, 20s):

  <big-figure|<\with|par-mode|center>
    <tabular|<tformat|<table|<row|<cell|<image|output_9_0.png|200pt|||>>>|<row|<cell|<image|output_9_1.png|200pt|||>>>|<row|<cell|<image|output_9_2.png|200pt|||>>>>>>
  </with>|Evolution of 100 bacteria>

  Then I tried a more statistical approach, I simulated 20 times the same
  system for 1000 iterations and I counted the numbers of bacteria within
  <math|15*\<mu\>*m> from the center:

  <big-figure|<with|par-mode|center|<image|output_12_0.png|200pt|||>
  >|Evolution of the number of bacteria in time>

  <big-figure|<with|par-mode|center|<image|output_12_1.png|200pt|||>
  >|Evolution of the number of bacteria in logarithmic time scale>

  <big-figure|<with|par-mode|center|<image|output_12_2.png|200pt|||>
  >|Details of the firt 100 iterations>

  The result is very interesting, as the norm of the speed is constant the
  bacteria can not stabilize at the center and start to \Porbit\Q around it.
  In this way the number of bacteria close to the center grow linearly until
  saturate around 25 (as visible in both logarithmic scale and in the first
  100 iterations plot).

  <subsubsection|Non-continuous density><label|non-continuous-density>

  I also experimented with a non-continuous density in the form of:

  <\equation*>
    \<rho\><around|(|<wide|(|\<bar\>>x|)>)=<choice|<tformat|<table|<row|<cell|1>|<cell|<around|\||<wide|x|\<bar\>>-<wide|c|\<bar\>>|\|>\<less\>15*\<mu\>*m>>|<row|<cell|0>|<cell|<around|\||<wide|x|\<bar\>>-<wide|c|\<bar\>>|\|>\<geq\>15*\<mu\>*m>>>>>
  </equation*>

  <big-figure|<with|par-mode|center|<image|output_15_0.png|200pt|||>
  >|Nutrition density>

  <subsubsection|100 Bacteria and non-continuous
  density><label|bacteria-and-non-continuous-density>

  I then re-did the same experiment of before (population of 100 bacteria)
  with this new density distribution:

  <big-figure|<with|par-mode|center|<tabular|<tformat|<table|<row|<cell|<image|output_17_0.png|200pt|||>>>|<row|<cell|<image|output_17_1.png|200pt|||>>>|<row|<cell|<image|output_17_2.png|200pt|||>>>>>>>|Evolution
  of 100 bacteria in time>

  At first view it seems that as the bacteria have constant speed and the
  nutrition density is distributed uniformly in the 2 areas of our simulation
  the bacteria are not able to be attracted by the source of food. The
  statistical analysis of the center of the simulation confirmed my
  hypothesis:

  <big-figure|<with|par-mode|center|<image|output_20_0.png|200pt|||>
  >|Evolution of the number of bacteria in time>

  As the attraction to the food is not efficient in this case in the long run
  the number of bacteria at the center tend to 0.

  <subsubsection|Actracted Bacteria><label|actracted-bacteria>

  Then we were asked to implement a new movement function to the bacteria in
  a way that they would be attracted not only by the nutrients but as well by
  the other bacteria (only if the distance is <math|\<leq\>10*\<mu\>*m>).

  After implementing this new move function, I chose to redo the 100 bacteria
  experiment with continuous density distribution and the new move function:

  <big-figure|<\with|par-mode|center>
    <tabular|<tformat|<table|<row|<cell|<image|output_23_0.png|200pt|||>>>|<row|<cell|<image|output_23_1.png|200pt|||>>>|<row|<cell|<image|output_23_2.png|200pt|||>>>>>>
  </with>|Evolution of 100 bacteria in time>

  As the <math|\<alpha\>> parameter (that control the attraction) chosen is
  small at first view there is no big difference. However the statistics (and
  longer simulations) show clearly the impact of this attraction:

  <big-figure|<with|par-mode|center|<image|output_26_0.png|200pt|||>
  >|Evolution of the number of bacteria in time>

  <big-figure|<with|par-mode|center|<image|output_26_1.png|200pt|||>
  >|Evolution of the number of bacteria in logarithmic time>

  In the longer run it appears that the saturation limit is higher as the
  attraction tent to concentrate the bacteria and to counterbalance the
  constant speed problem.

  <subsubsection|Parallelization><label|parallelization>

  As last theoretical question we were asked a what could be a possible way
  to implement a parallel version of this multi-agent simulation.

  Without attraction the answer is very simple, as there is no interaction
  between different bacteria, the agents could be divided in <math|N> groups
  (one per processor) and the simulation of this <math|N> groups could be
  done independently.

  However whit the attraction the problem is more complex. With a big number
  of bacteria some sort of parallel Barnes-Hut algorithm should be the
  optimal solution, in order to minimize the inter-processors messages the
  closest bacteria are simulated together and the use of the tree structure
  should permit to minimize the number of messages.

  With smaller number of bacteria a simple division of the space in grid
  should be enough (and parallel simulation of each area).
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|actracted-bacteria|<tuple|2.6|?>>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|5|?>>
    <associate|auto-11|<tuple|6|?>>
    <associate|auto-12|<tuple|2.4|?>>
    <associate|auto-13|<tuple|7|?>>
    <associate|auto-14|<tuple|2.5|?>>
    <associate|auto-15|<tuple|8|?>>
    <associate|auto-16|<tuple|9|?>>
    <associate|auto-17|<tuple|2.6|?>>
    <associate|auto-18|<tuple|10|?>>
    <associate|auto-19|<tuple|11|?>>
    <associate|auto-2|<tuple|2|?>>
    <associate|auto-20|<tuple|12|?>>
    <associate|auto-21|<tuple|2.7|?>>
    <associate|auto-3|<tuple|2.1|?>>
    <associate|auto-4|<tuple|1|?>>
    <associate|auto-5|<tuple|2.2|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|2.3|?>>
    <associate|auto-8|<tuple|3|?>>
    <associate|auto-9|<tuple|4|?>>
    <associate|bacteria|<tuple|2.3|?>>
    <associate|bacteria-and-non-continuous-density|<tuple|2.5|?>>
    <associate|bacteria-itinerary|<tuple|2.2|?>>
    <associate|continuous-density|<tuple|2.1|?>>
    <associate|non-continuous-density|<tuple|2.4|?>>
    <associate|parallelization|<tuple|2.7|?>>
    <associate|results|<tuple|2|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Nutrition density|<pageref|auto-4>>

      <tuple|normal|Single bacteria intinerary|<pageref|auto-6>>

      <tuple|normal|Evolution of 100 bacteria|<pageref|auto-8>>

      <tuple|normal|Evolution of the number of bacteria in
      time|<pageref|auto-9>>

      <tuple|normal|Evolution of the number of bacteria in logarithmic time
      scale|<pageref|auto-10>>

      <tuple|normal|Details of the firt 100 iterations|<pageref|auto-11>>

      <tuple|normal|Nutrition density|<pageref|auto-13>>

      <tuple|normal|Evolution of 100 bacteria in time|<pageref|auto-15>>

      <tuple|normal|Evolution of the number of bacteria in
      time|<pageref|auto-16>>

      <tuple|normal|Evolution of 100 bacteria in time|<pageref|auto-18>>

      <tuple|normal|Evolution of the number of bacteria in
      time|<pageref|auto-19>>

      <tuple|normal|Evolution of the number of bacteria in logarithmic
      time|<pageref|auto-20>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|1<space|2spc>Implementation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|2<space|2spc>Results
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|2tab>|2.1<space|2spc>Continuous density
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|2.2<space|2spc>1 Bacteria Itinerary
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|2.3<space|2spc>100 Bacteria
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|2.4<space|2spc>Non-continuous density
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|2tab>|2.5<space|2spc>100 Bacteria and
      non-continuous density <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>

      <with|par-left|<quote|2tab>|2.6<space|2spc>Actracted Bacteria
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|2tab>|2.7<space|2spc>Parallelization
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-21>>
    </associate>
  </collection>
</auxiliary>