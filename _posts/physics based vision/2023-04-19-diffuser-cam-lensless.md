---
title: "DiffuserCam: lensless single-exposure 3D imaging"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-04-19
toc: False
---

Let's take a look at this paper: [DiffuserCam: lensless single-exposure 3D imaging (Optica 2018)](https://opg.optica.org/optica/fulltext.cfm?uri=optica-5-1-1&id=380297).
The term 'lensless' is perhaps a bit misleading. Instead of a transparent lens, the authors put a rough diffuser in front of the camera sensor, allowing the diffuser to diversify the direction of the light rays and  and acts almost like a light field camera.

## Limitations
The authors suggest that this method is one step closer to applications such as "remote diagnoistics, mobile photography, and *in vivo* microscopy," especially compared to similar lensless cameras that use coherent controlled light sources. However, this method is still quite limited for such uses. Firstly the calibration process still involves a precise process that must be done with a point light source for each sensor-diffuser pair due to the pseudo-random nature of the diffuser. This means that there would be factory configuration or a special device that users cannot disrupt. This greatly limits usage for remote diagnostics.

Another limitation is that the sensor has to be much larger than the otical element and requires a large amount of space between the optical element and the sensor. This render the imaging system bulky and would not be suitabel for recent trends in mobile photography.


## Ideas 
Some ideas to improve this method are as follows. If the diffuser could be 'programmed' to have consistent caustics across devices and also be manufactured with a rigid material, the calibration process could be skipped as well as allowing the system to be used in diverse settings. On the other hand, the current approach of using an off-the-shelf diffuser sheet would be useful for medical uses if hygiene is of prime concern and contaminated surfaces must be replaced. An idea to mitigate the problem of the requirement of space between the optical element and the sensor is to use a periscope to 'fold' the light ray's path, although it is unclear if the effect would be preserved.

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
