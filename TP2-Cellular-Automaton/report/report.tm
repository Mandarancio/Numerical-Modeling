<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Cellular Automata: Game of Life & Parity
  Rule>|<doc-author|<author-data|<author-name|Martino Ferrari>>>>

  <section|Introduction to Cellular Automata>

  Cellular Automata (<with|font-series|bold|CA>) are very simple discrete
  models introduced in the 40s by Stanislaw Ulam and John von Neumann.\ 

  A Cellular Automaton consists in a matrix of <em|cells>, each one in
  certain status. At time <math|t=>0 the automaton is at initial status
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

  For this TP we were asked to implement two different rule-sets for the
  Cellular Automaton, the <with|font-shape|italic|Game of Life> (based on the
  Moore neighborhood) and the <with|font-shape|italic|Parity Rule> (based on
  the von Neumann neighborhood)

  <subsection|Game of Life>

  The <with|font-shape|italic|Game of Life> was proposed by J. H. Conway in
  the 70s and is possibly the more known CA, and yet very simple. Each cell
  can be alive (1) or dead (0) and has 8 neighbors (Moore neighborhood); this
  means that there are <math|2<rsup|9>> (8 neighbors + 1, the cell) possible
  state of the neighborhood. The rules are very simple as well:

  <\itemize>
    <item>if the cell is alive:

    <\itemize>
      <item>if 2 or 3 neighbors are alive it stays alive

      <item>else it dies
    </itemize>

    <item>if the cell is dead:

    <\itemize>
      <item>if there are exactly 3 living neighbors it lives

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
  neighborhood is composed by only 4 cells (van Neumann neighborhood) and so
  there are <math|2<rsup|5>> possible configuration. The rule this time can
  be represented as a mathematical formula:

  <\equation*>
    \<psi\><rsub|t+1><around*|(|i,j|)>=\<psi\><rsub|t><around*|(|i+1,j|)>\<oplus\>\<psi\><around*|(|i-1,j|)>\<oplus\>\<psi\><around*|(|i,j+1|)>\<oplus\>\<psi\><around*|(|i,j-1|)>
  </equation*>

  Even this simple automata can produce interesting result and patterns
  during its evolution

  <subsection|Border condition>

  Due to the nature of this model the border condition of the simulation is
  very important as we need to represent the neighbors of the cell close to
  the limit of the matrix, the possible configurations are mainly 3:

  <\itemize>
    <item>Periodic: the matrix repeat it self at the border creating a torus

    <item>Fixed value: the neighbors outside the matrix as a fixed value (ex:
    0)

    <item>Dynamic matrix: the simulation matrix expand itself when some life
    cells touch the border (often used for complex Game of Life
    configuration)
  </itemize>

  <section|Implementation>

  We were asked to implement the Cellular Automaton model, the Game of Life
  rules and the Parity Rule in Python (version 3).

  I implemented the rules as <with|font-shape|italic|look up tables>, avoid
  all the spatial loop and using the periodic border condition as requested.

  To implement a single algorithm for the two rule set demanded I decided to
  first indexing the neighborhood:

  <big-figure|<tabular|<tformat|<cwith|2|2|1|1|cell-width|5em>|<cwith|2|2|1|1|cell-hmode|min>|<cwith|2|2|1|1|cell-halign|c>|<cwith|2|2|1|1|cell-hyphen|t>|<cwith|2|2|3|3|cell-width|5em>|<cwith|2|2|3|3|cell-hmode|exact>|<cwith|2|2|3|3|cell-hyphen|n>|<cwith|2|2|3|3|cell-halign|c>|<table|<row|<cell|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|3|3|2|4|cell-background|light
  grey>|<cwith|2|4|3|3|cell-background|light
  grey>|<cwith|3|3|3|3|cell-background|pastel
  grey>|<cwith|2|4|2|4|cell-halign|c>|<cwith|2|4|2|4|cell-valign|t>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|1>|<cell|>|<cell|>>|<row|<cell|>|<cell|4>|0|<cell|2>|<cell|>>|<row|<cell|>|<cell|>|<cell|3>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>>|<cell|>|<cell|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|2|4|2|4|cell-background|light
  grey>|<cwith|3|3|3|3|cell-background|pastel
  grey>|<cwith|2|4|1|-1|cell-halign|c>|<cwith|2|4|1|-1|cell-valign|t>|<cwith|4|4|2|2|cell-background|pastel
  blue>|<cwith|2|2|2|2|cell-background|pastel
  blue>|<cwith|2|2|4|4|cell-background|pastel
  blue>|<cwith|4|4|4|4|cell-background|pastel
  blue>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|7>|<cell|1>|<cell|5>|<cell|>>|<row|<cell|>|<cell|4>|<cell|0>|<cell|2>|<cell|>>|<row|<cell|>|<cell|8>|<cell|3>|<cell|6>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>>>|<row|<\cell>
    <space|1.3em>von Neumann
  </cell>|<cell|>|<\cell>
    Moore
  </cell>>>>>|neighborhood indexing>

  Then I represented the status of the neighborhood as a chain of 9 bits
  (represented using an <with|font-shape|italic|integer>):

  <big-figure|<math|N<around*|(|i,j|)>=<tabular|<tformat|<cwith|1|1|1|-1|cell-tborder|1ln>|<cwith|1|1|1|-1|cell-bborder|1ln>|<cwith|1|1|1|-1|cell-lborder|1ln>|<cwith|1|1|1|-1|cell-rborder|1ln>|<cwith|1|1|1|4|cell-background|pastel
  blue>|<cwith|1|1|9|9|cell-background|pastel
  grey>|<cwith|1|1|5|8|cell-background|light
  grey>|<table|<row|<cell|n<rsup|i,j><rsub|8>>|<cell|n<rsup|i,j><rsub|7>>|<cell|n<rsup|i,j><rsub|6>>|<cell|n<rsup|i,j><rsub|5>>|<cell|n<rsup|i,j><rsub|4>>|<cell|n<rsup|i,j><rsub|3>>|<cell|n<rsup|i,j><rsub|2>>|<cell|n<rsup|i,j><rsub|1>>|<cell|n<rsub|0><rsup|i,j>>>>>>>|binary
  representation>

  For the <with|font-shape|italic|parity rule> the state of
  <math|n<rsup|i,j><rsub|0>> (the current status of the cell) is not taken in
  account while computing the new state, however for compatibility reason I
  choose to represnt it anyways.\ 

  The rules will be represented in the form of a dictionary where the key is
  a possible state of the neighborhood and the value is 1 or 0 (possible
  state of the cell):

  <\python-code>
    # Possible Parity Rule

    rule = {\ 

    \ \ \ \ \ \ \ \ 0b11110: 0,

    \ \ \ \ \ \ \ \ 0b11111: 0,

    \ \ \ \ \ \ \ \ 0b10110: 1,

    \ \ \ \ \ \ \ \ 0b10111: 1,

    \ \ \ \ \ \ \ \ ....

    \ \ \ \ \ \ }
  </python-code>

  To summirize the system will do the following (for the parity case):

  <big-figure|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|5|5|2|2|cell-background|black>|<cwith|1|1|5|5|cell-background|black>|<cwith|3|3|2|2|cell-background|black>|<cwith|4|4|3|3|cell-background|black>|<cwith|1|1|1|1|cell-background|black>|<cwith|3|3|4|4|cell-background|black>|<cwith|3|3|3|3|cell-background|red>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>||<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>><math|\<longrightarrow\>><python|n=0b11101
  (29)><math|\<longrightarrow\>><python|rule[n]=1><math|\<longminus\>\<rightarrow\>><tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|3|3|2|2|cell-background|black>|<cwith|4|4|3|3|cell-background|black>|<cwith|3|3|4|4|cell-background|black>|<cwith|3|3|3|3|cell-background|black>|<cwith|2|2|3|3|cell-background|black>|<cwith|2|2|2|2|cell-background|black>|<cwith|1|1|1|-1|cell-background|>|<cwith|5|5|1|-1|cell-background|>|<cwith|2|2|4|4|cell-background|black>|<cwith|1|1|1|1|cell-background|black>|<cwith|1|1|5|5|cell-background|black>|<cwith|3|3|5|5|cell-background|black>|<cwith|3|3|1|1|cell-background|black>|<cwith|4|4|2|2|cell-background|black>|<cwith|4|4|4|4|cell-background|>|<cwith|5|5|1|1|cell-background|black>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>||<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>|example
  of iteration>

  To avoid spatial loop I used first the function
  <with|font-shape|italic|numpy.roll> to compute the neighborhood status and
  then a <with|font-shape|italic|lambda> function vectorialized using the
  function <with|font-shape|italic|numpy.vectorize()> to apply the rules.

  Moreover the python code suport both the <with|font-shape|italic|lif> and
  the more complete <with|font-shape|italic|rle> file format (as most of the
  existing configuration are in this format).

  To configure the simulator I chose to use a <with|font-shape|italic|json>
  file on this form:

  <\python-code>
    {

    \ \ "config":"configurations/UnitCell.rle",

    \ \ "config_version":"rle", # or lif

    \ \ "plotmode":"stored", # or animated

    \ \ "iterations":500,

    \ \ "output_path":"plots/",

    \ \ "mode":"gameOfLife" # or parityRule

    }
  </python-code>

  <section|Results>

  <subsection|Game of Life>

  After implementing the CA and the presented rules, I tested it on a known
  stable configuration of the <with|font-shape|italic|Game of Life>:

  <big-figure|<tabular|<tformat|<cwith|1|-1|1|-1|cell-width|1em>|<cwith|1|-1|1|-1|cell-hmode|exact>|<cwith|1|-1|1|-1|cell-height|1em>|<cwith|1|-1|1|-1|cell-vmode|exact>|<cwith|1|-1|1|-1|cell-tborder|1ln>|<cwith|1|-1|1|-1|cell-bborder|1ln>|<cwith|1|-1|1|-1|cell-lborder|1ln>|<cwith|1|-1|1|-1|cell-rborder|1ln>|<cwith|3|3|2|2|cell-background|black>|<cwith|4|4|3|3|cell-background|black>|<cwith|3|3|3|3|cell-background|black>|<cwith|5|5|1|-1|cell-background|>|<cwith|4|4|2|2|cell-background|black>|<cwith|1|-1|1|1|cell-background|>|<cwith|1|2|1|-1|cell-background|>|<cwith|2|4|4|5|cell-background|>|<table|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>||<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>|<row|<cell|>|<cell|>|<cell|>|<cell|>|<cell|>>>>>|a
  stable configuration for Game of Life rules >

  The results of this first simulation (configuration:
  <with|font-shape|italic|configurations/tests/stable.rle>) is stable as
  predicted and the central square does not evolve in time:

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../plots/stable/it_0001.png|90pt|70pt||>>|<cell|<image|../plots/stable/it_0002.png|90pt|70pt||>>>|<row|<cell|<image|../plots/stable/it_0003.png|90pt|70pt||>>|<cell|<image|../plots/stable/it_0003.png|90pt|70pt||>>>>>>|first
  4 iterations of the simulation of a stable configuration >

  After this first successfully test I wanted to a more interesting and
  dynamic configuration, in particular a classical
  <with|font-shape|italic|Game of Life >configuration is the
  <with|font-shape|italic|glider gun>:

  <\big-figure|<image|../imgs/Game_of_life_glider_gun.png|228pt|66pt||>>
    <with|font-shape|italic|Glider Gun> configuration
  </big-figure>

  The results of this simulation (configuration:
  <with|font-shape|italic|configurations/tests/glidergun.rle>) is as expected
  a periodical structure (the cannon) firing periodically the gliders (gif:
  <with|font-shape|italic|gifs/glidergun.gif>):

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../plots/glidergun/it_0000.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0005.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0015.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0020.png|90pt|70pt||>>>|<row|<cell|<image|../plots/glidergun/it_0025.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0030.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0035.png|90pt|70pt||>>|<cell|<image|../plots/glidergun/it_0040.png|90pt|70pt||>>>>>>|first
  40 iterations of the simulation of a <with|font-shape|italic|glider gun> (5
  steps per image)>

  Using a combination of <with|font-shape|italic|cannons> and other
  oscillator is possible to create very complex structures, like clocks,
  prime numbers calculator and more. However to simulate this kind of
  structure huge matrix are demanded (or better dynamic matrix, not
  implemented in my code) and due the relatively poor display (using
  <with|font-shape|italic|matplotlib>) performance is impossible to run
  those.

  However I execute some smaller (<math|500\<times\>500>, 4ms per step)
  interesting configurations as the <with|font-shape|italic|UnitCell>
  (<with|font-shape|italic|configuration/UnitCell.rle>) that with an infinite
  matrix is able to copy itself (gif: <with|font-shape|italic|gifs/unitcell.gif>):

  <big-figure|<image|../plots/unitcell/it_0100.png|920px|690px||>|<with|font-shape|italic|UnitCell>
  configuration>

  <subsection|Parity Rule>

  Also using the <with|font-shape|italic|Parity Rule> generate interesting
  results, in particular it creates many periodical structure like
  (<with|font-shape|italic|configurations/tests/letter.rle)>:

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../plots/letters/it_0000.png|90pt|70pt||>>|<cell|<image|../plots/letters/it_0004.png|90pt|70pt||>>>|<row|<cell|<image|../plots/letters/it_0008.png|90pt|70pt||>>|<cell|<image|../plots/letters/it_0012.png|90pt|70pt||>>>>>>|first
  12 iterations (4 steps per image) of the simulation of a simple
  configuration>

  A more interesting and bigger simulation (<math|200\<times\>200>) give the
  following pattern (<with|font-shape|italic|configurations/tests/hugeparity.rle>):

  <\big-figure>
    <tabular|<tformat|<cwith|1|-1|1|1|cell-halign|c>|<table|<row|<cell|<tabular|<tformat|<table|<row|<cell|<image|../plots/party4/it_0000.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0010.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0020.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0030.png|90pt|70pt||>>>|<row|<cell|<image|../plots/party4/it_0040.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0050.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0060.png|90pt|70pt||>>|<cell|<image|../plots/party4/it_0070.png|90pt|70pt||>>>>>>>>|<row|<cell|<image|../plots/party4/it_0090.png|920px|690px||>>>>>><tabular|<tformat|<table|<row|<cell|>>>>>

    \;

    \;
  </big-figure|first 90 iterations of the simulation of a
  <with|font-shape|italic|glider gun> (10 steps per image)>

  This results are obtained because in <math|2<rsup|>> iterations (without
  interference) the pattern is copied in 4 new positions (gif:
  <with|font-shape|italic|gifs/parity4.gif>). This results can be
  mathematically proved, with a empty m<math|>matrix with a only cell alive
  in the position <math|i,j> at the second iteration:

  <\equation*>
    \<psi\><rsub|t+1><around*|(|i,j|)>=\<psi\><rsub|t><around*|(|i+1,j|)>\<oplus\>\<psi\><rsub|t><around*|(|i-1,j|)>\<oplus\>\<psi\><rsub|t><around*|(|i,j+1|)>\<oplus\>\<psi\><rsub|t><around*|(|i,j-1|)>
  </equation*>

  decomposing each sub term to time <math|t-1>:

  <\equation*>
    \<psi\><rsub|t><around*|(|i+1,j|)>=<with|font-series|bold|\<psi\><rsub|t-1><around*|(|i+2,j|)>>\<oplus\><with|color|blue|\<psi\><rsub|t-1><around*|(|i,j|)>>\<oplus\><with|color|red|\<psi\><rsub|t-1><around*|(|i+1,j+1|)>>\<oplus\><with|color|dark
    green|\<psi\><rsub|t-1><around*|(|i+1,j-1|)>>
  </equation*>

  <\equation*>
    \<psi\><rsub|t><around*|(|i-1,j|)>=<with|color|blue|\<psi\><rsub|t-1><around*|(|i,j|)>>\<oplus\><with|font-series|bold|\<psi\><rsub|t-1><around*|(|i-2,j|)>>\<oplus\><with|color|orange|\<psi\><rsub|t-1><around*|(|i-1,j+1|)>>\<oplus\><with|color|magenta|\<psi\><rsub|t-1><around*|(|i-1,j-1|)>>
  </equation*>

  <\equation*>
    \<psi\><rsub|t><around*|(|i,j+1|)>=<with|color|red|\<psi\><rsub|t-1><around*|(|i+1,j+1|)>>\<oplus\><with|color|orange|\<psi\><rsub|t-1><around*|(|i-1,j+1|)>>\<oplus\><with|font-series|bold|\<psi\><rsub|t-1><around*|(|i,j+2|)>>\<oplus\><with|color|blue|\<psi\><rsub|t-1><around*|(|i,j|)>>
  </equation*>

  <\equation*>
    \<psi\><rsub|t><around*|(|i,j-1|)>=<with|color|dark
    green|\<psi\><rsub|t-1><around*|(|i+1,j-1|)>>\<oplus\><with|color|magenta|\<psi\><rsub|t-1><around*|(|i-1,j-1|)>>\<oplus\><with|color|blue|\<psi\><rsub|t-1><around*|(|i,j|)>>\<oplus\><with|font-series|bold|\<psi\><rsub|t-1><around*|(|i,j-2|)>>
  </equation*>

  in this composition I evidenced the common terms, as you can notice all
  this terms appear in even number and as <math|a\<oplus\>a=0> all this terms
  can be discarded and so we can rewrite the form:

  <\equation*>
    \<psi\><rsub|t+1><around*|(|i,j|)>=\<psi\><rsub|<with|font-series|bold|t-1>><around*|(|i+<with|font-series|bold|2>,j|)>\<oplus\>\<psi\><rsub|<with|font-series|bold|t-1>><around*|(|i-<with|font-series|bold|2>,j|)>\<oplus\>\<psi\><rsub|<with|font-series|bold|t-1>><around*|(|i,j+<with|font-series|bold|2>|)>\<oplus\>\<psi\><rsub|<with|font-series|bold|t-1>><around*|(|i,j-<with|font-series|bold|2>|)>
  </equation*>

  This implicate that pattern is repeated every 2 iteration producing the
  result expected. Using this result it could be possible to compute in
  advance the status of the automaton, however this is more complex with the
  periodic border condition we implemented as when the border are reached the
  structure will start to present some interference (as in figure 11) and it
  will start to repeat (regressing to the initial status) itself.

  <subsection|Conclusion>

  In conclusion the overall performance of the implementation are acceptable,
  and the bottleneck of the system is due to the poor graphic performance of
  <with|font-shape|italic|matplotlib> and can be solved using opengl or other
  graphical library.\ 

  The two rules implemented have both interesting behaviors but due to the
  lack of the implementation of the <with|font-shape|italic|infinite matrix>
  border condition is not possible to simulate \ many of the more interesting
  configurations.
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|3|3>>
    <associate|auto-11|<tuple|3.1|3>>
    <associate|auto-12|<tuple|5|3>>
    <associate|auto-13|<tuple|6|3>>
    <associate|auto-14|<tuple|7|4>>
    <associate|auto-15|<tuple|8|4>>
    <associate|auto-16|<tuple|9|4>>
    <associate|auto-17|<tuple|3.2|5>>
    <associate|auto-18|<tuple|10|5>>
    <associate|auto-19|<tuple|11|5>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-20|<tuple|3.3|6>>
    <associate|auto-3|<tuple|1.1|1>>
    <associate|auto-4|<tuple|1.2|1>>
    <associate|auto-5|<tuple|1.3|2>>
    <associate|auto-6|<tuple|2|2>>
    <associate|auto-7|<tuple|2|2>>
    <associate|auto-8|<tuple|3|2>>
    <associate|auto-9|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|most common type of neighborhood|<pageref|auto-2>>

      <tuple|normal|neighborhood indexing|<pageref|auto-7>>

      <tuple|normal|binary representation|<pageref|auto-8>>

      <tuple|normal|example of iteration|<pageref|auto-9>>

      <tuple|normal|a stable configuration for Game of Life rules
      |<pageref|auto-12>>

      <tuple|normal|first 4 iterations of the simulation of a stable
      configuration |<pageref|auto-13>>

      <\tuple|normal>
        <with|font-shape|<quote|italic>|Glider Gun> configuration
      </tuple|<pageref|auto-14>>

      <tuple|normal|first 40 iterations of the simulation of a
      <with|font-shape|<quote|italic>|glider gun> (5 steps per
      image)|<pageref|auto-15>>

      <tuple|normal|<with|font-shape|<quote|italic>|UnitCell>
      configuration|<pageref|auto-16>>

      <tuple|normal|first 12 iterations (4 steps per image) of the simulation
      of a simple configuration|<pageref|auto-18>>

      <tuple|normal|first 90 iterations of the simulation of a
      <with|font-shape|<quote|italic>|glider gun> (10 steps per
      image)|<pageref|auto-19>>
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
      <no-break><pageref|auto-10><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Game of Life
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Parity Rule
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-17>>

      <with|par-left|<quote|1tab>|3.3<space|2spc>Conclusion
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-20>>
    </associate>
  </collection>
</auxiliary>