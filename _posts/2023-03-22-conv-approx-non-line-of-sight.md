---
title: "Convolutional Approximjations to the General Non-Line-of-Sight Imaging Operator"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-03-22
toc: False
---


<div style="text-align:center"><iframe width="560" height="315" src="https://www.youtube.com/embed/eMLzToMqleU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></div>


## Main contributions of this work
This paper achieves computational advancements in non-line-of-sight (NLOS) imaging in two ways: first by changing the solution to an efficient deconvolution algorithm, and secondly by applying iterative methods with priors. It also provides theoretical justification for a technique that researchers have been using only with an intuitive understanding. All of this is possible by approximating the measurement-backprojection pipeline of albedo as a convolution. $$ \newcommand{\vect}[1]{\boldsymbol{#1}}$$ $$\text{argmin}_{\vect{\rho}} \Vert \vect{i}- \vect{A \rho} \Vert$$ would give us the the original albedo $$\vect{\rho}$$ but this method is difficult to use due to the sheer size of the measurement matrix $$\vect{A}$$ making it take very long to scan and computationally intractable. However, modelling the 

## Extensions of the idea
This theory could be easily applied to highways to model traffic around a vehicle without having direct sight to avoid possible collisions. This technology would also be helpful at an intersection, drivers in smaller cars often cannot see traffic lights or other traffic information if there is a large truck in front. Since the Gram is a convolution operator, can we use it to design optical convolutional filters?







<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
