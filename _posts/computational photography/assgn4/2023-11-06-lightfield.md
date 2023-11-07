---
title: "Lightfield and refocusing algorithms"
layout: post
author: "Simon Seo"
categories: assignment
# permalink: assignment0
date: 2023-11-06
# toc: true
style: geoviz-proj1
---

<!-- View this page on [my blog]({{ site.base_url }}/lightfield) for moving GIFs. -->
View this page on [my blog](https://simonseo.blog/lightfield) for moving GIFs.

##1. Plenoptic image
The plenoptic image is restructured as a matrix of size $$(U, V, S, T, C) = (16, 16, 700, 400, 3)$$.
- $$U, V$$ are the coordinates on the aperture or coordinates of the pinhole, viewpoint, or the origin of a light ray.
- $$S, T$$ are the the coordinates on the lenslet array or the coordinates of the coordinates of the world object for a fixed pinhole, or the endpoint of a light ray. 

### Sub-aperture views
This data has 16x16 "viewpoints" or sub-apertures. Each viewpoint is depicted here, in a grid of 16x16 images.

![Alt text](data/sub_aperture.png){:width="1000px"}

### Refocusing / Focal stack simulation

<!-- \[ \int_{a}^{b} x^2 \,dx \] -->
$$\iint_{(u,v) \in A} L(u, v, s, t, c) \text{d}v \text{d}u$$
![Alt text](data/focal_stack.gif)

### Depth from focus
Using $$\sigma_1=1, \sigma_2=4$$, we recover the following depth image and all-in-focus image.
![Alt text](data/depth_map_sigma1=1_sigma2=4.png)
![Alt text](data/all_in_focus_sigma1=0.5_sigma2=0.5.png)

### Focus-Aperture stack

The aperture size varies horizontally and focal distance varies vertically along the grid in the following image.
![Alt text](data/stacked.png)

### Aperture-focus images
<figure>
    <img src="data/x=60_y=240.png" />
    <img src="data/x=90_y=360.png" />
    <img src="data/x=150_y=120.png" />
    <img src="data/x=200_y=125.png" />
    <figcaption>
Aperture-focus image at the following pixel locations. From left: <br>
x=60, y=240 <br>
x=90, y=360 <br>
x=150, y=120 <br>
x=200, y=125 <br>
Horizontal axis represents aperture size and vertical axis represents change in depth.or focus
    </figcaption>
</figure>

### Depth from Focus-Aperture stack
![Alt text](data/depth_confocal.png)


##1. Unstructured lightfield

### Capturing unstructured lightfield
![Alt text](data/20231106_171015.gif)
<figure>
<img src='data/1.gif' width="300"/> 
<img src='data/3.gif' width="300"/> 
<img src='data/5.gif' width="300"/>
    <figcaption>
        Data used for unstructured lightfield. <br>
        Top: the full-length GIF shows how the camera was moved.<br>
        Bottom: three cuts from different heights.
    </figcaption>
</figure>

### Calculating shifts

<figure>
<img src="data/image.png" />
<img src="data/image-1.png" />
<img src="data/image-2.png" />
<img alt="" src="data/listerine_shifts.png" />
<img alt="" src="data/listerine_refocused.png" />
<figcaption>
Top Left: template patch<br>
Top Center: frame taken from bottom right camera position <br> 
Top Right: frame taken from top left camera position <br>
The red box refers to the search window. <br>
Bottome Left: A plot of all points where the template patch was found.<br>
Bottom Right: A refocused image on the template<br>
</figcaption>
</figure>

1. I employ a coarse-to-fine search to save computation. I slide the template by `step_size` across the search window and find the position where NCC is highest.

1. When such initial position is found, I search within a smaller search window within `step_size` distance from the initial position by sliding the template by a single pixel at a time.

1. To calculate NCC (Normalized Cross Correlation), 
- center both template and image patch at zero mean.
- apply box filter on image patch
- divide by l2 norm
- take sum of correlation `scipy.signal.correlate2d`

1. The position found in step 2 offset by shifting the same amount in the negative direction, in order to align all the frames on the same patch.

1. Average all aligned frames and crop to attain the refocused image.



<figure>
<img src="data/protein_shifts.png" />
<img src="data/protein_refocused.png" />
<br>
<img src="data/bike_shifts.png" />
<img src="data/bike_refocused.png" />
    <figcaption>
    Top: refocused on "protein" box <br>
    Bottom: refocused on door
    </figcaption>
</figure>

<!-- MathJax library for rendering LaTeX -->
<!-- example usage: $$$\tilde{\theta}$$$  -->
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
