###Usage
(I will use 1 as the loan id example since that is what's seeded already)

#####To create a payment
POST to localhost:3000/payments
required keys: payment_amount, loan_id

#####To view your new loan balance
navigate to http://localhost:3000/loans/1

#####To view all payments on your loan
navigate to http://localhost:3000/payments?loan_id=1

#####To view an individual payment
navigate to http://localhost:3000/payments/yourPaymentID

# Payments Exercise

Add in the ability to create payments for a given loan using a JSON API call. You should store the payment date and amount. Expose the outstanding balance for a given loan in the JSON vended for `LoansController#show` and `LoansController#index`. The outstanding balance should be calculated as the `funded_amount` minus all of the payment amounts.

A payment should not be able to be created that exceeds the outstanding balance of a loan. You should return validation errors if a payment can not be created. Expose endpoints for seeing all payments for a given loan as well as seeing an individual payment.
