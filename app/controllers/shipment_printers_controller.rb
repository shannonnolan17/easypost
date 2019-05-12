require 'easypost'

class ShipmentPrintersController < ApplicationController
  before_action :set_shipment_printer, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /shipment_printers
  # GET /shipment_printers.json
  def index
    @shipment_printers = ShipmentPrinter.all
  end

  # GET /shipment_printers/1
  # GET /shipment_printers/1.json
  def show
  end

  # GET /shipment_printers/new
  def new
    @shipment_printer = ShipmentPrinter.new
  end

  # GET /shipment_printers/1/edit
  def edit
  end

  # POST /shipment_printers
  # POST /shipment_printers.json
  def create
    p "*********"
    p params
    EasyPost.api_key = ENV['EASY_POST_API']
    to_address = EasyPost::Address.create(
      :company => params[:to_address][:company],
      :name => params[:to_address][:name],
      :street1 => params[:to_address][:street1],
      :street2 => params[:to_address][:street2],
      :city => params[:to_address][:city],
      :state => params[:to_address][:state],
      :zip => params[:to_address][:zip],
      :country => params[:to_address][:country],
      :phone => params[:to_address][:phone]
    )
    from_address = EasyPost::Address.create(
      :company => params[:from_address][:company],
      :street1 => params[:from_address][:street1],
      :street2 => params[:from_address][:street2],
      :city => params[:from_address][:city],
      :state => params[:from_address][:state],
      :zip => params[:from_address][:zip],
      :phone => params[:from_address][:phone]
    )

    parcel = EasyPost::Parcel.create(
      :width => params[:parcel][:width],
      :length => params[:parcel][:length],
      :height => params[:parcel][:height],
      :weight => params[:parcel][:weight]
    )

    customs_item = EasyPost::CustomsItem.create(
      :description => params[:parcel][:description],
      :quantity => params[:parcel][:quantity],
      :value => params[:parcel][:value],
      :weight => params[:parcel][:weight],
      :origin_country => 'us',
      :hs_tariff_number => 123456
    )
    customs_info = EasyPost::CustomsInfo.create(
      :integrated_form_type => 'form_2976',
      :customs_certify => true,
      :customs_signer => 'Dr. Pepper',
      :contents_type => 'gift',
      :contents_explanation => '', # only required when contents_type => 'other'
      :eel_pfc => 'NOEEI 30.37(a)',
      :non_delivery_option => 'abandon',
      :restriction_type => 'none',
      :restriction_comments => '',
      :customs_items => [customs_item]
    )

    shipment = EasyPost::Shipment.create(
      :to_address => to_address,
      :from_address => from_address,
      :parcel => parcel,
      :customs_info => customs_info
    )

    shipment.buy(
      :rate => shipment.lowest_rate
    )
    byebug
    shipment.insure(amount: 100)
    shipment.postage_label.label_url

    @shipment_printer = ShipmentPrinter.create(label_url: shipment.postage_label.label_url)
    if @shipment_printer.save
      redirect_to shipment.postage_label.label_url
    end

  end

  # PATCH/PUT /shipment_printers/1
  # PATCH/PUT /shipment_printers/1.json
  def update
    respond_to do |format|
      if @shipment_printer.update(shipment_printer_params)
        format.html { redirect_to @shipment_printer, notice: 'Shipment printer was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipment_printer }
      else
        format.html { render :edit }
        format.json { render json: @shipment_printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipment_printers/1
  # DELETE /shipment_printers/1.json
  def destroy
    @shipment_printer.destroy
    respond_to do |format|
      format.html { redirect_to shipment_printers_url, notice: 'Shipment printer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment_printer
      @shipment_printer = ShipmentPrinter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_printer_params
      params.fetch(:shipment_printer, {})
    end
end
