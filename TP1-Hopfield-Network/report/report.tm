<TeXmacs|1.99.5>

<style|generic>

<\body>
  <doc-data|<doc-title|Hopfield Network>|<doc-author|<\author-data|<author-name|Martino
  Ferrari>>
    \;
  </author-data>>>

  <section|Introduction to Hopfield Network>

  The Hopfield network (HN) is a simple artificial neural network able to
  memorize information and to restore it even after degradation.\ 

  <big-figure|<image|Hopfield-net.png|405px|422px||>|Representation of a
  4-neurons Hopfield network (source: Wikipedia.org) >

  An Hopfield network is composed of <math|N> nodes (neurons) all
  interconnected (as showing in figure 1), the value of a node is binary,
  <math|s<rsub|i>=\<pm\>1>. The interconnection between two nodes <math|i>
  and <math|j> has a certain weight <math|w<rsub|i,j>>.

  The values of the nodes evolve in time until it does not reach a stationary
  state, in particular the future value of the node <math|i> is given by:

  <\equation*>
    s<rsub|i><around*|(|t+1|)>=<text|<em|sgn>><around*|(|<big|sum><rsub|j=1><rsup|N>w<rsub|i,j>\<cdot\>s<rsub|j><around*|(|t|)>|)>
  </equation*>

  The weight matrix <math|W<rsup|<around*|{|N\<times\>N|}>>> is the result of
  the training process, that in the case of the Hopfield Networks is very
  simple and is done in one iteration.

  Given <math|M> pattern <math|<around*|(|S<rsup|1>,S<rsup|2>\<ldots\>S<rsup|M>|)><rsup|>>
  of size <math|N> to memorize the weight <math|w<rsub|i,j>> is computed as:

  <\equation*>
    w<rsub|i,j>=<frac|1|N><big|sum><rsup|M><rsub|k=1>s<rsup|k><rsub|i>\<cdot\>s<rsub|j><rsup|k>
  </equation*>

  The goal is to have an highly overfitted training over the given pattern in
  order to be able to memorize and recognize it.\ 

  <section|Implementation>

  In our case we were asked to implement a simple HN able to handle black and
  white images of <math|20\<times\>20> pixels (<math|N=400>) in
  <verbatim|python> (in used the version 3).

  To do so I choose to use a object oriented approach, representing the HN as
  a class with different methods for the training and the recognition.\ 

  To measure how close the reconstructed image <math|R> is to the original
  <math|O> one I implemented two different error function, the simplest is
  implemented as:

  <\equation*>
    e<rsub|s><around*|(|O,R|)>=<frac|1|N>*<big|sum><rsub|i=1><rsup|N><around*|(|<around*|\||o<rsub|i>-r<rsub|i>|\|>|)>
  </equation*>

  The second method however it take in account the fact that the
  reconstructed image can be the negative of the original (while the semantic
  of the image is conserved, the values of the vector are not conserved), and
  is implemented simply as:

  <\equation*>
    e<rsub|i><around*|(|O,R|)>=min<around*|(|e<rsub|s><around*|(|O,R|)>,e<rsub|s><around*|(|O,-R|)>|)>
  </equation*>

  Moreover I have chosen to implement a simple identify function
  <math|i<around*|(|R,S<rsup|<around*|{|M|}>>|)>> to identify the
  reconstructed image <math|R>, choosing the closest training image
  <math|S<rsup|i>>:

  <\equation*>
    i<around*|(|R,S<rsup|<around*|{|M|}>>|)>=<below|arg
    min|S<rsup|i>><around*|(|e<rsub|i><around*|(|S<rsup|i>,R|)><around*|\||<rsub|i=1><rsup|M>|\<nobracket\>>|)>
  </equation*>

  This information show us how the HN tend to reconstruct the noisy image to
  a wrong training image <math|S<rsup|i>> when the noise is to strong. \ 

  The given training pictures are shown in figure 2.\ 

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../img20/bird.gif|14pt|14pt||>>|<cell|<image|../img20/crab.gif|14pt|14pt||>>|<cell|<image|../img20/fish.gif|14pt|14pt||>>|<cell|<image|../img20/myth.gif|14pt|14pt||>>>>>>|
  example images>

  However to be able to test the HN with a larger training set I added 21
  images representing the Italian alphabet, shown in figure 3.

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|../alphabet/a.gif|14pt|14pt||>>|<cell|<image|../alphabet/b.gif|14pt|14pt||>>|<cell|<image|../alphabet/c.gif|14pt|14pt||>>|<cell|<image|../alphabet/d.gif|14pt|14pt||>>|<cell|<image|../alphabet/e.gif|14pt|14pt||>>|<cell|<image|../alphabet/f.gif|14pt|14pt||>>|<cell|<image|../alphabet/g.gif|14pt|14pt||>>>|<row|<cell|<image|../alphabet/h.gif|14pt|14pt||>>|<cell|<image|../alphabet/i.gif|14pt|14pt||>>|<cell|<image|../alphabet/l.gif|14pt|14pt||>>|<cell|<image|../alphabet/m.gif|14pt|14pt||>>|<cell|<image|../alphabet/n.gif|14pt|14pt||>>|<cell|<image|../alphabet/o.gif|14pt|14pt||>>|<cell|<image|../alphabet/p.gif|14pt|14pt||>>>|<row|<cell|<image|../alphabet/q.gif|14pt|14pt||>>|<cell|<image|../alphabet/r.gif|14pt|14pt||>>|<cell|<image|../alphabet/s.gif|14pt|14pt||>>|<cell|<image|../alphabet/t.gif|14pt|14pt||>>|<cell|<image|../alphabet/u.gif|14pt|14pt||>>|<cell|<image|../alphabet/v.gif|14pt|14pt||>>|<cell|<image|../alphabet/z.gif|14pt|14pt||>>>>>>|Italian
  alphabet>

  <section|Results>

  Before starting to evaluate my HN, I wanted to have some visual feedback,
  so I choose to train the HN with the first 3 example images and to see if
  was able to memorize its and then to recognize the images (figure 4).

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|base_test_3-images_noisy.png|230px|172px||>>>>>>|First
  success of the HN implementation>

  After succeeding in this first test I choose to see the result of the same
  operation but using a noisy image as source (I used the given method
  <verbatim|Image:add_noise(noiseThreshold)>).\ 

  <big-figure|<tabular|<tformat|<cwith|2|2|1|-1|cell-halign|c>|<table|<row|<cell|<image|base_test_3-images-noise_selected.png|230px|172px||>>|<cell|<image|base_test_3-images-noise_noisy.png|230px|172px||>>|<cell|<image|base_test_3-images-noise_reconstructed.png|230px|172px||>>>|<row|<cell|Original>|<cell|Noisy>|<cell|Reconstructed>>>>>|Reconstruction
  using the HN with 3 different image stored and <verbatim|noiseThreshold>
  0.2>

  The result of this second test is shown in figure 5, with a
  <verbatim|noiseThreshold> of 0.2 the noisy image has significant loss (20%
  of the pixels has changed), and the HN, trained on 3 images, converge in 6
  iterations to the successfully reconstructed image.

  To understand better how the noise will affect the reconstruction of the
  image I choose to visualize the variation of the mean error (using the
  <math|e<rsub|i><around*|(|O,R|)>> function), error STD and unidentified
  ratio varying the <verbatim|noiseThreshold>.

  <big-figure|<image|error_noq_3_inverse.png|575px|431px||>|Mean Error, STD
  and unidentified ratio of the HN varying the <verbatim|noiseThreshold>>

  For each noise level I executed 400 reconstruction and I used the result to
  compute the mean error, the error STD and the unidentified ratio (using the
  function <math|i<around*|(|R,S<rsup|<around*|{|M|}>>|)>>).

  In figure 6 is possible to see that the mean error has some sort of
  exponential trend while the STD is more smooth, moreover the effect of the
  noise on the unidentified ratio is even stronger.

  Finally, how I was expecting using the <math|e<rsub|i><around*|(|O,R|)>>
  function to compute the error results in a symmetric plot (a
  <verbatim|noiseThreshold> of 0.5 means that half of the pixels have
  changed, while 1.0 means that all the pixels have changed, resulting in the
  negative version of the original).

  The results of using the standard <math|e<rsub|s><around*|(|O,R|)>>
  function are shown in the foll wing figure:

  <big-figure|<image|error_noq_3_normal.png|460px|345px||>|Same analysis of
  figure 6 but using <math|e<rsub|s><around*|(||)>> as error function>

  \;

  I was also interested to see how the number of memorized images would
  affect the sensibility to the noise, for this reason I fixed the
  <verbatim|noiseThreshold> to 0.2 and using the alphabet series I varied the
  size <math|M> of <math|S<rsup|<around*|{|M|}>>>.

  <big-figure|<image|error_alphabet without Q_0.2_20.png|460px|345px||>|Mean
  error, error STD and unidentified ratio varying the size of the training
  set>

  The results, figure 8 (1000 runs for each point), show a highly non-linear
  behavior of the reconstruction quality against the size <math|M> of the
  training set. While with few images the mean error is 0 (or close to 0),
  with more then 5 images the mean error grow quickly, stabilizing around
  0.2.\ 

  <big-figure|<tabular|<tformat|<cwith|2|2|1|-1|cell-halign|c>|<cwith|4|4|1|-1|cell-halign|c>|<cwith|6|6|1|-1|cell-halign|c>|<table|<row|<cell|<image|error_alphabet
  without Q-w1.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w2.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w3.png|230px|172px||>>>|<row|<cell|2>|<cell|3>|<cell|4>>|<row|<cell|<image|error_alphabet
  without Q-w4.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w5.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w6.png|230px|172px||>>>|<row|<cell|5>|<cell|6>|<cell|7>>|<row|<cell|<image|error_alphabet
  without Q-w7.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w8.png|230px|172px||>>|<cell|<image|error_alphabet without
  Q-w9.png|230px|172px||>>>|<row|<cell|8>|<cell|9>|<cell|10>>>>>|The weight
  matrix <math|W<rsup|<around*|{|N\<times\>N|}>>> in function of <math|M>>

  In figure 9 is shown the evolution of the weight matrix
  <math|W<rsup|<around*|{|N\<times\>N|}>>> while increasing the size of the
  training set <math|M> from 2 to 9. At first
  <math|W<rsup|<around*|{|N\<times\>N|}>>> changes substantially, but soon
  the matrix saturates and the changes are smaller and smaller. This explain
  the inability to reconstruct the image correctly as well as the
  non-linearity of the behavior (until reaching the saturation point the
  information can be stored without problem).\ 

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|error_noq_4_inverse.png|333px|250px||>>|<cell|<image|error_noq_5_inverse.png|333px|250px||>>>>>>|noise
  intensity analysis with <math|M=4> and <math|5>>

  Figure 10 confirms the previous observations, showing how the mean error
  becomes independent from the noise with the increasing of the size of the
  training set.

  To solve this problem it's possible to change the training algorithm adding
  a support matrix <math|Q<rsup|<around*|{|M\<times\>M|}>>>, representing the
  similarity between the images (<math|q<rsub|n,m>\<in\><around*|[|-1,+1|]>>):

  <\equation*>
    q<rsub|n,m>=<frac|1|N><big|sum><rsub|i=1><rsup|N><around*|(|s<rsub|i><rsup|n>\<cdot\>s<rsub|i><rsup|m>|)>
  </equation*>

  This information is very useful to adapt the learning to the training set,
  as very different images are easily recognizable while closest ones are
  more difficult to distinguish.

  <big-figure|<tabular|<tformat|<cwith|2|2|1|-1|cell-halign|c>|<cwith|4|4|1|-1|cell-halign|c>|<cwith|6|6|1|-1|cell-halign|c>|<table|<row|<cell|<image|error_alphabet-w1.png|230px|172px||>>|<cell|<image|error_alphabet-w2.png|230px|172px||>>|<cell|<image|error_alphabet-w3.png|230px|172px||>>>|<row|<cell|2>|<cell|3>|<cell|4>>|<row|<cell|<image|error_alphabet-w4.png|230px|172px||>>|<cell|<image|error_alphabet-w5.png|230px|172px||>>|<cell|<image|error_alphabet-w6.png|230px|172px||>>>|<row|<cell|5>|<cell|6>|<cell|7>>|<row|<cell|<image|error_alphabet-w7.png|230px|172px||>>|<cell|<image|error_alphabet-w8.png|230px|172px||>>|<cell|<image|error_alphabet-w9.png|230px|172px||>>>|<row|<cell|8>|<cell|9>|<cell|10>>>>>|The
  weight matrix <math|W<rsup|<around*|{|N\<times\>N|}>>> in function of
  <math|M> trained using <math|Q<rsup|<around*|{|M\<times\>M|}>>>>

  With the new algorithm the evolution of
  <math|W<rsup|<around*|{|N\<times\>N|}>>> is different, the changes between
  every step are smaller and in this way it does not saturate.

  <\big-figure|<image|error_alphabet_0.4_20.png|460px|345px||>>
    Error, STD and unidentified ratio evolution with the number of images
    (trained using <math|Q>)
  </big-figure>

  For this reason the evolution of the mean error, error STD and unidentified
  ratio with the number of images is much more smoother even with
  <verbatim|noiseThreshold> fixed at 0.4 (before was fixed at 0.2).

  The same result can be observed in the noise domain:

  <big-figure|<tabular|<tformat|<table|<row|<cell|<image|error_4_inverse.png|333px|250px||>>|<cell|<image|error_5_inverse.png|333px|250px||>>>>>>|noise
  intensity analysis with <math|M=4> and <math|5> (trained using <math|Q>)>

  Even if a small degradation in the results is shown with the increasing of
  the size of the training set, now the effects are limited and the mean
  error depends primarily by the noise intensity and not from <math|M>
  anymore.

  Even with 21 images the results persists:

  <big-figure|<image|error_21_inverse.png|460px|345px||>|noise intensity
  analysis with <math|M=21> (trained using <math|Q>)>

  Visually, for the case of 21 images, the reconstruction works very well for
  <verbatim|noiseThreshold><math|\<less\>0.35>, for example for 0.2:

  <big-figure|<tabular|<tformat|<cwith|2|2|1|-1|cell-halign|c>|<table|<row|<cell|<image|base_test_alphabet_selected.png|230px|172px||>>|<cell|<image|base_test_alphabet_noisy.png|230px|172px||>>|<cell|<image|base_test_alphabet_reconstructed.png|230px|172px||>>>|<row|<cell|Original>|<cell|Noisy>|<cell|Reconstructed>>>>>|Reconstruction
  using the HN with 21 different image stored and <verbatim|noiseThreshold>
  0.2>

  Augmenting the resolution, and so the number of neurons of the HN, will
  increase even more the results, as the different <math|S<rsup|i>> will have
  more details and so dissimilarities.

  Overall the Hopfield network gave me very good results, especially after
  adding the support matrix <math|Q<rsup|<around*|{|M\<times\>M|}>>>, while
  being extremely simple and fast. With only 400 neurons it was able to
  memorize and distinguish more the 20 images, even when severely degraded
  (<verbatim|noiseThreshold> of 0.2 represents distortion of 160 of the 400
  pixels).\ 

  However the HN has several limitation, for example even if the input image
  is not present in the training set the HN will converge to one of the
  images of the trainging set (it is not able to reject false inputs) as well
  as it is not able to recognize any geometric transformation (rotation,
  resize, etc).

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|7|4>>
    <associate|auto-11|<tuple|8|4>>
    <associate|auto-12|<tuple|9|5>>
    <associate|auto-13|<tuple|10|5>>
    <associate|auto-14|<tuple|11|6>>
    <associate|auto-15|<tuple|12|6>>
    <associate|auto-16|<tuple|13|7>>
    <associate|auto-17|<tuple|14|7>>
    <associate|auto-18|<tuple|15|7>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|2|2>>
    <associate|auto-4|<tuple|2|2>>
    <associate|auto-5|<tuple|3|2>>
    <associate|auto-6|<tuple|3|2>>
    <associate|auto-7|<tuple|4|3>>
    <associate|auto-8|<tuple|5|3>>
    <associate|auto-9|<tuple|6|3>>
    <associate|result_box|<tuple|9|?>>
    <associate|tts_button|<tuple|9|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|Representation of a 4-neurons Hopfield network (source:
      Wikipedia.org) |<pageref|auto-2>>

      <tuple|normal| example images|<pageref|auto-4>>

      <tuple|normal|Italian alphabet|<pageref|auto-5>>

      <tuple|normal|First success of the HN implementation|<pageref|auto-7>>

      <tuple|normal|Reconstruction using the HN with 3 different image stored
      and <with|font-family|<quote|tt>|language|<quote|verbatim>|noiseThreshold>
      0.2|<pageref|auto-8>>

      <tuple|normal|Mean Error, STD and unidentified ratio of the HN varying
      the <with|font-family|<quote|tt>|language|<quote|verbatim>|noiseThreshold>|<pageref|auto-9>>

      <tuple|normal|Same analysis of figure 6 but using
      <with|mode|<quote|math>|e<rsub|s><around*|(||)>> as error
      function|<pageref|auto-10>>

      <tuple|normal|Mean error, error STD and unidentified ratio varying the
      size of the training set|<pageref|auto-11>>

      <tuple|normal|The weight matrix <with|mode|<quote|math>|W<rsup|<around*|{|N\<times\>N|}>>>
      in function of <with|mode|<quote|math>|M>|<pageref|auto-12>>

      <tuple|normal|noise intensity analysis with
      <with|mode|<quote|math>|M=4> and <with|mode|<quote|math>|5>|<pageref|auto-13>>

      <tuple|normal|The weight matrix <with|mode|<quote|math>|W<rsup|<around*|{|N\<times\>N|}>>>
      in function of <with|mode|<quote|math>|M> trained using
      <with|mode|<quote|math>|Q<rsup|<around*|{|M\<times\>M|}>>>|<pageref|auto-14>>

      <\tuple|normal>
        Error, STD and unidentified ratio evolution with the number of images
        (trained using <with|mode|<quote|math>|Q>)
      </tuple|<pageref|auto-15>>

      <tuple|normal|noise intensity analysis with
      <with|mode|<quote|math>|M=4> and <with|mode|<quote|math>|5> (trained
      using <with|mode|<quote|math>|Q>)|<pageref|auto-16>>

      <tuple|normal|noise intensity analysis with
      <with|mode|<quote|math>|M=21> (trained using
      <with|mode|<quote|math>|Q>)|<pageref|auto-17>>

      <tuple|normal|Reconstruction using the HN with 21 different image
      stored and <with|font-family|<quote|tt>|language|<quote|verbatim>|noiseThreshold>
      0.2|<pageref|auto-18>>
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Introduction
      to Hopfield Network> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Implementation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Results>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>