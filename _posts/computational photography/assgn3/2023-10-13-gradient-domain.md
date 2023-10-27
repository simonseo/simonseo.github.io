---
title: "Gradient-domain processing"
layout: post
author: "Simon Seo"
categories: assignment
# permalink: assignment0
date: 2023-10-13
# toc: true
style: hdr-imaging
---
## Differentiate and re-integration of image
![Alt text](data/2-00-image-reconstruction.png)

<!-- ## Conjugate Gradient Method -->

## Fused gradient field
I found $$\sigma=35, \tau_s=0.85$$ to give desirable results.

### Gradient field $$\nabla \alpha$$
![Alt text](data/2-01-grad-alpha.png)
### Gradient field $$\nabla \phi^\prime$$
![Alt text](data/2-02-grad-phi-prime.png)
### Gradient field $$\nabla \phi^\star$$
![Alt text](data/2-03-grad-phi-star.png)
### Weights
![Alt text](data/2-04-weights.png)




### Final fused image
Different initializations did not effect the outcome image that much, but the boundary conditions do. I found the average of the ambient and flash image to give best results.
![Alt text](data/2-05-fused.png)

## Gradient domain fusion on my own images


![Alt text](data/2-06-christmas-tree.png)


<!-- MathJax library for rendering LaTeX -->
<!-- example usage: $$$\tilde{\theta}$$$  -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
