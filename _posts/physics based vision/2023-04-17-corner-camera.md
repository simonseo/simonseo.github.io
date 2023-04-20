---
title: "Turning Corners into Cameras: Principles and Methods"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-04-17
toc: False
---

Let's take a look at this paper: [Turning Corners into Cameras: Principles and Methods (ICCV 2017)](https://openaccess.thecvf.com/content_ICCV_2017/papers/Bouman_Turning_Corners_Into_ICCV_2017_paper.pdf) by Katherine L. Bouman, Vickie Ye, Adam B. Yedidia, Fredo Durand, Gregory W. Wornell, Antonio Torralba, and William T. Freeman.

A recurring theme characteristic of imaging systems is their decision (not) to use a controlled light source. Some imaging systems require a completely dark room with only one source of known or coded lighting, whereas some make use of natural lighting. The drawback of systems that use natural lighting is that they are often less accurate. In the middle are systems that use coherent light such that it is robust even in natural settings, like the paper that uses speckle-based technique for seeing around corners: ([Non-invasive real-time imaging through scattering layers and around corners via speckle correlations](https://arxiv.org/pdf/1403.3316.pdf)).


## Limitations
In contrast to the above mentioned paper, this approach does not require a light source. While 
we can only make comparisons in the same scene: ie. two pixels in two separately reconstructed 1D videos are largely independent from each other. The pixel position does not give us much information and pixel value also shifts a lot depending on the scene. Often there's not enough data in the reconstructed video to decide what kind of a condition or scene it is. So unless we have a controlled indoors setting, this approach does not seem very useful. The lack of a controlled light source seems to be of no avail aside from being cost effective.

## Ideas 
While I said there is no strict correlation between two pixels across two separate reconstructed videos, we are still able to say approximately which angle or location an object is. This may be useful on the road in two cases. We humans use information of headlight reflected off the ground to tell whether there is a car or not around the corner. So while we cannot be completely certain of the location of small objects, it can be useful for locating cars around corners, especially at night. In another instance, the movement of the pixel tells us something. So if we calculate the optical flow of certain pixels we could acquire some information about surrounding objects whose images are reflected of a car. However, even in that case, there would be an ambiguity among the three values position-speed-distance.



<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
