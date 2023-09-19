---
title: "RAW Development"
layout: post
author: "Simon Seo"
categories: assignment
# permalink: assignment0
date: 2023-09-15
toc: true
style: pinhole-cameras
---

<!-- excerpt_separator -->

## Developing RAW images 		

###1. RAW conversion


```
<black> 150
<white> 4095
<r scale> 2.394531 
<g scale> 1.000000 
<b scale> 1.59765
```

###1. Python initials

```
16 unsigned int bits 
Width 6016
Height 4016
```

###1. Linearization 


###1. Identifying the correct Bayer pattern

Identify green pixels by looking for two closely aligned diagonals over the entire image. Compare the correlation between main diagonal pairs and anti diagonal pairs of pixels. The green pixels should correspond to the pair with a higher correlation.
Rely on prior knowledge about the world. The top left corner shows tree leaves, which are mostly green. A patch of the sky in the top right area should have a higher blue component. Carnegie Mellon University wordmark will have a stronger red component. 
In the overall image, anti-diagonal pixel pairs have a correlation of r^2 = 0.988 while the main diagonal has value 0.868. Thus the anti-diagonal is green. Looking at the patch of sky and the patch of CMU logo, it is clear that the top left has greater value in the CMU patch than in the sky patch, whereas the bottom right has greater value in the sky patch. Thus I identified the pattern to be RGGB. 

###1. White balancing	

“Custom” white balance. Both the white world and grey world white balance algorithms produce an image with a green tint of varying degrees. (Although I’m red-green colorblind so I can’t be 100% sure.)


See files `1.1/custom-wb.png`, `1.1/grey_world-wb.png`, `1.1/white_world-wb.png`


###1. 	Demosaicing 


			
###1. Brightness adjustment and gamma encoding 


From my experiments, I found the following brightness settings to produce ideal images. 

| Post-brightening    | mean    | percentage increase    |
|---------------- | --------------- | ------------ |
| White world    | 0.015    | 792% |
| Grey world    | 0.125    | 207% |
| Custom   | 0.125   | 69% |


  	 
 					
 					
					

###1. Compression


By changing the JPEG quality settings, determine the lowest setting for which the compressed image is indistinguishable from the original. What is the compression ratio? 

I couldn’t tell the difference between the PNG image and JPG image with quality=95. Even at zoom = 100%, I don’t 
see any difference with my bare eyes.


When zoomed out to full screen on a computer monitor, I cannot distinguish the PNG image vs any JPG images with quality higher than 50.

```
PNG: 44.9MB 
JPG (q=45): 2.1MB
Compression ratio: 5.13%
```


See files `1.1/custom-wb.png` and `1.1/custom-q50.jpg`


## Perform manual white balancing  		 	 	 				
I chose three patches: the cloud, a metallic electricity box, concrete structure. The result looks best with white balancing from the area of concrete. The patch from the cloud is indeed very bright but the white balance algorithm compensates the blue color of the sky seeping through making the image yellowish. The metallic box also gives good results but the shadows are too blue. 


See `1.2/patch-cloud.png`, `1.2/patch-concrete.png`, `1.2/patch-metal.png`

					
## Learn to use dcraw 
Dcraw command:

dcraw 
-a		# Average the whole image for white balance
-b 1.69	# Adjust brightness
-g 2.4 12.92 # Set custom gamma curve
-o 1		# sRGB color space
-q 0 	# bilinear interpolation
data/campus.nef
I prefer the custom white balanced image the best, because the dynamic range covers both the dark and white areas which contributes hugely to the overall visual quality. However, when zoomed in, I can 
see that dcraw’s demosaicing algorithm performs better. The white-world and grey-world images show a 
slight green tint globally.
