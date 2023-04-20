---
title: "Fourier Slice Photography"
layout: post
author: "Simon Seo"
categories: opinion
date: 2023-02-27
toc: False
---

Let's talk about Ren Ng's paper "Fourier Slice Photography". 

### This method is great.
This paper combines two ideas. It takes the Fourier Slice Theorem, which is a theorem that states that a projection of a curve can be done in the Fourier domain, and applies it to the 4D light field. In this case, the 2D slice of the 4D light field is a "refocused" image of our choosing. Mindblowing.

![Fourier Slice Theorem]({{ site.baseurl }}/assets/images/Fourier_Slice_Theorem.png)

The author Ren Ng takes this idea and develops it into two iterations of Lytro's light field cameras. The company has halted execution in 2018 and I was devastated to find out about it.
![Lytro camera]({{ site.baseurl }}/assets/images/lytro.jpeg)

### Some problems
Let's hear that again. Ren Ng took this idea and developed it into a product. A hardware product. While there were probably other innovations that came along with the Lytro light field cameras, it seems that the lenticular array was a big part of it. That means that this idea can't be easily applied to existing cameras. It requires a dedicated camera hardware and an assumably a complex manufacturing process. From the point of view of consumers, however, this results in a lower lateral resolution and a huge price tag, all for one function.

### Questions and Exploration

- Is there a limit to the distance that re-focusing can work? I wonder what could go wrong if there is an occluding object right in front of the lens.
- Is this method also faster for computer generated objects? Is it faster to completely re-render using information of the 3D objects, or would it be faster to save the 4D light field and refocus from that? 
- can we apply this on a moving scene? (either in real life or in a generated environment) It seems probable. This would be very useful in film production since I have experienced multiple close up shots thrown away or be used with unsatisfactory results.
- If we were to apply it to a moving image, can we still do it while previewing the effect of changing focus in real time? This also seems doable. Although it would definitely take more processing time than getting images from the camera sensor directly.