//Isaac Seemann
//3-26-2020
//
//Abstract bank account class enncapsulating shared functionality of sub-classes,
//checking and savings account.
public abstract class AbstractBankAccount {
    
    protected String bankName;
    protected String acctOwner;
    protected String acctType;
    protected Integer acctNum;
    protected Decimal acctBalance;
    protected List<String> transHistory;
    
    //abstract contructor instantiated from sub-class contructor
    public AbstractBankAccount(String nameOfBank, String patronName, String inacctType){
        this.bankName = nameOfBank;
        this.acctOwner = patronName;
        this.acctType = inacctType;
        this.acctNum = Math.round((Math.random()*90000000)+10000000);
        this.acctBalance = 0.00;
        this.transHistory = new List<String>();
    }
    
    //Add a increase the account balance of given account and add record to account's transaction log. 
    public String deposit(Decimal amount){
        String message;
        if(amount > 0){
            this.acctBalance += amount;
            message = '$'+amount.setScale(2)+' added to your '+this.acctType+': #'+this.acctNum+
                '\nCurrent balance: $'+this.acctBalance.setScale(2);
            this.transHistory.add('$'+amount.setScale(2)+' deposited on '+Date.today());
        }else{
            message = 'Error: Please deposit a postive amount of money!';
        }
        return message;
    }
    //withdrawl action overriden in sub-classes
    public virtual String withdraw(Decimal amount){
        return 'Abstract withdrawl';
    }
    //print account details including transaction history in descending order
    public String viewAcct(){
        String message;
        message = this.acctType+'\nAccount Number: '+this.acctNum+'\nAssociated Bank: '+this.bankName+'\nAccount Owner: '+this.acctOwner+'\nAccount Balance: $'+this.acctBalance.setScale(2);
        
        if(this.transHistory.size() != 0){
            Integer acctRecord = this.transHistory.size()-1;
            for(;acctRecord >= 0; acctRecord--){
                message += '\n'+this.transHistory[acctRecord];
            }
        }
        return message;
    }
    //move a positive amount from one account to another. log the transfer in both accounts.
    //allows subvertion of savings account withdrawl restriction.
    public String transfer(AbstractBankAccount otherAcct, Decimal amount){
        String message;
        if((otherAcct != null)&&(amount > 0)){
            this.acctBalance -= amount;
            message = '$'+amount.setScale(2)+' is being transfered to account #'+otherAcct.acctNum+
                '\nCurrent balance: $'+this.acctBalance.setScale(2);
            this.transHistory.add('$'+amount.setScale(2)+' was trasfered to account #'+otherAcct.acctNum+' '+Date.today());
            otherAcct.acctBalance+=amount;
            otherAcct.transHistory.add('$'+amount.setScale(2)+' was trasfered from account #'+this.acctNum+' '+Date.today());
        }else{
            message = 'Error: Insufficent funds to transfer or invalid account';
        }
        return message;
    }
}