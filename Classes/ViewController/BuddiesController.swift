import UIKit

class BuddiesController: UITableViewController {
    
    var viewModel = BuddiesViewModel()
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.nbBuddies
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BuddyCell.identifier, for: indexPath) as! BuddyCell
        if let buddy = getBuddy(at: indexPath) {
            cell.configure(buddy: buddy)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBuddy" {
            if let selectedIndexPath = tableView.indexPathForSelectedRow,
                let buddy = getBuddy(at: selectedIndexPath) {
                (segue.destination as? ChatController)?.viewModel = ChatViewModel(buddy: buddy)
            }
        }
    }
    
    @IBAction func addBuddy(_ sender: UIBarButtonItem) {
        // TODO: Implement
    }
    
    func getBuddy(at indexPath: IndexPath) -> Buddy? {
        return viewModel.buddy(at: indexPath.row)
    }
}
