
		class ImportUsersController < ApplicationController

		def index
				book = Spreadsheet.open '/home/cpsc/Sites/simple_cms/USERS.xls'
				sheet1 = book.worksheet 0
				sheet1.each 1 do |row|
							# import spreadsheet values into user object fields
						user = AdminUser.new
						user.last_name=row[0]
						user.first_name=row[1]
						user.username=row[2]
						user.email=row[3]
						user.password='secretpassword'
						user.password_confirmation='secretpassword'
						#user.password_digest= <VALUE PROVIDED BY  BLOWFISH>
			
			 
						if user.save
											# If save succeeds, redirect to the index action
											flash[:notice] = "User created successfully."
										 
								else
											flash[:notice] = "Error creating user."
										 
								end
				end
				redirect_to(:controller => 'access', :action => 'index')
			end

		end 