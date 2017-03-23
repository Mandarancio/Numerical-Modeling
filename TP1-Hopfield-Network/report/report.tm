<TeXmacs|1.99.4>

<style|generic>

<\body>
  <doc-data|<doc-title|Hopfield Network>|<doc-author|<\author-data|<author-name|Martino
  Ferrari>>
    \;
  </author-data>>>

  <section|Introduction to Hopfield Network>

  \;

  <section|Implementation>

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../img20/bird.gif|14pt|14pt||>>|<cell|<image|../img20/crab.gif|14pt|14pt||>>|<cell|<image|../img20/fish.gif|14pt|14pt||>>|<cell|<image|../img20/myth.gif|14pt|14pt||>>|<cell|<image|../img20/head.gif|14pt|14pt||>>>>>>|
  example images>

  \;

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../alphabet/a.gif|14pt|14pt||>>|<cell|<image|../alphabet/b.gif|14pt|14pt||>>|<cell|<image|../alphabet/c.gif|14pt|14pt||>>|<cell|<image|../alphabet/d.gif|14pt|14pt||>>|<cell|<image|../alphabet/e.gif|14pt|14pt||>>|<cell|<image|../alphabet/f.gif|14pt|14pt||>>|<cell|<image|../alphabet/g.gif|14pt|14pt||>>>|<row|<cell|<image|../alphabet/h.gif|14pt|14pt||>>|<cell|<image|../alphabet/i.gif|14pt|14pt||>>|<cell|<image|../alphabet/l.gif|14pt|14pt||>>|<cell|<image|../alphabet/m.gif|14pt|14pt||>>|<cell|<image|../alphabet/n.gif|14pt|14pt||>>|<cell|<image|../alphabet/o.gif|14pt|14pt||>>|<cell|<image|../alphabet/p.gif|14pt|14pt||>>>|<row|<cell|<image|../alphabet/q.gif|14pt|14pt||>>|<cell|<image|../alphabet/r.gif|14pt|14pt||>>|<cell|<image|../alphabet/s.gif|14pt|14pt||>>|<cell|<image|../alphabet/t.gif|14pt|14pt||>>|<cell|<image|../alphabet/u.gif|14pt|14pt||>>|<cell|<image|../alphabet/v.gif|14pt|14pt||>>|<cell|<image|../alphabet/z.gif|14pt|14pt||>>>>>>|Italian
  alphabet>

  <section|Results>

  \;

  <\big-figure|<image|error_0.4_20.png|575px|431px||>>
    Error, STD and unidentified ratio evolution with the number of images
    (noise fixed at 0.4)
  </big-figure>

  \;

  <\big-figure|<image|error_5_normal.png|575px|431px||>>
    Error, STD and unidentified ratio evoltuin with the noise (5 images)
  </big-figure>

  <big-figure|<image|error_5_inverse.png|575px|431px||>|Error, STD and
  unidentified ratio evoltuin with the noise (5 images) with negative check>

  \;

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-2|<tuple|2|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-3|<tuple|1|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-4|<tuple|2|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-5|<tuple|3|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-6|<tuple|3|1|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-7|<tuple|4|2|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
    <associate|auto-8|<tuple|5|2|../../../../.TeXmacs/texts/scratch/no_name_1.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal| example images|<pageref|auto-3>>

      <tuple|normal|Italian alphabet|<pageref|auto-4>>

      <\tuple|normal>
        Error, STD and unidentified ratio evolution with the number of images
        (noise fixed at 0.4)
      </tuple|<pageref|auto-6>>

      <\tuple|normal>
        Error, STD and unidentified ratio evoltuin with the noise (5 images)
      </tuple|<pageref|auto-7>>

      <tuple|normal|Error, STD and unidentified ratio evoltuin with the noise
      (5 images) with negative check|<pageref|auto-8>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Hopfield Network> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>