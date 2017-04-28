<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Lattice Boltzmann Methods>|<doc-author|<\author-data|<author-name|Martino
  Ferrari>>
    \;
  </author-data>>>

  <section|Introduction to Lattice Boltzmann methods>

  The <with|font-series|bold|LBM> is an evolution of the lattice gas automata
  (LGA) method and it permits to simulate very accuratly and more easly on
  modern computer (as it use float numbers instead of integer only) the
  beahvior of a fluid.\ 

  <big-figure|<with|<image|imgs/fluidimg3.jpg|245pt|100pt||>>|simulation of
  the hydro-dynamics of a keel>

  The application are multiples, from the study of the fluido-dynamics of a
  veichle (as in figure 1) to the simulation of the biological fluids in the
  body.\ 

  This is done solving the Navier-Stokes equation by the simulation of the
  streaming and collision process of the particles.

  The Navier-Stokes equations\ 

  However this simulation has many limitation:

  <\itemize>
    <item>sub-sonic speed only

    <item>uncomprimible fluids only

    <item>eating and chemical processes are not taken in account\ 

    <item>and many others
  </itemize>

  The use of floating point data permits to represent the density of the
  fluid and not the number of particles as in the LGA, in this way is
  possible to reach better results using smaller meshes.

  To avoid isotropy problem the LBM use 9 direction for 2D simulations, the 8
  neighbours and the cell itself.\ 

  The simulation as told before is divided in 2 main step:

  <\enumerate>
    <item>collsion step: where the particles collide inside the same cell\ 

    <item>streaming step: where the particles propagate from a cell to its
    neighbours
  </enumerate>

  <section|Implementation>

  The implementation in python 3 and is based on both the given template and
  the code shown in class.

  Each iteration is divided in outflow and inflow condition, equilibrium
  condition, collision step and streaming step.\ 

  <section|Results>

  With the initial configuration the results was very stable and no
  trubolence were produced (file :<with|font-shape|italic|vel_re0010.gif>):

  <big-figure|<image|re0010/vel.049.png|230pt|172pt||>|simulation with
  <with|font-shape|italic|Reynolds number = 10>>

  To be able to have some turbolence in the fluid I had to change Reynolds
  number to a much higher value (file: <with|font-shape|italic|vel_re1000.gif>).

  \;

  <big-figure|<image|re1000/out00049.png|230pt|172pt||>|Example of turbolence
  with <with|font-shape|italic|Reynolds number = 1000>>

  Adding more obstacles gave interesting results:

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|3obstacles/vel.020.png|150pt|114pt||>>|<cell|<image|square/vel.049.png|150pt|114pt||>>>|<row|<cell|<image|2obstacles/vel2.png|150pt|114pt||>>|<cell|<image|rect/vel.049.png|150pt|114pt||>>>>>>|multiple
  obstalce (and Re = 50)>

  <subsection|Questions:>

  <\enumerate>
    <item>adding new obstacle create more complex turbolences and patterns as
    shown in figure 4

    <item>the speed and the viscosity of the fluid are the variable that
    affect the more the simulation

    <item>to add the walls is very simple and all previous images are taken
    with the walls on:

    <\python-code>
      obstacle[:,0] = True

      obstacle[:,-1] = True
    </python-code>
  </enumerate>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-2|<tuple|1|1|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-3|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-4|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-5|<tuple|2|2|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-6|<tuple|3|2|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-7|<tuple|4|3|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-8|<tuple|3.1|3|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|firstHeading|<tuple|1|?|../../../.TeXmacs/texts/scratch/no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|simulation of the hydro-dynamics of a
      keel|<pageref|auto-2>>

      <tuple|normal|simulation with <with|font-shape|<quote|italic>|Reynolds
      number = 10>|<pageref|auto-5>>

      <tuple|normal|Example of turbolence with
      <with|font-shape|<quote|italic>|Reynolds number =
      1000>|<pageref|auto-6>>

      <tuple|normal|multiple obstalce (and Re = 50)|<pageref|auto-7>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Lattice Boltzmann methods> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Questions:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>
    </associate>
  </collection>
</auxiliary>