# Pagenation
```Swift
    mainView.tableView.rx
      .contentOffset
      .filter{$0.y > self.mainView.tableView.contentSize.height - self.mainView.tableView.frame.height}
      .debounce(RxTimeInterval.milliseconds(100), scheduler: MainScheduler.instance)
      .subscribe(onNext: { _ in
        let current = self.viewModel.page.value
        self.viewModel.page.accept(current + 10)
        self.fetchBoard()
      })
      .disposed(by: bag)
```