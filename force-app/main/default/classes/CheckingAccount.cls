//Isaac Seemann
//3-26-2020
//Extended implementation of AbstractBankAccount. Instantiation requires a bank name and person's name.
public class CheckingAccount extends AbstractBankAccount{
    //constructor uses AbstractBankAccount constructor with a defined account type value.
    public CheckingAccount(String nameOfBank, String patronName){
        super(nameOfBank, patronName, 'Checking Account');
    }
    //overriden function from AbstractBankAccount class. If value is valid, reduce account's balance and log event.
    public override String withdraw(Decimal amount){
        String message;
        if((amount > 0) && (amount < this.acctNum)){
            this.acctBalance -= amount;
            message = '$'+amount.setScale(2)+' is being withdrawn from your checking account: #'+this.acctNum+
                '\nCurrent balance: $'+this.acctBalance.setScale(2);
            this.transHistory.add('$'+amount.setScale(2)+' withdrawn on '+Date.today());
        }else if(amount > this.acctNum){
            message = 'Insufficent funds!';
        }else{
            message = 'Error: Please withdraw a postive amount of money!';
        }
        return message;
    }
}