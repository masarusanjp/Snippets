import UIKit

final class PickerTableViewController<T: Hashable>: UITableViewController {
    typealias Formatter = (T) -> String
    let items: [T]
    let formatter: Formatter
    var currentSelection: T?
    var didSelectHandler: (T) -> Void = { _ in }

    init(items: [T], formatter: @escaping Formatter) {
        self.items = items
        self.formatter = formatter
        super.init(style: .plain)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = UIColor.cookpad.border
        tableView.registerCell(type: UITableViewCell.self)
    }

    private func dismiss() {
        if let nav = navigationController {
            if nav.viewControllers.count > 1 {
                nav.popViewController(animated: true)
                return
            }
        }
        dismiss(animated: true, completion: nil)
    }

    private func notifyCurrentSelection() {
        if let currentSelection = currentSelection {
            didSelectHandler(currentSelection)
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.accessoryType = currentSelection == items[indexPath.row] ? .checkmark : .none
        cell.selectionStyle = .gray
        cell.textLabel?.text = formatter(items[indexPath.row])

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelection = items[indexPath.row]
        notifyCurrentSelection()
        dismiss()
    }
}
