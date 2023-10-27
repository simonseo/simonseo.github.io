---
title: "Bilateral filter and gradient domain image processing"
layout: post
author: "Simon Seo"
categories: assignment
# permalink: assignment0
date: 2023-10-01
# toc: true
style: hdr-imaging
---
![Alt text](data/1-00-input.png)
## Bilateral Filter
spatial: 4, intensity: 0.15
![Alt text](data/1-00-bilateral_s4_i0.15.png)
- Advantage: works with a single photo
- Disadvantage: to reduce noise, must sacrifice detail in other regions too

<!-- Here is a simple footnote[^1]. With some additional text after it. -->

<!-- [^1]: My reference. -->

<!-- ## How gaussian filter can be sped up using FFT -->

<!-- ## How bilateral filter can be sped up using bilateral grid -->

## Joint Bilateral Filter
spatial: 3, intensity: 0.1
![Alt text](data/1-01-jointbilateral_s3_i0.1.png)

- Advantage: Can use the less noisy area of the flash image as guidance.
- Disadvantage: Must take two images very well aligned.

## Detail transfer
Settings for F_base:
spatial: 4, intensity: 0.15
![Alt text](data/1-02-detail.png)
- Advantage: The detail that was lost in joint bilateral filter has come back.
- Disadvantage: requires running the bilateral filter three times.

## Shadow and specularity masking
tau_shadow: 0.1, tau_specular: 0.85
![Alt text](data/1-04-final_shadow0.1_specular0.85.png)
- Advantage: finetunes which source to use for each area of the image. 
- Disadvantage: Not a noticeably big difference if specularities don't exist a lot.

## Bilateral filtering on my own image
![Alt text](data/original.png)
![Alt text](data/final_s10_i0.05.png)



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
