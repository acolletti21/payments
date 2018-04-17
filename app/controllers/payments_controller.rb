class PaymentsController < ApplicationController
  def create
    @loan = Loan.find(params[:loan_id])
    @payment = Payment.new(
                                payment_amount: params[:payment_amount],
                                loan_id: params[:loan_id]
                                )
    if (params[:payment_amount]).to_i <= @loan.funded_amount.to_i
        @payment.save
        render :show
    else
      render json: {message: "Your Payment Exceeds the Balance Due"} 
      # render json: @payment.errors.full_messages, status: 422
    end
  end

  def show
    render json: Payment.find(params[:id])
  end
end
