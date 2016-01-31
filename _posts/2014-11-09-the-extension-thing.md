---
layout: blog
title:  "Tales of a Swift future"
sub: "The extension thing"
date:   2014-11-09 14:32:20
tags: Swift, code
category: swift
---

Today I was working on Swift as I’ve done for the late our of next week and while doing the all the examples in the Apple given documentation I encountered something boggling.

Every time I test a new language I like to stress as much as I can the syntax so I can learn the limits and suggestions of abstraction. While doing the card enumeration example I encountered many corners to which the abstraction could be meddled with and here follows.

First thing you encounter is the enumerations type which by the time I got was not up for discussion: ranks are naturally enumerations in spite of the various permutations amongst card games. The simplest way to do it was as is written in the book:

{% highlight swift %}
enum Rank: Int {
	case Ace = 1
	case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
	case Jack, Queen, King
	func simpleDescription() -> String {
		switch self {
		case .Ace:
			return "ace"
		case .Jack:
			return "jack"
		case .Queen:
			return "queen"
		case .King:
			return "king"
		default:
			return String(self.toRaw())
		}
	}
}
{% endhighlight %}

A very simple structure although I might add that the only method is a mere example, if you were to do a real life thing it would natural to erase it. No functionality, no methods.

Well. It was only logical to treat the suits symmetrically:

{% highlight swift %}
enum Suit: Int {
	case Clubs = 1
	case Hearts, Spades, Diamonds
	func simpleDescription () -> String {
		switch self {
		case .Clubs:
			return "clubs"
		case .Hearts:
			return "hearts"
		case .Spades:
			return "spades"
		case .Diamonds:
			return "diamonds"
		}
	}
	func color () -> String {
		switch self {
		case .Spades, .Clubs:
			return "black";
		case .Hearts, .Diamonds:
			return "red";
		}
	}
}
{% endhighlight %}

As I thought was natural to a bare integer value, I overloaded various operands so as to simplify the abstraction:

{% highlight swift %}
@infix func + (left: Rank, right: Int) -> Rank? {
	return Rank.fromRaw(left.toRaw() + right)
}
@infix func - (left: Rank, right: Int) -> Rank? {
	return Rank.fromRaw(left.toRaw() - right)
}
@postfix @assignment func ++ (inout value: Rank) -> Rank? {
	if let result = value + 1 {
		value = result
		return result
	}
	return nil
}
@postfix @assignment func -- (inout value: Rank) -> Rank? {
	if let result = value - 1 {
		value = result
		return result
	}
	return nil
}
@infix func == (left: Rank, right: Rank) -> Bool {
	return left.toRaw() == right.toRaw()
}
@infix func > (left: Rank, right: Rank) -> Bool {
    return left.toRaw() > right.toRaw()
}
@infix func < (left: Rank, right: Rank) -> Bool {
    return left.toRaw() < right.toRaw()
}
@infix func >= (left: Rank, right: Rank) -> Bool {
    return left.toRaw() >= right.toRaw()
}
@infix func <= (left: Rank, right: Rank) -> Bool {
    return left <= right
}
{% endhighlight %}

This was just as the tutorial asked and using all the code that was already available on the book. And till this line of code nothing really special has happened. Until I was faced with the card and deck problem.

The thing is that a card is the single concatenation of suit and rank and as such must be a class… Wrong. My fist mistake in treating Swift as C++. The abstraction of a class refers to a data being with lifespan, it follows a flow and dies out, therefore it should not be copied. To be precise, as far as I am concerned it is so highly unadvisable that although the building types are transversal between instances their parity has to be done by hand.

So there goes another try using another segmentation of the object type — all the advisable types in Swift are objects of classes:

{% highlight swift %}
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription()) is \(suit.color())."
    }
    init (rank: Rank, suit: Suit) {
        self.rank = rank
        self.suit = suit
    }
    init () {
        self.rank = Rank.Ace
        self.suit = Suit.Clubs
    }
    func createDeck() -> [Card] {…}
}
{% endhighlight %}

And yes, I coded the suggestion in the handbook about creating a deck and to be fair: always do the suggestions, they are fun and hard. At the time it seemed natural to ask for a card to call its friends and build a deck.

{% highlight swift %}
func createDeck() -> [Card] {
    var newCard = self
    if newCard++ {
        return [self] + newCard.createDeck()
    }
    return [self]
}
{% endhighlight %}

I really was happy with this piece of code. I love when I get a bit recursive after 11PM. Until I had to actually call it. Ugh.

{% highlight swift %}
var myDeck = Card().createDeck()
{% endhighlight %}

Really? I would let any given user of this library — I know nobody is ever gonna use that — call as much as they wanted this method? NO (I really have a thingy for memory usage awareness).

It really stung a bit to let go of the recursive thing but it seemed only fair. Iteration it will be:

{% highlight swift %}
class Deck {
    var cards = [Card]()
    init () {
        var card = Card()
        do {
            cards += card
        } while card++
    }
}

var myDeck = Deck()
for card in myDeck.cards {
    println(card.simpleDescription())
}
{% endhighlight %}

Have you seen those last few lines? A card is a property of the deck and not a value inside a property — just to be clear, I never do that when I am actually building something… now a days.

I then remembered the abstraction of extensions. Extending a class of any sort is giving new methods and values to its existing declaration propagating new functionality to instances. Sounds great, hum?!

So I decided to extend the array of Card elements:

{% highlight swift %}
extension [Card] {
    init () {
        var card = Card()
        do {
            self += card
        } while card++
    }
}
{% endhighlight %}

These were the 8 lines with which I fell in love with. Until this:

	! Non-nominal type [Card] cannot be extended
