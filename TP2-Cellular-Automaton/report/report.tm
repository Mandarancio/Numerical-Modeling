<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Cellular Automata: Game of Life & Parity
  Rule>|<doc-author|<author-data|<author-name|Martino Ferrari>>>>

  <section|Introduction to Cellular Automata>

  Cellular Automata (<with|font-series|bold|CA>) are very simple discrete
  models introduced in the 40s by Stanislaw Ulam and John von Neumann.\ 

  A Cellular Automaton consists in a matrix of <em|cells>, each one in
  certtain status. At time <math|t=>0 the automaton is at initial status
  <math|s<around*|(|0|)>=s<rsub|0>> (fixed by the user), at each iteration
  the status of the cells will evolve according to some fixed <em|rules>
  <math|s<around*|(|t+1|)>=r<around*|(|s<around*|(|t|)>|)>>.\ 

  In particular the rules define the future status of each cell on two
  factors: the current status of the cell and the current status of it's
  neighborhood. The most common types of neighborhood are the following:

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-width|5em>|<cwith|2|2|1|1|cell-hmode|min>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-hyphen|t>|<cwith|2|2|3|3|cell-width|5em>|<cwith|2|2|3|3|cell-hmode|exact>|<cwith|2|2|3|3|cell-hyphen|n>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|3|3|3|3|cell-background|red>|<cwith|3|3|2|2|cell-background|dark
  blue>|<cwith|2|2|3|3|cell-background|dark
  blue>|<cwith|4|4|3|3|cell-background|dark
  blue>|<cwith|3|3|4|4|cell-background|dark
  blue>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>>|<cell|>|<cell|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|3|3|3|3|cell-background|red>|<cwith|3|3|2|2|cell-background|dark
  blue>|<cwith|2|2|3|3|cell-background|dark
  blue>|<cwith|4|4|3|3|cell-background|dark
  blue>|<cwith|3|3|4|4|cell-background|dark
  blue>|<cwith|2|2|2|2|cell-background|dark
  blue>|<cwith|4|4|2|2|cell-background|dark
  blue>|<cwith|2|2|4|4|cell-background|dark
  blue>|<cwith|4|4|4|4|cell-background|dark
  blue>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>>>|<row|<\cell>
    <space|1.3em>von Neumann
  </cell>|<cell|>|<\cell>
    Moore
  </cell>>>>>|most common type of neighborhood>

  For this TP we were asked to implement two different rule-sets for
  theCellular Automaton, the <with|font-shape|italic|Game of Life> (based on
  the Moore neighborhood) and the <with|font-shape|italic|Parity Rule> (based
  on the von Neumann neighborhood)

  <subsection|Game of Life>

  The <with|font-shape|italic|Game of Life> was proposed by J. H. Conway in
  the 70s and is possibly the more knwon CA, and yet very simple. Each cell
  can be alive (1) or dead (0) and has 8 neighboors (Moore neighborood); this
  means that there are <math|2<rsup|9>> (8 neighboors + 1, the cell) possible
  state of the neighboorod. The rules are very simple as well:

  <\itemize>
    <item>if the cell is alive:

    <\itemize>
      <item>if 2 or 3 neighbors are alive it stays alive

      <item>else it dies
    </itemize>

    <item>if the cell is dead:

    <\itemize>
      <item>if there are exactly 3 living neighboors it lives

      <item>else it stays died
    </itemize>
  </itemize>

  Even with this very simple rules this automata it's capable of many
  interesting thinks and it is <with|font-series|medium|<with|font-shape|italic|Turing
  complete<with|font-series|bold|>>>. With complex configuration is possible
  to generate counters, timers, primes number and much more.

  <subsection|Parity Rule>

  The <with|font-shape|italic|Parity Rule> CA was proposed by E. Fredkin as
  well in the 70s. As in the <with|font-shape|italic|Game of Life> the state
  <math|\<psi\><rsub|t><around*|(|i,j|)>> of each cell
  <math|<around*|(|i,j|)>> as only two possible values. However this time the
  neighborhood is composed by only 4 cells (van Neumann neighborood) and so
  there are <math|2<rsup|5>> possible configuration. The rule this time can
  be represented as a mathematical formula:

  <\equation*>
    \<psi\><rsub|t+1><around*|(|i,j|)>=\<psi\><rsub|t><around*|(|i+1,j|)>\<oplus\>\<psi\><around*|(|i-1,j|)>\<oplus\>\<psi\><around*|(|i,j+1|)>\<oplus\>\<psi\><around*|(|i,j-1|)>
  </equation*>

  Even this simple automata can produce interesting result and patterns
  during its evolution

  <subsection|Border condition>

  Due to the neture of this model the border condition of the simulation is
  very important as we need to represent the neighboors of the cell close to
  the limit of the matrix, the possible configurations are mainly 3:

  <\itemize>
    <item>Periodic: the matrix repeat it self at the border creating a torus

    <item>Fixed value: the neighboors outside the matrix as a fixed value
    (ex: 0)

    <item>Infinite matrix: the simulation matrix expand itself when some life
    cells touch the border (often used for comple Game of Life configuration)
  </itemize>

  <section|Implementation>

  We were asked to implement the Cellular Automaton model, the Game of Life
  rules and the Parity Rule in Python (version 3.5).

  \ 

  <section|Results>

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1.1|?>>
    <associate|auto-4|<tuple|1.2|?>>
    <associate|auto-5|<tuple|1.3|?>>
    <associate|auto-6|<tuple|2|?>>
    <associate|auto-7|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|most common type of neighborhood|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Cellular Automata> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Game of Life
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Parity Rule
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Border condition
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>