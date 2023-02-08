---
title: "Helmholtz Stereopsis"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-02-07
---

Let's talk about Zickler et al.'s paper "Helmholtz Stereopsis: Exploiting Reciprocity for Surface Reconstruction". 

The name 'Helmholtz Stereopsis' comes from the fact that this method exploits Helmholtz reciprocity. It's a physical property of most material that says that swapping the location of lighting and camera will not change the brightness of a point on the material.

Jumping to conclusions: Helmholtz stereopsis does better than two pre-existing general stereopsis techniques (photometric and conventional multinocular) in every possible way. The most useful of its supremacies are that it assumes nothing about the BRDF (Bidirectional Reflectance Distribution Function) and that it can retrieve depth *and*  surface normals at the same time.

Why is it important that we can get depth and surface normals: because calculating one from the other often leads to error and/or may need fancy math to do it properly. How does it get both at the same time? 

## How does it get both depth and surface normals?

Wait, here's the catch: it still can't recover depth if the surface has a constant albedo. 