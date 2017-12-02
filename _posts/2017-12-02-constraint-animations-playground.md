---
layout: blog
title:  "Tales of a Swift future"
sub: "Constraint animations using Swift Playgrounds"
date:   2017-12-02 14:32:20
categories: swift
emphasis: "rgb(255, 52, 15)"
excerpt_separator: <!--more-->
---

Lately I’ve been working a lot on building prototypes for usability testing.
There are many types of tests you can apply and they vary a lot in the level of interaction needed to gauge how sustainable is the interaction.

<!--more-->

For the purposes of learning a better way to deliver I have tried many prototyping tools.
Among those, I've been working a lot with Framer for the past few weeks.
I have found myself mesmerised on how good it is on conveying ideas quick and easy — and dirty.
It’s really refreshing to have an interface that helps you iterate and show development quickly.

My issue with Framer is that it’s too simple sometimes and it does not scale very well.
That’s why I was very interested in the Swift Playgrounds example named “Talking to the Live View”.
It was the answer to my calls, trying interactive Swift programming without the Simulator (although the playground engine is in fact a simulator).

That idea of using the Playground for prototyping was mostly dormant until I’ve come across the new edition of Design+Code by Meng To.
It’s a really interesting series of articles that explain how to design and build an app from the ground up.
I have read the first edition and come to it for reference every once in a while.
It’s highly recommended for designers and iOS beginners.

In the third chapter there are two sections that really caught my interest: *Prototyping in Xcode* and *Animate in Playground*.
[1. If you intend on reading, I'd recommend you read the whole chapter in order for more context.]
They were the foundation I needed to leap from Framer to Playgrounds for animation prototyping.
There I saw a simple walkthrough of implementing interaction on the Live View.

This article explains what I did and what I am to do.
This is not a tutorial so don’t expect easy and well explained, nonetheless the code is here for you to download, try, thinker and break.

## Playground

[**DOWNLOAD THE PLAYGROUND HERE**](/constraint_animation.zip)

Firstly, the final product of Meng’s tutorial is an iOS Playground with a simple back and forth interaction.
It uses a subclass of `UIViewController` to setup all the elements and create all the action outlets.
My take on this is that I wanted to go a step further and deepen the scope to deal with constraint animations.

Constraints are one of the basic building blocks of UI in iOS so it’s a natural evolution on how to do adaptable interfaces and animations for the platform.
I used them in this example to help me setup the animation states.

Also, in the aforementioned example, Meng uses Swift programatically to setup views, subviews and sizes.
I'm trying to parallel this with Framer’s Design experience using the `.xib format`.
It’s like Sketch and Framer’s design mode, but the output is a file that is readable to Xcode and contains not only elements but the relationships between them.

Although playgrounds are really adaptable, the connection of the `Controller` to a given `.xib` file needs to be declared on the public scope.
In another words, there need to be a public base class declared on another Swift file under the **Sources** folder.

![XIB file outline and render](/images/cap-xib.png)

{% highlight swift %}
import UIKit

open class CardController : UIViewController {

    @IBOutlet public var cardView: UIView!

    @IBOutlet public var image: UIImageView!

    @IBOutlet public var close: UIButton!

    @IBOutlet public var cardConstraints: Array<NSLayoutConstraint>!

    @IBAction open func tapCard(_ sender: AnyObject)

    @IBAction open func tapClose(_ sender: AnyObject)
}
{% endhighlight %}

In this example, for the animation states there is a collection of constraints named `cardConstraints` that determine the card layout set to *1000* of priority amongst others that describes a fullscreen modality that is set to *999*.
The set with higher priority is activated and deactivated to create the animation so as to lower the complexity of setting back and forth countless properties.
Also the visibility of the close button and the corner radius of the card are also set programatically for they are not constraint settable.

The final product is the animation below:

![Card open animation](/images/cap_product.gif)

The idea is to try and study alternatives deliver more realistic, expressive and *maybe* useful for the final product.
In the following studies I’ll try to coordinate these advances with `Navigation Controller` and other structured to see if it’s feasible as an alternative for high fidelity interaction development.

## References

- [Design+Code](https://designcode.io)
- [Taking to the live view playground](https://developer.apple.com/library/content/samplecode/TalkingToTheLiveView/Introduction/Intro.html#//apple_ref/doc/uid/TP40017380-Intro-DontLinkElementID_2)
