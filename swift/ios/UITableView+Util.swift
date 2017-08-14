import UIKit

extension UITableView {
    func registerCell<T: UITableViewCell>(type: T.Type, usingNib: Bool = false) {
        if usingNib {
            guard let nibName = String(describing: T.self).components(separatedBy: ".").last else {
                fatalError()
            }
            let nib = UINib(nibName: nibName, bundle: nil)
            register(nib, forCellReuseIdentifier: String(describing: T.self))
        } else {
            register(T.self, forCellReuseIdentifier: String(describing: T.self))
        }
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
}
