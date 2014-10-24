class AccountsController < ApplicationController
  include ApplicationHelper
  def signingup
    @account = Account.new(account_params)
    @account.active = false;
    if @account.save
      UserMailer.signup_mail(@account).deliver
      redirect_to accounts_signup_success_path,:flash => { :ok => true }
    else
      #redirect_to accounts_signup_path, :flash => {:account => @account}
      @title = "SignUp"
      @title2 = "SignUp"
      render :signup
    end
  end

  def edit
  end

  def login
  end

  def signup
    @account = Account.new()
    @title = "SignUp"
    @title2 = "SignUp"
  end

  def signup_success
    if flash[:ok]
      @title = "SignUp"
      @title2 = "Confirmation"
    else
      redirect_to home_path
    end

  end

  private
    def account_params
      params.require(:account).permit(:name, :company, :email, :password,
                                   :password_confirmation, :terms_of_service, :agreereceivenews)
    end

end
