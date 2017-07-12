class BankAccount
    attr_reader :account_number, :checkings, :savings

    def initialize 
        @account_number = account_number
        @checkings = 0
        @savings = 0
        @@bank_accounts = bank_accounts + 1
        @interest_rate = 0.01
    end

    private 
    def accountnumber 
        @account_number = rand(0..1,000,000)
        puts account_number
        self
    end

    def checkingsaccount
        puts @checkings
        self
    end

    def savingsaccount
        puts @savings
        self
    end
    
    def depositcheckings(money)
        @checkings = checkings + money 
        puts @checkings
        self
    end

    def depositsavings(money)
        @savings = savings + money
        puts @savings
        self
    end

    def withdrawcheckings(money)
        if @checkings <= 0
            puts "There are insufficient funds in your checkings account. Cannot withdraw"
        else
        @checkings = checkings - money
        end
        self
    end

    def withdrawsavings(money)
        if @savings <= 0
            puts "There are insufficient funds in your savings account. Cannot withdraw"
        else
        @savings = savings - money
        end
        self
    end
    
    def totalcheckings
        puts "You have #{checkings} dollars in your checking account"
        self
    end

    def totalsavings
        puts "You have #{savings} dollars in your savings account"
        self
    end

    def num_of_bank_accounts
        puts "You have #{bank_accounts} on file."
        self
    end

    def account_information
        puts "Account Number: #{account_number}"
        puts "Total Balance Checkings: #{checkings}"
        puts "Total Balance Savings: #{savings}"
        puts "#{interest_rate}"
        self
    end
end
user = BankAccount.new
puts user.num_of_bank_accounts()





#-------------------------------- CORRECT ONE ----------------------------
class BankAccount
  attr_reader :account_number, :checking, :saving

  @@bank_accounts = 0

  def initialize 
    @account_number = create_account
    @checking = 0
    @saving = 0
    @@bank_accounts += 1
    # not accessible since we do not have a reader for it
    @interest_rate = 0.01
  end

  def deposit(account, amount)
    if account.downcase == "checking"
      @checking += amount
    else
      @saving += amount 
    end
  end

  def withdrawal(account, amount)
    if account.downcase == "checking"
      if @checking - amount < 0
        raise "Insufficient Funds, you have #{@checking} in this account"
      else
        @checking -= amount
      end
    else
      if @saving - amount < 0
        raise "Insufficient Funds, you have #{@saving} in this account"
      else
        @saving -= amount
      end
    end
  end

  def total
    "Checking Balance: #{@checking}\nSaving Balance: #{@saving}\nTotal Balance: #{@checking + @saving}"
  end

  def account_information
    "Account Number: #{@account_number}\nInterest Rate: #{@interest_rate}\n#{self.total}" 
  end

  def self.number_of_accounts
    @@bank_accounts
  end

  private
    def create_account
      Array.new(10).map { rand(1..9) }.join
    end
end