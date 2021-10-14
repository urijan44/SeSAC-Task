# SeSAC 1014
## Autometic Dimension
UITableView Autometic Dimension은 셀의 컨텐츠에 따라 자동으로 높이를 계산하는 속성인데

> Return this value from your table view's delegate methods when you want the table view to choose a default value for the given dimension. For example, if you return this constant from tableView(_:heightForHeaderInSection:) or tableView(_:heightForFooterInSection:), the table view uses a height that fits the value returned from tableView(_:titleForHeaderInSection:) or tableView(_:titleForFooterInSection:), if the title is not nil.

기본적으로 cellHeight가 결정되지 않으면 디폴트로 적용되는거 같다?

`heightForRowAt`이 적용되면 비활성화 되는 것 같다.

## Assignment
[이동하기](https://github.com/urijan44/SeSAC-Assignments)
- 내용은 DiffableDataSource 적용 실패기 ㅎㅎ