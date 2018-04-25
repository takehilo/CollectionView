import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        print("CustomCell initialized")
    }

    func setupCell(model: Model) {
        title.text = model.title

        if let text = model.subTitle {
            subTitle.text = text
        }

        self.backgroundColor = .lightGray
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        title.text = ""
        subTitle.text = ""
    }
}
