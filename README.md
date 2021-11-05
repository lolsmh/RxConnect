# RxConnect

### Extension of a RxSwift / RxCocoa framework, that makes binding code much cleaner

When coding with RxSwift framework, usually, you would write something like this:

``` swift
class MyClass {
    ...
    let bag = DisposeBag()
    ...
    
    func bind() {
        tableView.rx.itemSelected
            .bind(to: itemSelectedBinder)
            .disposed(by: bag)
        tableView.rx.itemHighlighted
            .bind(to: itemHighlightedBinder)
            .disposed(by: bag)
        ...
    }
    
    ...
}
```
At some point, your binding code can become overwhelmingly big, and the main cause of that - constantly repeting lines of calling the same objects and using the same Dispose Bag.

RxConnect allows to get rid of that, instead offering to you connect functions. Connect asks for a class, with witch you want to connect your subscriptions, and a simple connect closure:

```swift
tableView.rx.connect(self) { events in
    events.itemSelected.bind(to: itemSelectedBinder)
    events.itemHighlighted.bind(to: itemHighlightedBinder)
}
```
Connect closure provides a Reactive extension of a class you using connect on as an argument, and inside you can bind without Dispose Bag

Because this very argument is a Reactive extension, you can make your own classes compatable with RxConnect, inheriting them from ReactiveCompatable

```swift
class ViewModel: ReactiveCompatable {
    var observable1 = PublishRelay<Void>()
    var observable2 = PublishRelay<Void>()
    var observable3 = PublishRelay<Void>()
}
```
And then you can bind your observers through a base variable on a reactive extension

```swift
viewModel.rx.connect(self) { rxViewModel in
    rxViewModel.base.observable1.bind(to: binder1)
    rxViewModel.base.observable2.bind(to: binder2)
    rxViewModel.base.observable3.bind(to: binder3)
}
```
Also, RxConnect works with RxCocoa classes and regular observables, setting you free from Dispose Bag thing

```swift
var relay = PublishRelay<Void>()
relay.connect(self) {
    print("Hello World")
}
```
## Installation
### Cocoapods
```
    pod 'RxConnect', :git => "https://github.com/lolsmh/RxConnect.git"
```
