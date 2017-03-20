class SitesController < ApplicationController

 before_action :set_user, only: [:show, :edit, :update, :destroy]
 before_action :require_user, only: [:reserve, :createreserve, :home, :_adminview]

 layout 'admin', :only => [:adminview, :reservations, :user, :adminshow]

#For Both Retailer and Admin Navigation 
 
def home

 @account_type = session[:user_type]
 
 @product=Product.all
      
end


def about

end

#for RetailerPage
def retailerproduct  #Product Navigation Of Retailer

@product=Product.all

end

def reserve   #Reserve Buttton to Reservation Form

@reservation=Reservation.new
@product=Product.find(params[:id])
@usern= current_user.first ,current_user.last
@uname= current_user.id
end



def createreserve #For Posting Data to Reservation DB

@reservation=Reservation.new
@product=Product.find(params[:id])#For Rendering
@usern= current_user.first ,current_user.last #For Rendering
@reservation.name=params[:reservation][:name]
@reservation.product=params[:reservation][:product]
@reservation.quantity=params[:reservation][:quantity]
@reservation.status=params[:reservation][:status]
 respond_to do |format|
      if @reservation.save
        format.html { redirect_to "/product", notice: 'Reservation was successfully created.' }
  
      else
        format.html { render :reserve }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
end


def ok
@reservation=Reservation.find(params[:id])	
@reservation.update_attribute(:status,"Sent") 

redirect_to '/reservation'
end

def pending
@reservation=Reservation.find(params[:id])	
@reservation.update_attribute(:status,"Pending") 

redirect_to '/reservation'
end

def userProfile
@user=User.where(id:session[:user_id])
end




#for AdminPage
def adminview   # For the Product Navigation of Admin

@product=Product.all

end
def adminshow   # For the Admin Product Show

@product=Product.find(params[:id])

end

def user #For Viewing Nworld Users

@user=User.where(account_type:'retailer')

end

def admindelete #for deleting a product
@product=Product.find(params[:id])
@product.destroy
redirect_to '/home'
end

def reservations  #For the Reservation List in Admin Navigation
@reservation=Reservation.all
end

def deletereserve  #For delete Action in the Reservation List
		
@reservation=Reservation.find(params[:id])
@reservation.destroy
redirect_to '/reservation'
	
end

def usershow





end





end
