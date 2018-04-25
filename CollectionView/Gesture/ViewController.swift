import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self

        let pinchGestureRecognizer = UIPinchGestureRecognizer(
            target: self,
            action: #selector(self.handlePinchGesture(sender:))
        )
        collectionView.addGestureRecognizer(pinchGestureRecognizer)
    }

    @objc func handlePinchGesture(sender: UIPinchGestureRecognizer) {
        guard sender.numberOfTouches == 2 else { return }

        let p1 = sender.location(ofTouch: 0, in: collectionView)
        let p2 = sender.location(ofTouch: 1, in: collectionView)
        print(p1, p2)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red

        return cell
    }
}
