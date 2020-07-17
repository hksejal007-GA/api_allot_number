class PhoneNumbersController < ApplicationController
  include ExceptionsHandlerHelper

  # GET /phone_numbers
  def index
    @phone_numbers = PhoneNumber.all.pluck(:number)
    render_object(200, "Lists all allotted numbers", @phone_numbers)
  end

  # POST /phone_numbers OR POST /phone_numbers/:number
  def create
    number = params[:number].present? ? PhoneNumber.check_number(params[:number].to_i) : PhoneNumber.generate_phone_number
    @phone_number = PhoneNumber.new(number: number)
    @phone_number.special = true if params[:number].present? && params[:number].to_i == number
    if @phone_number.save
      render_success(200, "Allots a number", PhoneNumberSerializer.new(@phone_number))
    else
      render_error(202, @phone_number.errors.full_messages.join(', ').capitalize)
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def phone_number_params
      params.require(:phone_number).permit(:number, :special)
    end
end
