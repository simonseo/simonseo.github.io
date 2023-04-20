---
title: "Polarization Fields: Dynamic Light Field Display using Multi-Layer LCDs"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-04-05
toc: False
---

Let's take a look at this paper: [Polarization Fields: Dynamic Light Field Display using Multi-Layer LCDs](https://alumni.media.mit.edu/~dlanman/research/polarization-fields/polarization-fields.pdf) by Douglas Lanman, Gordon Wetzstein, Matthew Hirsch, Wolfgang Heidrich, Ramesh Raskar.

I struggled with this paper because it was hard to understand the role that polarization plays. I don't have a strong background in polarization and wrote this in a hurry and there might be factually inaccurate statements.


## Main contributions
One problem of light field LCD monitors is small range of brightness values. This is due to the nature of color filtering and multiple layers of liquid crystals. The authors eliminate need for color filtering by applying field sequential color that flickers monochrome lights on the backlight to simulate color in the human eye. They also remove all except two layers of polarizing films and thus enhancing optical efficiency by multiple folds.

This requires breaking down the displayed image as a sum of polarization rotations to the emitted light field from the backlight. The authors suggest an optimization algorithm to achieve this. 


## Reading questions
I did not acquire enough understanding of the method outlined in this paper so I can't put forward interesting ideas to extend this paper. Instead here are questions I had while reading the paper.

- how does the backlight emit a light field in the first place? 
    - If it is not parametrized and the backlight is randomly shooting rays and that counts as light field, it makes sense.
- $$\phi_k(\xi)$$, the spatially varying polarization state rotation induced at point $$\xi$$ along layer $$k$$, affects all rays passing through that point. How does that accurately rotate all light rays?
- What effect does polarization have on the light field? Does polarization attenuate some rays?
- what information does "a two-plane light field parameterization $$l(u; a)$$
is used" [Chai et al. 2000] encode? Does it encode intensity along ray $$(u, a)$$?
    - "A light field is a four-dimensional function that grabs the intensity of light rays traversing an empty space at each point."
- How is a polarization field represented as a vector? Is each element the light intensity corresponding to a specific polarization rotation state?
- How is polarization state rotation encoded as N elements? Does that mean the layer is represented as N elements of polarization states? Or is a single polarization state comprised of multiple pixels?

    > We consider a discrete parameterization for which the emitted polarization field is represented as a column vector $$\tilde{\theta}$$ with M elements, each of which corresponds to the angle of polarization for a specific light field ray. Similarly, the polarization state rotations are represented as a column vector $$\phi$$ with N elements, each of which corresponds to a specific display pixel in a given layer.

- How is a polarization rotating layer different from reular LC panels + polarizers?
    - A polarization rotating layer is an application of LCD panels:

    > A promising alternative to these modelbased refinements is to directly engineer LCD panels to act as polarization rotators. Davis et al. [2000] implement such panels using a custom parallel-aligned LCD covered by a pair of crossed quarterwave plates. Moreno et al. [2007] construct a polarization rotator using a conventional TN panel. In both works, the liquid crystal is operated as a voltage-controlled wave plate to produce polarization state rotations.

- Can this be used both as a normal 2D image display and a 4D light field display?
    - Yes. an image is just a specific instance of a light field. ie. If all rays on a pixel emit the same intensity, it's and image.




<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
