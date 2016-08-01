class PaymentsController < ApplicationController
  load_and_authorize_resource

  def create
    @payment.method = :card
    if @payment.save!
      redirect_to current_student, notice: 'Information about your payment was added!'
    end
  end

  def resource_params
    params.require(:payment).permit(:student_id, :invoice_id, :sum, :comment)
  end
end
