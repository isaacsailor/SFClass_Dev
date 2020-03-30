//Isaac Seemann
//3-26-2020
//Extended implementation of AbstractBankAccount. Instantiation requires a bank name and person's name.
public class SavingsAccount extends AbstractBankAccount{
	//constructor uses AbstractBankAccount constructor with a defined account type value.   
    public SavingsAccount(String nameOfBank, String patronName){
        super(nameOfBank, patronName, 'Savings Account');
        
    }
    //overriden function from AbstractBankAccount class. 
    //Money not allowed to be withdraw from savings account.
    public override String withdraw(Decimal amount){
        
        return 'Withdrawls not allowed from savings account!'+ 
            '\nIf you really need to depleat you savings, transfer money to a checking account first.';
    }

}