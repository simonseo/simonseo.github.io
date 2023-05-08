---
title: "NeRF in the Dark: High Dynamic Range View Synthesis from Noisy Raw Images"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-04-26
toc: False
---

Let's take a look at this paper: *"NeRF in the Dark: High Dynamic Range View Synthesis from Noisy Raw Images" from Google Research. It appears that some of the original authors of the NeRF paper were involved in this work as well. This paper describes a very simple, yet surprising idea: a NeRF resulting from RAW images with a lot of noise is better than a NeRF resulting from denoised versions of the RAW images. The authors explain that this is due to the zero-mean distribution of noise in RAW images. While the idea is simple and intuitive, it is surprising to me because I am used to processing a stack of RAW images taken from the same position and angle - either to reduce noise, capture a long exposure image, or remove temporary objects in the scene. However, each sensor has a consistent pattern of noise inherent to it due to the limitations of contemporary circuits, and many methods have focused on understanding this pattern of noise to remove it precisely. Therefore, it was not the case that RAW noise disappears with more images. I wonder whether this same idea has been explored with other scene reconstruction methods.

This is not without limitations, however. Under strong noise, PSNR of the RawNeRF output still remains high and provides a good dynamic range. On the other hand, we can observe that structure in the image stays sharp but becomes "brittle" compared to LDR NeRF whose structure become less pronounced but does not corrupt the structure. A combination of the two could produce a better outcome.




<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
