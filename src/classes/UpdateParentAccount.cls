/**
 * Created by kamil.entsua-mensah on 17.05.2019.
 */

public class UpdateParentAccount implements Queueable {

    private List<Account> accounts;
    private ID parent;

    public UpdateParentAccount(List<Account> records, ID id) {
        this.accounts = records;
        this.parent = id;
    }
    public void execute(QueueableContext context) {
        for (Account account : accounts) {
            account.parentId = parent;
            // perform other processing or callout
        }
        update accounts;
    }

}