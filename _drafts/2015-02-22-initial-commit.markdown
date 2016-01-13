---
layout: post
title:  "Ambience, initial commit"
date:   2015-02-22 14:32:20
tags: interface, reponsividade, luz, Swift, Cocoa, código
category: ambience
---

Este capítulo se mesclas bastante com o *Tales of a Swift Future* pois o *Ambience* é um Cocoa Framework feito em Swift.

Depois de muito averiguar a arquitetura mais interessante para resolver o problema de [observar e enviar mensagens às classes](http://nshipster.com/nsnotification-and-nsnotificationcenter/) eu resolvi usar uma mistura de *Protocol Delegation*, *Funcional Enumeration* e *Extension*.
A idéia era fazer com que a implementação do Framework fosse o mais próximo de opaca e simples.

Começando com o básico eu achei que a melhor forma de fazer um serviço de *Broadcasting* que contém implementações e informações extras fosse o *Protocol Delegation*.
Primeiramente pois mensagens passadas na central de notificação não podem ser interceptadas, não são direcioinais e têm sintaxe não muito clara.
Como todo o programador *Cocoa* está familiar com *Delegation* o *framework* fica acessível.

A segunda parte foi escolher *Enumeration* para definir os estados.
É óbvio que uma boa técnica de programação te obriga a definir estados numa enumeração no entanto pretendo procurar formas cada vez mais próximas da funcional de imputar código nessas estruturas explorando sua complexidade no *Swift*.

{% highlight swift %}
public enum AmbienceState {
	case Invert, Regular, Contrast
}
{% endhighlight %}

Mas o pulo do gato sempre foi *Extension*.
É lindo a sintaxe de adicionar endereços de funções às tabelas de símbolos de uma classe escrevendo **extension**.
Essa foi a parte mais importante do sistema pois é horrível a tarefa de obrigar um usuário a fazer instâncias, configurar e ainda ter que fazer chamadas de teste.
Dentro da função que controlo posso fazer todo trabalho de uma forma padronizada e segura.

{% highlight swift %}
public extension UIViewController {
	final func notifyAmbience () { ... }

	final func stopAmbience () { ... }

	func ambience (didChangeFrom lastState : AmbienceState?, to currentState : AmbienceState) {}
}
{% endhighlight %}

>Extensions: Liberdade é superestimada.

Então o que resta ao usuário é isto:

{% highlight swift %}
class SomeViewController: UISomeViewController {
	override func viewDidLoad() {
		func notifyAmbience ()
	}
	override func didReceiveMemoryWarning() {
		func stopAmbience ()
	}

	override func ambience (didChangeFrom lastState : AmbienceState?, to currentState : AmbienceState)  {}
}
{% endhighlight %}

Não precisa explicar.
Incolor, inodoro e sem dor.

Se o usuário tiver qualquer interesse de saber informação sobre o brilho da tela ele pode acessar *UIScreen*.
Qualquer coisa fora do escopo de funcionalidade padrão desconfigura a claresa da classe e deve ser removido de escopo.
Isso explica também como tudo que pode ser feito atualmente na classe foi explicado nesse texto.
Suas funcionalidades extras e seu potencial serão explorados mantendo uniformidade e simplicidade na interface.

Pretendo criar estilos gráficos para Apps e visões padrão e fazer bootstraps de classes *Controller*.
Isso fará com que qualquer iniciante possa colocar o Ambience para rodar em questão de minutos sem de preocupar com compactibilidade nem escrever mais código.
