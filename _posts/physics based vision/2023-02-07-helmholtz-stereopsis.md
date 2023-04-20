---
title: "Helmholtz Stereopsis"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-02-07
toc: False
---

Let's talk about Zickler et al.'s paper "Helmholtz Stereopsis: Exploiting Reciprocity for Surface Reconstruction". The name 'Helmholtz Stereopsis' comes from the fact that this method exploits Helmholtz reciprocity. It's a physical property of most material that says that swapping the location of lighting and camera will not change the brightness of a point on the material.

### This method is great.
Jumping to conclusions: Helmholtz stereopsis does better than two pre-existing general stereopsis techniques (photometric and conventional multinocular) in almost every possible way. The most useful of its premises is that it assumes nothing about the BRDF (Bidirectional Reflectance Distribution Function) so it can be used on a wide range of objects. The most useful of its abilities is that it can retrieve depth *and* surface normals at the same time. 
Why is it important that we can get depth and surface normals? Because calculating one from the other often leads to error and/or may need fancy math to do it properly. 

### Idea
A limitation of this method is that it cannot usually be used on larger objects or fixed objects outdoors that cannot be put under controlled lighting settings. However, there is one light source outdoors that constantly changes -- the Sun. We know the precise location of the Sun at a given time and we could also program a drone to capture images from a precise location and angle. Using Helmholtz Stereopsis could work in our favour when we're modelling a large landscape - maybe a mountain or a building. Urban landscape modelling could be useful for mobile map services to provide rough 3D shapes of buildings (especially complex ones like Gates-Hillman Center). Within a short time frame, we can assume the direction of light from the Sun is constant and parallel. Then an aerial drone can fix its camera angle and capture multiple shots from different positions. (Does distance of the camera from the scene matter here under perspective projection?)
