import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    let models = Model.createModels()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self

        collectionView.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: 100)
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath)

        if let cell = cell as? CustomCell {
            cell.setupCell(model: models[indexPath.row])
        }

        return cell
    }
}

