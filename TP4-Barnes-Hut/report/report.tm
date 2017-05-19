<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|N-Body Problem and Barnes-Hut
  Algorithm>|<doc-author|<\author-data|<author-name|Martino Ferrari>>
    \;
  </author-data>>>

  <section|N-Body>

  <big-figure|<image|nbody.jpg|639px|359px||>|Classical
  <with|font-shape|italic|N-Body> problem>

  The <with|font-shape|italic|N-Body> problem is a classical astronomical
  problem to predict the motion of <with|font-shape|italic|N> celestial
  objects. With only 2 bodies the problem is completely solved, however with
  3 or more bodies there is no exact solution and only numerical simulation
  can give us a prediction of the motion.

  The motion of the bodies is driven by the gravitational interactions
  between them, the gravitational force is given by the Newton's law of
  universal gravitation:

  <\equation*>
    F=G<frac|m<rsub|1>m<rsub|2>|r<rsup|2>>
  </equation*>

  As from the second Newton's motion low we know that:

  <\equation*>
    F=m\<cdot\>a
  </equation*>

  We can derive the acceleration of each gravitational interaction, than is
  possible to integrate the acceleration twice to get the position of body at
  a certain time instant.

  However to be able to compute the interactions of the
  <with|font-shape|italic|N> bodies we need to compute the acceleration
  <math|N<rsup|2>> times, or with simple optimizations
  <math|<frac|N<around*|(|N-1|)>|2>> times (still of order
  <math|\<cal-O\><around*|(|n<rsup|2>|)>>).\ 

  For this reason for big number of bodies there is the need of using more
  sophisticated algorithms. \ 

  <section|Barnes-Hut>

  The <with|font-shape|italic|Barnes-Hut> simulation is an approximation of
  the <with|font-shape|italic|N-Body> simulation that permits to perform
  simulation with very similar accuracy with a an order of
  <math|\<cal-O\><around*|(|n log<around*|(|n|)>|)>> instead of
  <math|\<cal-O\><around*|(|n<rsup|2>|)>>. This improvement is reached by the
  subdivision of the space in sub-quadrant organized as a tree.\ 

  <big-figure| <image|burnes_hut.png|300pt|199pt||>|2D
  <with|font-shape|italic|Barnes-Hut> space division>

  As the gravitational force has a quadratic dependence to the distance of
  the bodies, far bodies have weak interaction and so it's possible to
  approximate the interaction of far away areas by just taking in account
  their average mass and gravity center.\ 

  Using a tree like structure is possible as well to have different
  granularity in different areas of the simulation as well as choosing the
  right level of granularity depending from the distance.

  <section|Implementation>

  The implementation of the 3D version of the code was straight forward,
  first adding the <with|font-shape|italic|z> coordinate to the node position
  and momentum, then dividing the space in 8 instead of 4, finally
  initializing the position of the bodies taking in account the new
  coordinate.

  The implementation of the brute force algorithm is also very simple as it's
  just a double for-loop.

  I choose to implement the simulation also in <with|font-shape|italic|C++>
  (only in 2D) using <with|font-shape|italic|SDL2> and a custom 2D vector
  implementation, the result in performance is incredibly better then the
  python one (around 100 <with|font-shape|italic|fps> real-time rendering
  even with the brute force algorithm).

  <section|Results>

  The first test was to check if the implementation was valid, after 500
  iteration the first body <with|font-shape|italic|z> coordinate was actually
  at 0.557 as expected.\ 

  The simulation of the galaxy was very slow and I interrupted after 5060
  iterations, in the following figure it's possible to see the evolution of
  the galaxy in 5000 steps (a <with|font-shape|italic|gif> file animation
  available).

  <big-figure|<tabular|<tformat|<cwith|1|-1|1|-1|cell-halign|c>|<table|<row|<cell|<image|../bodies3D_000000.png|460px|345px||>>|<cell|<image|../bodies3D_001000.png|460px|345px||>>|<cell|<image|../bodies3D_002000.png|460px|345px||>>>|<row|<cell|0>|<cell|1000>|<cell|2000>>|<row|<cell|<image|../bodies3D_003000.png|460px|345px||>>|<cell|<image|../bodies3D_004000.png|460px|345px||>>|<cell|<image|../bodies3D_005000.png|460px|345px||>>>|<row|<cell|3000>|<cell|4000>|<cell|5000>>>>>|First
  5000 iterations for the 3D <with|font-shape|italic|N-Body> simulation>

  Then we were asked to analyze the difference in performance between the
  Barnes-Hut method and the brute force one. To do so I choose to variate the
  number of bodies from 10 to 1000 (with varying interval) and simulate the
  first 100 iteration and plotting the average iteration time (numerical
  results are available in the <with|font-shape|italic|csv> files attached).

  <\big-figure>
    <image|avg_perf_500.png|920px|618px||>
  </big-figure|Difference in performance of the two algorithms>

  In the plot in figure 4 is possible to see how for small number er of
  bodies the <with|font-shape|italic|brute force> algorithm perform better of
  the <with|font-shape|italic|Barnes-Hut> one as the overhead of the tree
  creation is bigger of the advantages that it gives. However the tendency
  change and for 1000 bodies the <with|font-shape|italic|Barnes-Hut>
  algorithm perform better, as shown in figure 5.

  <\big-figure>
    <image|avg_perf.png|920px|618px||>
  </big-figure|Difference in performance of the two algorithms>

  The performance of the <with|font-shape|italic|Barnes-Hut >algorithm
  depends also from the distribution of the bodies in the space, as if the
  bodies are very close it will not be possible to \ take advantage of the
  spatial tree approximation.\ 

  Changing the initial condition of the simulation to a bigger radius (1.0)
  and faster initial speed (1.0) the results for the
  <with|font-shape|italic|Barnes-Hut >are much more promising (as expected),
  while of course no changes are detected for the
  <with|font-shape|italic|brute force> one:

  <big-table|<tabular|<tformat|<cwith|2|-1|1|1|cell-halign|r>|<cwith|1|1|1|1|cell-halign|r>|<cwith|1|-1|3|5|cell-halign|r>|<cwith|1|1|1|-1|cell-background|pastel
  cyan>|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|7|7|1|-1|cell-bborder|1ln>|<cwith|1|1|1|1|cell-tborder|1ln>|<cwith|7|7|1|1|cell-bborder|1ln>|<cwith|1|-1|1|1|cell-lborder|1ln>|<cwith|1|1|2|2|cell-tborder|1ln>|<cwith|7|7|2|2|cell-bborder|1ln>|<cwith|1|-1|2|2|cell-lborder|1ln>|<cwith|1|-1|1|1|cell-rborder|1ln>|<cwith|1|1|3|3|cell-tborder|1ln>|<cwith|7|7|3|3|cell-bborder|1ln>|<cwith|1|-1|3|3|cell-lborder|1ln>|<cwith|1|-1|2|2|cell-rborder|1ln>|<cwith|1|-1|3|3|cell-rborder|1ln>|<cwith|1|-1|4|4|cell-lborder|1ln>|<cwith|1|1|5|5|cell-tborder|1ln>|<cwith|7|7|5|5|cell-bborder|1ln>|<cwith|1|-1|5|5|cell-lborder|1ln>|<cwith|1|-1|4|4|cell-rborder|1ln>|<cwith|1|-1|5|5|cell-rborder|1ln>|<table|<row|<cell|Number
  of bodies>|<cell|Method>|<cell|Initial radius>|<cell|Initial
  speed>|<cell|Average time>>|<row|<cell|100>|<cell|BH>|<cell|0.1>|<cell|0.1>|<cell|0.049
  s>>|<row|<cell|100>|<cell|BF>|<cell|0.1>|<cell|0.1>|<cell|0.048
  s>>|<row|<cell|100>|<cell|BH>|<cell|1.0>|<cell|1.0>|<cell|0.017
  s>>|<row|<cell|200>|<cell|BH>|<cell|0.1>|<cell|0.1>|<cell|0.164
  s>>|<row|<cell|200>|<cell|BF>|<cell|0.1>|<cell|0.1>|<cell|0.125
  s>>|<row|<cell|200>|<cell|BH>|<cell|1.0>|<cell|1.0>|<cell|0.056
  s>>>>>|Difference in performance depending from initial condition>

  To improve the performance it would probably possible to implement a mixed
  simulator that choose the method to simulate depending on few condition
  (like sparsity of the bodies, number of bodies etc).

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-10|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|2|?>>
    <associate|auto-4|<tuple|2|?>>
    <associate|auto-5|<tuple|3|?>>
    <associate|auto-6|<tuple|4|?>>
    <associate|auto-7|<tuple|3|?>>
    <associate|auto-8|<tuple|4|?>>
    <associate|auto-9|<tuple|5|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Classical <with|font-shape|<quote|italic>|N-Body>
      problem|<pageref|auto-2>>

      <tuple|normal|2D <with|font-shape|<quote|italic>|Barnes-Hut> space
      division|<pageref|auto-4>>

      <tuple|normal|First 5000 iterations for the 3D
      <with|font-shape|<quote|italic>|N-Body> simulation|<pageref|auto-7>>

      <tuple|normal|Difference in performance of the two
      algrithms|<pageref|auto-8>>

      <tuple|normal|Difference in performance of the two
      algrithms|<pageref|auto-9>>
    </associate>
    <\associate|table>
      <tuple|normal||<pageref|auto-10>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>N-Body>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Barnes-Hut>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>