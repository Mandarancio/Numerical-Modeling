<TeXmacs|1.99.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Cellular Automata: Game of Life & Parity
  Rule>|<doc-author|<author-data|<author-name|Martino Ferrari>>>>

  <section|Introduction to Cellular Automata>

  Cellular Automata are very simple discrete models introduced in the 40s by
  Stanislaw Ulam and John von Neumann. A Cellular Automaton consists in a
  matrix of <em|cells>, each one in certain state. At each iteration the
  state of the cells will evolve according to some fixed <em|rules> depending
  by the status of the neighborhood.

  There most common types of neighborhood are the following:

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
    Moore
  </cell>|<cell|>|<\cell>
    <space|1.3em>van

    Neumann
  </cell>>>>>|most common type of neighborhood>

  \ \ 

  <subsection|Game of Life>

  <subsection|Parity Rule>

  <section|Implementation>

  <section|Results>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1.1|?>>
    <associate|auto-4|<tuple|1.2|?>>
    <associate|auto-5|<tuple|2|?>>
    <associate|auto-6|<tuple|3|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Cellular Automata> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Game of Life
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Parity Rule
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>