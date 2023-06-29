class UsersController < ApplicationController
	def login
		session.delete(:current_user_id)
	end

	def new
		@user= User.new
	end

	def create
		@user=User.new(article_param)
		if @user.save
			redirect_to :root
		else
			render  :new, status: :unprocessable_entity
		end
  end
    
  def hello
  	unless session[:current_user_id].nil? 
      #@i=params[:e]
      @i=session[:current_user_id] 
    else
    	redirect_to :root , notice: "Log In Properly OK"
    end
  end

  def login_user
      if user=User.find_by(email: params[:email]) && User.find_by(password: params[:password])
         # user1= User.select(:name).where(email: params[:email])

        #if user=="nikki"
      	session[:current_user_id] = user.name
      	redirect_to my_path#(e: user1)
      else
        redirect_to :root , notice: "Enter valid username And password" 
    end
  end
  def del
    session.delete(:current_user_id)
    redirect_to :root
  end
  private
    def article_param
    	params.require(:user).permit(:name, :contact_integer, :email, :password)
    end
end
