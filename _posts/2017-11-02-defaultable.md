---
layout: blog
title:  "Tales of a Swift future"
sub: "Defaultable, a protocol-oriented take on UserDefaults"
date:   2017-11-02 14:32:20
categories: swift
emphasis: "rgb(255, 52, 15)"
excerpt_separator: <!--more-->
---

It’s been a while I came across a post by Andyy Hope (read the references, please) that had a very interesting take on `UserDefaults` on Swift.
I was really intriged by the way he used protocols, associtated types and enums to get create a better API for `UserDefaults`.
Specially because he focused, not solely but mostly, on a use-case and on simplifying application by wrapping the interface on a legible interface.

<!--more-->

I'd like to try my own take on this that comes more from a standpoint of generic implementation and syntatic sweetening.
Maybe use some references on the language to draw a seamless interface.
Indeed I never really use `UserDefaults` and my interest is close to experimental but I thought I could propose a different way to think about it.
My thought process came from dealing with `UnsafeMutablePointer` interfaces and `Optional`.

Optionals are the pointer abstraction of Swift.
They are a way to enforce that the language user always accounts for having a nil pointer when dealing with objects and values.
This makes it easier to avoid simple mistakes from the programmer and helps the compiler get the most certainty out of the code to make better optimisation.

Like `Sequence` and `Collection`, `Optional` is a generic implementation raised to be a first-class language feature, in their case, a generic of enumerations.

{% highlight swift %}
enum Optional {
case some<T>
case none
}
{% endhighlight %}

Inspired by it and by collections I wanted to make an similar interface for UserDefaults that could leverage Generics like this:

{% highlight swift %}
var numberOfTimes = Default<Int>(key: "SomeKey")

if numberOfTimes != nil {
numberOfTimes = numberOfTimesValue + 1
} else {
numberOfTimes = 1
}

print(numberOfTimes) // Default(1)
{% endhighlight %}

It may not have the mnemonics of the aforementioned article but it sure does not obfuscate the use of UserDefaults.
Indeed it declared the use of it in a manner that is not obtrusive to legibility.

There came the interest to dabble a little with these implementations to see what features would fit a nice way to wrap UserDefaults.
It’s when I stumbled on Custom Collections.
 Custom Collections are a very flexible way to create interfaces between a custom data structure and the language syntax features.
It contains optional methods for subscripting, concatenating, mapping and so forth.
I don’t have much understanding of the `Sequence` and `Collection` protocols but it’s my understanding that `Array`, `Set` and `Dictionary` are, indeed, structs with associated types that conform, in their own manner, to the mentioned protocols.

So and idea of this came to form:

{% highlight swift %}
public struct Default<Element : Defaultable> {

var key : String
var value : Element? {
didSet {
UserDefaults.standard.set(value, forKey: key)
}
}

init (key : String) {
self.key = key
self.value = UserDefaults.standard.value(forKey: key) as? Element
}
}
{% endhighlight %}

It may not be the best implementation but it fits the bill really nicely.
Still it does not have the power and flexibility of `Optional`, specially because the overloading of the `Assign` operator is not allowed by Swift — for important reason.

I intend to try using this implementation on the cases that come across.
It’s a pretty weak implementation since it needs explicit protocol conformance to work.

{% highlight swift %}
public protocol Defaultable {}

extension Int : Defaultable {}
extension Double : Defaultable {}
extension Bool : Defaultable {}
extension String : Defaultable {}
{% endhighlight %}

A more powerful version of the `Defaultable` protocol it would need to be as expressive as `Codable` in the sense that it has to offer means for decoding and encoding data structures, sequences and so forth.
Maybe it would be a nice idea to try to combine those two.

In another note, since `UserDefaults` is also a Property List abstraction, declaring a `Collection` with the methods and behaviour of `Dictionary` is not only feasible but interesting interface implementation.

What was written above goes to show the symbolic power of Swift and it’s limitations.
It’s a language that has the fundamentals that help the curious mind in trying different ways of solving problems.
And, in my opinion, code is about being simple and expressive.

## References

- [Swift: UserDefaults Protocol by Andyy Hope](https://medium.com/swift-programming/swift-userdefaults-protocol-4cae08abbf9)
