class CompletedOrder < ApplicationRecord
  include Reportable
  belongs_to :order
  belongs_to :client
  belongs_to :payment_method
  belongs_to :order_status
  belongs_to :salinity
  before_save :set_client_id
  after_create :make_report_pdf
  
  validates :client_name,presence: {message: "ФИО обязательно"}
  validates :client_phone,presence: {message: "Телефон обязательно"},numericality: { only_integer: true,message: "В номере должны быть только цифры" },length: {is: 10,message: "Длина номера должна составлять 10 цифр"}
  validates :adress_delivery,presence: {message: "Адрес доставки обязательно"}
  validates :completed_at,presence: {message: "Время выполнения заказа обязательно"}
  
  scope :today, ->(){where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)}
  scope :start_date_filter, -> (start_date) {where("created_at >= ?", start_date.beginning_of_day)}
  scope :end_date_filter, -> (end_date) {where("created_at <= ?", end_date.end_of_day)}
  
  def address
    "Украина Харьков #{adress_delivery}"
  end
  
  private
  
  def set_client_id
    client = Client.find_or_initialize_by(:phone => client_phone)
    if client.new_record?
      client[:name] = client_name
      client.save
    end
    self[:client_id] = client.id
  end
  
  def make_report_pdf
    ReportPDF.new(:page_size => "A4").make_report(self)
  end
end
