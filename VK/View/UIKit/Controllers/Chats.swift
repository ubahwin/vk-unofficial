import UIKit

class Chats: UIViewController {
    lazy var navBarView: NavBarView = {
        let navBar = NavBarView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 52))
        return navBar
    }()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width, height: 100)
        layout.minimumLineSpacing = 10

        let collectionView = UICollectionView(
            frame: CGRect(
                x: 0,
                y: navBarView.frame.maxY,
                width: view.frame.width,
                height: view.frame.height - 49
            ),
            collectionViewLayout: layout
        )

        collectionView.register(ChatCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.register(
            UICollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "Header"
        )

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)

        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false

        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Поиск"
        searchController.searchBar.sizeToFit()
        searchController.searchBar.translatesAutoresizingMaskIntoConstraints = false

        return searchController
    }()

    var dataArray = ["Ячейка 1", "Ячейка 2", "Ячейка 3", "Ячейка 4", "Ячейка 5", "Ячейка 1", "Ячейка 2", "Ячейка 3", "Ячейка 4", "Ячейка 5", "Ячейка 1", "Ячейка 2", "Ячейка 3", "Ячейка 4", "Ячейка 5"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(navBarView)
        view.addSubview(collectionView)
    }

    @objc func button1Tapped() { }
    @objc func button2Tapped() { }
}

extension Chats: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ChatCollectionCell

        let item = dataArray[indexPath.item]

        cell.configure(with: item)

        return cell
    }
}

extension Chats: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) { }
}

extension Chats: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "Header",
            for: indexPath
        )

        header.addSubview(searchController.searchBar)

        NSLayoutConstraint.activate([
            searchController.searchBar.leadingAnchor.constraint(equalTo: header.leadingAnchor),
            searchController.searchBar.trailingAnchor.constraint(equalTo: header.trailingAnchor),
            searchController.searchBar.topAnchor.constraint(equalTo: header.topAnchor),
            searchController.searchBar.bottomAnchor.constraint(equalTo: header.bottomAnchor)
        ])

        return header
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 50)
    }
}
