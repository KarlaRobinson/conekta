class StaticPagesController < ApplicationController
	def credit
		p "///////"*10
		p "begin charge"
		begin
		  @charge = Conekta::Charge.create({
		    "amount"=> 51000,
		    "currency"=> "MXN",
		    "description"=> "Pizza Delivery",
		    "reference_id"=> "orden_de_id_interno",
		    "card"=> params[:conektaTokenId],  # Ej. "tok_a4Ff0dD2xYZZq82d9" tok_test_visa_4242
		    "details"=> {
		      "name"=> "Arnulfo Quimare",
		      "phone"=> "403-342-0642",
		      "email"=> "logan@x-men.org",
		      "customer"=> {
		        "logged_in"=> true,
		        "successful_purchases"=> 14,
		        "created_at"=> 1379784950,
		        "updated_at"=> 1379784950,
		        "offline_payments"=> 4,
		        "score"=> 9
		      },
		      "line_items"=> [{
		        "name"=> "Box of Cohiba S1s",
		        "description"=> "Imported From Mex.",
		        "unit_price"=> 20000,
		        "quantity"=> 1,
		        "sku"=> "cohb_s1",
		        "category"=> "food"
		      }],
		      "billing_address"=> {
		        "street1"=>"77 Mystery Lane",
		        "street2"=> "Suite 124",
		        "city"=> "Darlington",
		        "state"=>"NJ",
		        "zip"=> "10192",
		        "country"=> "Mexico",
		        "tax_id"=> "xmn671212drx",
		        "company_name"=>"X-Men Inc.",
		        "phone"=> "77-777-7777",
		        "email"=> "purshasing@x-men.org"
		      }
		    }
		  })

		   p "*******"*10
		   p @charge.status
		rescue Conekta::ParameterValidationError => e
		  puts e.message_to_purchaser 
		  #puts "alguno de los parámetros fueron inválidos"

		rescue Conekta::ProcessingError => e
		  puts e.message_to_purchaser 
		  #puts "la tarjeta no pudo ser procesada"

		rescue Conekta::Error => e
		  puts e.message_to_purchaser 
		  #puts "un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto"
		end
	end

	def spei
		begin
		  charge = Conekta::Charge.create({
		    "description"=> "Stogies",
		    "amount"=> 20000,
		    "currency"=> "MXN",
		    "reference_id"=> "9839-wolf_pack",
		    "bank"=> {
		      "type"=> "spei"
		    },
		    "details"=> {
		      "name"=> "Arnulfo Quimare",
		      "phone"=> "403-342-0642",
		      "email"=> "logan@x-men.org",
		      "customer"=> {
		        "logged_in"=> true,
		        "successful_purchases"=> 14,
		        "created_at"=> 1379784950,
		        "updated_at"=> 1379784950,
		        "offline_payments"=> 4,
		        "score"=> 9
		      },
		      "line_items"=> [{
		        "name"=> "Box of Cohiba S1s",
		        "description"=> "Imported From Mex.",
		        "unit_price"=> 20000,
		        "quantity"=> 1,
		        "sku"=> "cohb_s1",
		        "category"=> "food"
		      }],
		      "billing_address"=> {
		        "street1"=>"77 Mystery Lane",
		        "street2"=> "Suite 124",
		        "city"=> "Darlington",
		        "state"=>"NJ",
		        "zip"=> "10192",
		        "country"=> "Mexico",
		        "tax_id"=> "xmn671212drx",
		        "company_name"=>"X-Men Inc.",
		        "phone"=> "77-777-7777",
		        "email"=> "purshasing@x-men.org"
		      }
		    }
		  })
		rescue Conekta::ParameterValidationError => e
		  puts e.message_to_purchaser 
		#alguno de los parámetros fueron inválidos
		rescue Conekta::ProcessingError => e
		  puts e.message_to_purchaser 
		#la tarjeta no pudo ser procesada
		rescue Conekta::Error => e
		  puts e.message_to_purchaser 
		#un error ocurrió que no sucede en el flujo normal de cobros como por ejemplo un auth_key incorrecto
		end
	end
end
