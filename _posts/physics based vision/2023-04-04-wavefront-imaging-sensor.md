---
title: "WISH: wavefront imaging sensor with high resolution"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-04-03
toc: False
---

Let's take a look at this paper: [WISH: wavefront imaging sensor with high
resolution](https://www.nature.com/articles/s41377-019-0154-x) by Yicheng Wu, Manoj Kumar Sharma, and Ashok Veeraraghavan.

WISH wavefront sensing technique consists of three main components: a phase spatial light modulator (SLM), a CMOS sensor, and a processor. The incident light is modulated by the SLM, and the resulting intensity measurements are captured by the CMOS sensor. A computational phase-retrieval algorithm is then used to estimate the complex optical field incident on the SLM. This allows for the numerical reconstruction of the test object's complex field. Three examples of experimental applications outlined in the paper are Fresnel lens imaging, imaging through scattering media, lensless microscopy.

The strength of this approach is that in contrast to traditional imaging sensors that measure only the intensity, WISH measures the phase as well.

![WISH sensor for imaging through scattering media](../assets/images/wish%20sensor%20scattering.png)

## Shortcomings
Though the ideas and findings forwarded by the paper is remarkable, there are two limitations to this method. The first is in their application. Their approach for reconstructing an image beyond a scattering media requires a calibration step involving imaging a calibration target in order to understand the diffusion. This is often not possible in most applications that deal with scattering media. The occluding medium would have to be circumnavigable at a point before actually imaging in order to place a known calibration target. In addition to this, the scattering medium should not change for this system to operate. 

The second shortcoming is related to the first point: the imaging target and the sensor should be rather static due to the use of an iterative algorithm. This is in contradiction with the authors' general claim that WISH is robust against vibrations -- in fact, it is possibly more robust compared to previous methods but still limited in the range of micrometers. This renders it unusable at a macroscopic scale.

## Ideas
The idea that the authors applied to Fresnel Lens imaging at a telescopic scale could seemingly be generalized to all kinds of prime (fixed focal length) lenses but with multiple lens elements in order to boost image quality. Camera lenses with multiple lens elements still suffer from optical blur and aberration due to imperfect manufacturing or imperfect maintenance. For instance, chromatic aberration due to lens geometry, fungal growth inside the lens system, and fogging due to rapid temperature or humidity change in the environment are all examples of hindrance that still affect modern camera systems. Using the same calibration step, a digital camera could easily calibrate for the imperfection, and even save the calibration profile for reuse.


## Unanswered questions
![Sensor diagram](../assets/images/wish%20sensor%20diagram.png)
- what is their justification for suggesting that their system is robust against vibrations?
- what does it mean for a phase to be quadratic? eg. "A focusing lens, which is modeled as quadratic phase distribution Φlens, collects diffused light to WISH."
- What does the "averaging" step after backpropagation involve? 
- Does the sensor send the processed wavefront back to the SLM?


## Background information
This section was written with the help of ChatGPT.

### Wavefront Sensing
Wavefront sensing is a technique used to measure both the amplitude and phase of an incoming optical field. This is in contrast with the traditional imaging sensors used in conventional imaging systems, which only capture the amplitude information and ignore the phase information.

### Optical Field
An optical field refers to the distribution of light waves in space. It is a physical quantity that describes the electromagnetic field of light, which consists of oscillating electric and magnetic fields that propagate through space. The optical field can be characterized by its amplitude and phase, which determine the intensity and polarization of the light, respectively. 

Optical field can be mathematically described as a complex-valued function that varies in both space and time. Let's denote this function as E(x,y,z,t), where x, y, and z are the three spatial coordinates and t is time.

At any point in space and time, E(x,y,z,t) represents the amplitude and phase of the electromagnetic wave that makes up the optical field. The amplitude of E(x,y,z,t) represents the strength or intensity of the electromagnetic wave, while the phase of E(x,y,z,t) represents the position of the wave relative to a reference point.

Since E(x,y,z,t) is a complex-valued function, it can be expressed in terms of its real and imaginary parts as:

<div>$$E(x,y,z,t) = A(x,y,z,t) + iB(x,y,z,t)$$</div>

where A(x,y,z,t) and B(x,y,z,t) are the real-valued functions that represent the amplitude and phase of the wave, respectively.

Overall, the complex-valued function E(x,y,z,t) provides a complete description of the optical field, including both the amplitude and phase information.

### Spatial Light Modulators (SLM)
Spatial Light Modulators (SLMs) are advanced optical devices that can dynamically manipulate the amplitude and phase of light at a pixel level. SLMs are composed of an array of small pixels that can be individually addressed and controlled using electrical signals. By applying different voltages to these pixels, the phase and/or amplitude of light can be modified. SLMs can be used to introduce a known phase modulation to an incoming optical field, which can then be analyzed to retrieve the original wavefront.


<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
