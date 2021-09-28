import UIKit

class MainCollectionViewController: UICollectionViewController {
  

  let movieContents: [Contents] = [MovieStorage.mainSection, MovieStorage.previewSection]

  let random = Int.random(in: 0..<10)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.hidesBarsOnSwipe = true
    
    collectionView.collectionViewLayout = layout()
  }
}

//MARK: - Layout
extension MainCollectionViewController {
  private func layout() -> UICollectionViewLayout {
    return UICollectionViewCompositionalLayout { [weak self] sectionNumber, environment -> NSCollectionLayoutSection? in
      guard let self = self else { return nil }
      
      switch self.movieContents[sectionNumber].section {
      case .main:
        return self.createMainTypeSection()
      case .preview:
        return self.createBasicTypeSection()
      }
    }
  }
  
  private func createBasicTypeSection() -> NSCollectionLayoutSection {
    //item
    let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .estimated(100))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    item.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
    //group
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .fractionalHeight(1))
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
    //section
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    section.contentInsets = .init(top: 0, leading: 5, bottom: 0, trailing: 5)
    
    return section
  }
  
  private func createMainTypeSection() -> NSCollectionLayoutSection {
    //item
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1.5))
    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    //group
    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(0))
    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
    //section
    let section = NSCollectionLayoutSection(group: group)
    section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
    
    let sectionHeader = createSectionHeader()
    section.boundarySupplementaryItems = [sectionHeader]
    
    return section
  }
  
  // Setup Section Header layout
  private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
    //Section Header Size
    let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(30))
    
    //Section Header Layout
    let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    
    return sectionHeader
  }
}

//MARK: - UICollectionView DataSources
extension MainCollectionViewController {
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    2
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return movieContents[section].movies.count
    default:
      return 0
    }
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch movieContents[indexPath.section].section {
    case .main:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MainViewCell.self)", for: indexPath) as? MainViewCell else { fatalError() }
      cell.mainImage.image = movieContents[indexPath.section].movies[random].image
      return cell
    
    case .preview:
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PreviewViewCell.self)", for: indexPath) as? PreviewViewCell else { fatalError() }
      cell.previewImage.image = movieContents[indexPath.section].movies[indexPath.row].image
      return cell
    }
  }
}