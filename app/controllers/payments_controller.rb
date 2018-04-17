class PaymentsController < ApplicationController
  after_action :update_funded_amount, only: :create

  def create
    @loan = Loan.find(params[:loan_id])
    @payment = Payment.new(
                                payment_amount: params[:payment_amount],
                                loan_id: params[:loan_id]
                                )
    if (params[:payment_amount]).to_i <= @loan.funded_amount.to_i
        @payment.save
        # update_funded_amount
        render :show
    else
      render json: {message: "Your Payment Exceeds the Balance Due"} 
      # render json: @payment.errors.full_messages, status: 422
    end
  end

  def show
    render json: Payment.find(params[:id])
  end

  private

  def update_funded_amount
    @new_amount = @loan.funded_amount - @payment.payment_amount
    p @new_amount
    @loan.update(funded_amount: @new_amount)
  end  
end
